class Book {
  final String author;
  final String title;

  Book({
    required this.author,
    required this.title,
  });

  @override
  String toString() => '$author  \t$title';
}

abstract class BooksCollection {
  BooksIterator createIterator();
  int getCount();
  Book getBookByIndex(int index);
}

class MyBooksCollection implements BooksCollection {
  List<Book> books = [];

  MyBooksCollection()
      : books = [
          Book(
              author: 'Швец A.',
              title: 'Погружение в паттерны проектирования.'),
          Book(author: 'Шевчук А.', title: 'Design Patterns via C#.'),
          Book(author: 'Чернышев С.', title: 'Основы DART.'),
          Book(author: 'Фримен Э.', title: 'Паттерны проектирования.'),
          Book(
              author: 'Шмуллер Д.',
              title: 'Освой самостоятельно UML за 24 часа.'),
          Book(
              author: 'Ларман К.',
              title: 'Применение UML 2.0 и шаблонов проектирования.'),
        ];

  @override
  BooksIterator createIterator() => ConcreteIterator(this);

  @override
  int getCount() => books.length;

  @override
  Book getBookByIndex(int index) => books[index];
}

abstract class BooksIterator {
  Book getNext();
  bool hasNext();
  void showAllBooks();
}

class ConcreteIterator implements BooksIterator {
  final BooksCollection _booksCollection;
  int _index = 0;

  ConcreteIterator(this._booksCollection);

  @override
  Book getNext() {
    return _booksCollection.getBookByIndex(_index++);
  }

  @override
  bool hasNext() => _index < _booksCollection.getCount();

  @override
  void showAllBooks() {
    _index = 0;
    print('\n\tВсе книги из коллекции (${_booksCollection.getCount()} шт.):');
    while (hasNext()) {
      print('${_index + 1}.${getNext()}');
    }
  }
}

void main(List<String> args) {
  MyBooksCollection booksCollection = MyBooksCollection();

  BooksIterator iterator1 = booksCollection.createIterator();
  while (iterator1.hasNext()) {
    Book book = iterator1.getNext();
    print(book);
  }

  iterator1.showAllBooks();
}
