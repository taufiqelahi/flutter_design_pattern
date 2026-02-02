class User{
  final String name;
  final String email;

  User(this.name, this.email);
}
class MySqlDatabase{
  void saveUser(User user) {
    // Logic to save user to database
    print('User ${user.name} with email ${user.email} saved to MySQL database.');
  }
}
class UserRepository{
  final MySqlDatabase database;
  UserRepository(this.database);
  void saveUser(User user) {
    database.saveUser(user);
  }
}
//In above code violate Dependency Inversion Principle because UserRepository depends on concrete implementation of MySqlDatabase.
//To adhere to Dependency Inversion Principle, we can introduce an abstraction for the database as shown below:
/*
What is Dependency Inversion Principle?
Dependency Inversion Principle (DIP) is one of the SOLID principles of object-oriented design.
It states that high-level modules should not depend on low-level modules. Both should depend on abstrations. Additionally, abstractions should not depend on details. Details should depend on abstractions.
*/
/*
How to adhere to Dependency Inversion Principle?
Hints:
1.Identify the high-level and low-level modules in your code.
2.Create abstractions (e.g., interfaces or abstract classes) for the low-level modules.
3.Ensure that high-level modules depend on these abstractions rather than concrete implementations.
4.Implement the low-level modules to depend on the abstractions.
*/
abstract class Database{
  void saveUser(User user);
}
class MySqlDatabaseDIP implements Database{
  @override
  void saveUser(User user) {
    // Logic to save user to database
    print('User ${user.name} with email ${user.email} saved to MySQL database.');
  }
}
class ProstgresDatabase implements Database{
  @override
  void saveUser(User user) {
    // Logic to save user to database
    print('User ${user.name} with email ${user.email} saved to Postgres database.');
  }
}
class UserRepositoryDIP{
  final Database database;
  UserRepositoryDIP(this.database);
  void saveUser(User user) {
    database.saveUser(user);
  }
}
//Now, UserRepositoryDIP depends on the Database abstraction rather than a concrete implementation, adhering to the Dependency Inversion Principle. We can easily switch between different database implementations without modifying the UserRepositoryDIP class.
//Tell me what is high-level module and low-level module in above code?
/*
In the above code, the high-level module is the `UserRepositoryDIP` class, and the low-level modules are the concrete implementations of the `Database` interface, such as `MySqlDatabaseDIP` and `PostgresDatabase`.
The high-level module (UserRepositoryDIP) depends on the abstraction (Database interface) rather than the concrete implementations (MySqlDatabaseDIP and PostgresDatabase), which adheres to the Dependency Inversion Principle.
how to identify high-level and low-level modules?
Hints:
1. High-level modules are typically responsible for the overall functionality and business logic of the application, while low-level modules handle specific details and implementations.
2. High-level modules often depend on abstractions, while low-level modules implement these abstractions.



 */
void main(){
  Database mySqlDb = MySqlDatabaseDIP();
  UserRepositoryDIP userRepository = UserRepositoryDIP(mySqlDb);
  User user = User("John Doe", "jhon@gmail.com");
  userRepository.saveUser(user);
  Database postgresDb = ProstgresDatabase();
  UserRepositoryDIP userRepository2 = UserRepositoryDIP(postgresDb);
  userRepository2.saveUser(user);
}