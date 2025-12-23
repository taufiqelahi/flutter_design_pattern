class User{
  final String name;
  final String email;

  User(this.name, this.email);
  void saveUserToDatabase() {
    // Logic to save user to database
    print('User $name with email $email saved to database.');
  }
  void sendWelcomeEmail() {
    // Logic to send welcome email
    print('Welcome email sent to $email.');
  }
}
/// this class violates single responsibility principle
/// it has three responsibilities:handle user data, saving user to database and sending welcome email
/*
What to figure out  Single Responsibility Principle (SRP)?
Hints:
1. Identify different responsibilities in the class.
2. Separate these responsibilities into different classes.
3. Ensure each class has only one reason to change.
*/
/// Refactored code adhering to Single Responsibility Principle (SRP)
class SRP {
  final String name;
  final String email;
  SRP(this.name, this.email);
}
class UserRepository {
  void saveUser(SRP user) {
    // Logic to save user to database
    print('User ${user.name} with email ${user.email} saved to database.');
  }
}
class EmailService {
  void sendWelcomeEmail(String email) {
    // Logic to send welcome email
    print('Welcome email sent to $email.');
  }
}