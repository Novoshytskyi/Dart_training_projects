import 'user.dart';

void main(List<String> arguments) {
  User user1 = User(10, 'Иван', 'Иванов', 25);
  User user2 = User(9, 'Петр', 'Петров', 26);
  User user3 = User(5, 'Василий', 'Васильев', 27);
  User user4 = User(8, 'Григорий', 'Григорьев', 28);
  User user5 = User(4, 'Александр', 'Александров', 29);
  User user6 = User(7, 'Дмитрий', 'Дмитриев', 30);
  User user7 = User(3, 'Сергей', 'Сергеев', 31);
  User user8 = User(6, 'Денис', 'Денисов', 32);
  User user9 = User(2, 'Борис', 'Борисов', 33);
  User user10 = User(1, 'Федор', 'Федоров', 34);

  print(user1.name);

  List<User> usersList = [];

  usersList.add(user1);
  usersList.add(user2);
  usersList.add(user3);
  usersList.add(user4);
  usersList.add(user5);
  usersList.add(user6);
  usersList.add(user7);
  usersList.add(user8);
  usersList.add(user9);
  usersList.add(user10);

  for (var user in usersList) {
    print(user);
  }

  print('---' * 30);

  List<User> sortingUsersList = [...usersList];
  sortingUsersList.sort((a, b) => a.id.compareTo(b.id));

  for (var user in sortingUsersList) {
    print(user);
  }

  print('---' * 30);

  List<User> sortingUsersListReversed = [];

  sortingUsersListReversed = sortingUsersList.reversed.toList();
  for (var user in sortingUsersListReversed) {
    print(user);
  }

  print('---' * 30);

  List<User> sortingByNameUsersList = [...usersList];
  sortingByNameUsersList.sort((a, b) => a.name.compareTo(b.name));

  for (var user in sortingByNameUsersList) {
    print(user);
  }
}
