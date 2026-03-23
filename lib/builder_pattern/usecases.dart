/// builder pattern
/// The Builder Design Pattern is a creational design pattern that allows for the step-by-step construction of complex objects.
/// It separates the construction of an object from its representation, allowing the same construction process to create different representations.
/// The Builder pattern is particularly useful when an object needs to be created with many optional parameters or when the construction process involves multiple steps.
//Example of Builder Design Pattern in Dart

// without builder pattern
class User {
  String name;
  String email;
  String? phone;
  String? address;
  User(this.name, this.email, {this.phone, this.address});
}
//problem with above code is that it can lead to a large number of constructors if we have many optional parameters, and it can be difficult to maintain and read.
//Solution: Use Builder Design Pattern to create User objects with optional parameters in a more flexible and readable way.
class UserBuilder {
  String name;
  String email;
  String? phone;
  String? address;
  UserBuilder(this.name, this.email);
  UserBuilder setPhone(String phone) {
    this.phone = phone;
    return this;
  }
  UserBuilder setAddress(String address) {
    this.address = address;
    return this;
  }
  User build() {
    return User(name, email, phone: phone, address: address);
  }
}
void main() {
  User user1 = UserBuilder("John Doe","john@gmail.com")
      .setPhone("1234567890")
      .setAddress("123 Main St")
      .build();
  print(
      "User1: ${user1.name}, ${user1.email}, ${user1.phone}, ${user1.address}");
}
// In the above code, the UserBuilder class provides a fluent interface for setting optional parameters and building a User object. This approach is more flexible and readable compared to having multiple constructors in the User class.
//copywith method in builder pattern
class UserCopyWith {
  String name;
  String email;
  String? phone;
  String? address;
  UserCopyWith(this.name, this.email, {this.phone, this.address});
  UserCopyWith copyWith({String? name, String? email, String? phone, String? address}) {
    return UserCopyWith(
      name ?? this.name,
      email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}