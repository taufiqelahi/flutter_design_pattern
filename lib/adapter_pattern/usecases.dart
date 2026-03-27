// adapter pattern
/*
The Adapter Design Pattern is a structural design pattern that allows objects with incompatible interfaces to work together.
 It acts as a bridge between two incompatible interfaces, allowing them to communicate and collaborate without modifying their existing code.
 The Adapter pattern is particularly useful when integrating third-party libraries or legacy code that cannot be changed, as it provides a way to adapt the existing code to fit the new requirements without altering the original codebase.
 The Adapter pattern typically involves creating an adapter class that implements the target interface and holds a reference to the adaptee (the existing class with the incompatible interface).
 The adapter class translates the requests from the target interface to the adaptee's interface, allowing the two to work together seamlessly.

 */
/// What is incompatible interface?
/*
An incompatible interface refers to a situation where two classes or components have different method signatures, data formats, or communication protocols that prevent them from working together directly.
In such cases, the classes cannot interact with each other without some form of adaptation or translation.
For example, if one class expects data in JSON format while another class provides data in XML format, they have incompatible interfaces.
To resolve this issue, an adapter can be created to convert the data from one format to another, allowing the two classes to communicate effectively without modifying their existing code.
Incompatible interfaces can arise in various scenarios, such as when integrating third-party libraries, working with legacy code, or when different components of a system have been developed independently without consideration for interoperability.
The Adapter Design Pattern is a common solution for addressing incompatible interfaces by providing a way to bridge the gap between them and enable seamless communication.
 Examples of incompatible interfaces include:
1. Different method signatures: If two classes have methods with different names, parameters, or return types, they cannot be used interchangeably without adaptation.
2. Different data formats: If one class expects data in a specific format (e.g., JSON) while another class provides data in a different format (e.g., XML), they have incompatible interfaces.
3. Different communication protocols: If two classes use different communication protocols (e.g., REST vs. SOAP), they cannot interact directly without an adapter to translate between the protocols.

 */
/// Without Adapter Pattern
class OldPaymentGateway {
  void processPayment(double amount) {
    print("Processing payment of \$${amount} through OldPaymentGateway");
  }
}
class PaymentService {
  final OldPaymentGateway oldPaymentGateway;
  PaymentService(this.oldPaymentGateway);
  void makePayment(double amount) {
    oldPaymentGateway.processPayment(amount);
  }
}
///Problem of above code:
/*
1. Tight coupling: The PaymentService class is tightly coupled to the OldPaymentGateway class.
   If we want to switch to a new payment gateway, we would have to modify the PaymentService class, which violates the Open/Closed Principle.
2. Lack of flexibility: The PaymentService class can only work with the OldPaymentGateway.
   If we want to use a different payment gateway, we would have to create a new PaymentService class for each gateway, which is not scalable and leads to code duplication.
3. Difficulty in maintenance: If there are any changes or updates to the OldPaymentGateway, we would have to modify the PaymentService class, which can lead to bugs and maintenance issues.
4. Incompatibility with new payment gateways: If we want to integrate a new payment gateway that has a different interface than the OldPaymentGateway, we would have to modify the PaymentService class to accommodate the new interface, which can be time-consuming and error-prone.
5. Violation of Single Responsibility Principle: The PaymentService class is responsible for both processing payments and managing the payment gateway, which violates the Single Responsibility Principle.
   It should only be responsible for processing payments, while the management of the payment gateway should be handled separately.

 */
/// With Adapter Pattern
class NewPaymentGateway {
  void pay(double amount) {
    print("Paying \$${amount} through NewPaymentGateway");
  }
}
class PaymentGatewayAdapter extends OldPaymentGateway {
  final NewPaymentGateway newPaymentGateway;
  PaymentGatewayAdapter(this.newPaymentGateway);
  @override
  void processPayment(double amount) {
    newPaymentGateway.pay(amount);
  }
}
void main() {
  // Using OldPaymentGateway without Adapter
  OldPaymentGateway oldGateway = OldPaymentGateway();
  PaymentService paymentService = PaymentService(oldGateway);
  paymentService.makePayment(100.0);
  // Using NewPaymentGateway with Adapter
  NewPaymentGateway newGateway = NewPaymentGateway();
  PaymentGatewayAdapter adapter = PaymentGatewayAdapter(newGateway);
  PaymentService paymentServiceWithAdapter = PaymentService(adapter);
  paymentServiceWithAdapter.makePayment(200.0);
}
// target interface: OldPaymentGateway
// adaptee: NewPaymentGateway
// adapter: PaymentGatewayAdapter
