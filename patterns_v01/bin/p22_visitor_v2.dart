class ObjectStructure {
  List<Element> elements = [];

  void add(Element element) {
    elements.add(element);
  }

  void remove(Element element) {
    elements.remove(element);
  }

  void accept(Visitor visitor) {
    for (Element element in elements) {
      element.accept(visitor);
    }
  }
}

abstract class Visitor {
  void visitConfectionery(ConfectioneryElement confectioneryElement);
  void visitDentistry(DentistryElement dentistryElement);
}

class HappyVisitor extends Visitor {
  @override
  void visitConfectionery(ConfectioneryElement confectioneryElement) {
    confectioneryElement.buyCake();
  }

  @override
  void visitDentistry(DentistryElement dentistryElement) {
    dentistryElement.treatTooth();
  }
}

class SadVisitor extends Visitor {
  @override
  void visitConfectionery(ConfectioneryElement confectioneryElement) {
    confectioneryElement.buyCake();
  }

  @override
  void visitDentistry(DentistryElement dentistryElement) {
    dentistryElement.treatTooth();
  }
}

abstract class Element {
  void accept(Visitor visitor);
}

class ConfectioneryElement extends Element {
  @override
  void accept(Visitor visitor) {
    if (visitor is HappyVisitor) {
      visitor.visitConfectionery(this);
    }
  }

  void buyCake() {
    print('Купил торт.');
  }
}

class DentistryElement extends Element {
  @override
  void accept(Visitor visitor) {
    if (visitor is SadVisitor) {
      visitor.visitDentistry(this);
    }
  }

  void treatTooth() {
    print('Вылечил зуб.');
  }
}

void main() {
  ObjectStructure structure = ObjectStructure();

  structure.add(ConfectioneryElement());
  structure.add(DentistryElement());

  structure.accept(HappyVisitor());
  structure.accept(SadVisitor());
}
