

/// Question: How to implement a Singleton Design Pattern in Dart using both eager and lazy initialization approaches?
/// Answer:
// Eager Initialization Approach
class EagerSingleton {
  // Private static instance of the class
  static final EagerSingleton _instance = EagerSingleton._internal();
  // Private constructor
  EagerSingleton._internal();
  // Factory constructor to return the same instance
  factory EagerSingleton() {
    return _instance;
  }
  void showMessage() {
    print("Eager Singleton Instance");
  }
}
// Lazy Initialization Approach
class LazySingleton {
  // Private static instance of the class
  static LazySingleton? _instance;
  // Private constructor
  LazySingleton._internal();
  // Factory constructor to return the same instance
  factory LazySingleton() {
    _instance ??= LazySingleton._internal();
    return _instance!;
  }
  void showMessage() {
    print("Lazy Singleton Instance");
  }
}
// Usage
void main() {
  // Eager Singleton
  var eagerSingleton1 = EagerSingleton();
  var eagerSingleton2 = EagerSingleton();
  print(identical(eagerSingleton1, eagerSingleton2)); // true
  eagerSingleton1.showMessage();
  // Lazy Singleton
  var lazySingleton1 = LazySingleton();
  var lazySingleton2 = LazySingleton();
  print(identical(lazySingleton1, lazySingleton2)); // true
  lazySingleton1.showMessage();
}
///
/*
 In the above code, we have implemented the Singleton Design Pattern in Dart using both eager and lazy initialization approaches.
 In the eager initialization approach, the instance is created at the time of class loading, while in the lazy initialization approach, the instance is created only when it is needed for the first time.
 Both approaches ensure that only one instance of the class is created and provide a global point of access to that instance.
  */