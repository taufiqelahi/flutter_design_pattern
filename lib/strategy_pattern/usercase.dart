// strategy pattern
// The Strategy pattern is a design pattern that enables selecting an algorithm's behavior at runtime.
// It defines a family of algorithms, encapsulates each one, and makes them interchangeable.
// The Strategy pattern allows the algorithm to vary independently from clients that use it.
// This pattern is particularly useful when you have multiple algorithms for a specific task and want to switch between them without modifying the client code.
// By using the Strategy pattern, you can achieve flexibility and maintainability in your code by separating the algorithm's implementation from the client that uses it.
///without strategy pattern
class DeliveryService {
  double calculateFee(String type, double distance) {
    if (type == "bike") {
      return distance * 10;
    } else if (type == "car") {
      return distance * 20;
    } else if (type == "express") {
      return distance * 35;
    }

    return 0;
  }
}

void main() {
  final service = DeliveryService();

  print(service.calculateFee("bike", 5));
  print(service.calculateFee("car", 5));
}

//problem of above code
/*
1. Violation of Open/Closed Principle: The DeliveryService class is not closed for modification. If we want to add a new delivery type (e.g., "drone"), we would have to modify the calculateFee method, which can lead to bugs and maintenance issues.
2. Lack of flexibility: The calculateFee method is tightly coupled to the delivery types. If we want to change the fee calculation logic for a specific delivery type, we would have to modify the calculateFee method, which can affect other delivery types and lead to unintended consequences.
3. Difficulty in maintenance: If there are any changes or updates to the fee calculation logic for a specific delivery type, we would have to modify the calculateFee method, which can lead to bugs and maintenance issues.
4. Incompatibility with new delivery types: If we want to integrate a new delivery type that has a different fee calculation logic, we would have to modify the calculateFee method to accommodate the new logic, which can be time-consuming and error-prone.
5. Violation of Single Responsibility Principle: The DeliveryService class is responsible for both calculating fees and managing delivery types, which violates the Single Responsibility Principle. It should only be responsible for calculating fees, while the management of delivery types should be handled separately.
 */
///with strategy pattern
abstract class DeliveryStrategy {
  double calculateFee(double distance);
}

class BikeDeliveryStrategy implements DeliveryStrategy {
  @override
  double calculateFee(double distance) {
    return distance * 10;
  }
}

class CarDeliveryStrategy implements DeliveryStrategy {
  @override
  double calculateFee(double distance) {
    return distance * 20;
  }
}

class ExpressDeliveryStrategy implements DeliveryStrategy {
  @override
  double calculateFee(double distance) {
    return distance * 35;
  }
}

class DeliveryServiceWithStrategy {
  final DeliveryStrategy strategy;
  DeliveryServiceWithStrategy(this.strategy);
  double calculateFee(double distance) {
    return strategy.calculateFee(distance);
  }
}

void main2() {
  final bikeService = DeliveryServiceWithStrategy(BikeDeliveryStrategy());
  final carService = DeliveryServiceWithStrategy(CarDeliveryStrategy());
  final expressService = DeliveryServiceWithStrategy(ExpressDeliveryStrategy());
}
//why strategy pattern is better
/*
1. Adherence to Open/Closed Principle: The DeliveryServiceWithStrategy class is closed for modification. If we want to add a new delivery type (e.g., "drone"), we can simply create a new strategy class that implements the DeliveryStrategy interface without modifying the existing code, which promotes maintainability and reduces the risk of bugs.
2. Flexibility: The calculateFee method is decoupled from the delivery types. If we want to change the fee calculation logic for a specific delivery type, we can simply modify the corresponding strategy class without affecting other delivery types, which promotes flexibility and reduces the risk of unintended consequences.
3. Ease of maintenance: If there are any changes or updates to the fee calculation logic for a specific delivery type, we can simply modify the corresponding strategy class without affecting other delivery types, which promotes maintainability and reduces the risk of bugs.
4. Compatibility with new delivery types: If we want to integrate a new delivery type that has a different fee calculation
logic, we can simply create a new strategy class that implements the DeliveryStrategy interface without modifying the existing code, which promotes scalability and reduces the risk of errors.
5. Adherence to Single Responsibility Principle: The DeliveryServiceWithStrategy class is responsible only for calculating fees, while the management of delivery types is handled separately through the strategy classes, which promotes separation of concerns and reduces the risk of bugs and maintenance issues.

 */
