abstract class SmartDevice{
  void call();
  void sendEmail();
  void browseInternet();
  void takePhoto();

}
class Smartphone implements SmartDevice{
  @override
  void call() {
    print("Making a call from smartphone");
  }
  @override
  void sendEmail() {
    print("Sending email from smartphone");
  }
  @override
  void browseInternet() {
    print("Browsing internet from smartphone");
  }
  @override
  void takePhoto() {
    print("Taking photo from smartphone");
  }
}
class SmartWatch implements SmartDevice{
  @override
  void call() {
    print("Making a call from smartwatch");
  }
  @override
  void sendEmail() {
    throw UnimplementedError("Smartwatch cannot send emails");
  }
  @override
  void browseInternet() {
    throw UnimplementedError("Smartwatch cannot browse internet");
  }
  @override
  void takePhoto() {
    throw UnimplementedError("Smartwatch cannot take photos");
  }
}
// in above code SmartWatch is forced to implement methods that it cannot support, violating the Interface Segregation Principle.
// To adhere to Interface Segregation Principle, we can split the SmartDevice interface into smaller, more specific interfaces as shown below:
/*
What is interface segregation principle?
Interface Segregation Principle (ISP) is one of the SOLID principles of object-oriented design.
It states that no client should be forced to depend on methods it does not use. In other words, interfaces should be specific to the clients that use them, rather than having a single, general-purpose interface.
  */
 /*
How to adhere to Interface Segregation Principle?
Hints:
1.Identify the different functionalities that may not be applicable to all clients (e.g., calling, emailing, browsing internet, taking photos).
2.Split the general-purpose interface into smaller, more specific interfaces.
3.Implement these specific interfaces in the relevant classes.
4.Ensure that clients only depend on the methods they actually use.
  */
abstract class CallDevice{
  void call();
}
abstract class EmailDevice{
  void sendEmail();
}
abstract class InternetDevice{
  void browseInternet();
}
abstract class PhotoDevice{
  void takePhoto();
}
class SmartphoneISP implements CallDevice,EmailDevice,InternetDevice,PhotoDevice{
  @override
  void call() {
    print("Making a call from smartphone");
  }
  @override
  void sendEmail() {
    print("Sending email from smartphone");
  }
  @override
  void browseInternet() {
    print("Browsing internet from smartphone");
  }
  @override
  void takePhoto() {
    print("Taking photo from smartphone");
  }
}
class SmartWatchISP implements CallDevice{
  @override
  void call() {
    print("Making a call from smartwatch");
  }
}
// Now, SmartWatchISP only implements the CallDevice interface and is not forced to implement methods it does not support, adhering to the Interface Segregation Principle.