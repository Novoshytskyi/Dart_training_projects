class Receiver {
  Receiver();

  int _currentPositionX = 0;
  int _currentPositionY = 0;

  static const int _moveStep = 5;

  void moveLeft() {
    _currentPositionX -= _moveStep;
    _printMessage('\u{2190} ВЛЕВО');
  }

  void moveRight() {
    _currentPositionX += _moveStep;
    _printMessage('\u{2192} ВПРАВО');
  }

  void moveUp() {
    _currentPositionY += _moveStep;
    _printMessage('\u{2191} ВВЕРХ');
  }

  void moveDown() {
    _currentPositionY -= _moveStep;
    _printMessage('\u{2193} ВНИЗ');
  }

  void showPosition() {
    print('\tТекущая позиция X = $_currentPositionX, Y = $_currentPositionY.');
  }

  void _printMessage(String string) {
    print(
        '$string на $_moveStep точек.\tКоордината (X = $_currentPositionX, Y = $_currentPositionY)');
  }
}

abstract class Command {
  abstract final Receiver receiver;

  void execute();
}

class MoveLeftCommand implements Command {
  MoveLeftCommand(this.receiver);

  @override
  final Receiver receiver;

  @override
  void execute() => receiver.moveLeft();
}

class MoveRightCommand implements Command {
  MoveRightCommand(this.receiver);

  @override
  final Receiver receiver;

  @override
  void execute() => receiver.moveRight();
}

class MoveUpCommand implements Command {
  MoveUpCommand(this.receiver);

  @override
  final Receiver receiver;

  @override
  void execute() => receiver.moveUp();
}

class MoveDownCommand implements Command {
  MoveDownCommand(this.receiver);

  @override
  final Receiver receiver;

  @override
  void execute() => receiver.moveDown();
}

class ShowPositionCommand implements Command {
  ShowPositionCommand(this.receiver);

  @override
  final Receiver receiver;

  @override
  void execute() => receiver.showPosition();
}

class Invoker {
  Invoker();

  final List<String> _logs = [];
  final List<Command> _lodCommands = [];
  int _countCommand = 0;

  void executeCommand(Command command) {
    command.execute();
    if (command.runtimeType != ShowPositionCommand) {
      _lodCommands.add(command);
      _logs.add('${DateTime.now()} \t${command.runtimeType}');
      _countCommand++;
    }
  }

  void redoLastCommand() {
    final Command command = _lodCommands.last;

    print('  Повтор команды:\t${command.runtimeType}');
    executeCommand(command);
  }

  void undoLastCommand(Receiver receiver) {
    final Command command = _lodCommands.last;

    print('  Отмена последней команды: ${command.runtimeType}');
    // _logs.removeLast();  //?
    _lodCommands.removeLast();
    switch (command.runtimeType) {
      case MoveLeftCommand:
        executeCommand(MoveRightCommand(receiver));
      case MoveRightCommand:
        executeCommand(MoveLeftCommand(receiver));
      case MoveUpCommand:
        executeCommand(MoveDownCommand(receiver));
      case MoveDownCommand:
        executeCommand(MoveUpCommand(receiver));
    }
  }

  void printLogCommand() {
    print('\n\tlog: (Выполнено команд: $_countCommand)');
    for (final String log in _logs) {
      print(log);
    }
  }
}

void main(List<String> args) {
  Receiver receiver = Receiver();
  Invoker invoker = Invoker();

  invoker.executeCommand(ShowPositionCommand(receiver));

  invoker.executeCommand(MoveUpCommand(receiver));
  invoker.executeCommand(MoveUpCommand(receiver));

  invoker.executeCommand(MoveRightCommand(receiver));
  invoker.executeCommand(MoveRightCommand(receiver));

  invoker.executeCommand(MoveDownCommand(receiver));
  invoker.executeCommand(MoveDownCommand(receiver));

  invoker.executeCommand(MoveLeftCommand(receiver));
  invoker.executeCommand(MoveLeftCommand(receiver));

  invoker.executeCommand(ShowPositionCommand(receiver));

  invoker.printLogCommand();

  invoker.undoLastCommand(receiver);

  invoker.redoLastCommand();
  invoker.redoLastCommand();

  invoker.executeCommand(ShowPositionCommand(receiver));

  invoker.undoLastCommand(receiver);

  invoker.executeCommand(ShowPositionCommand(receiver));

  invoker.printLogCommand();
}
