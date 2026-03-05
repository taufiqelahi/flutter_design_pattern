
/// Bad code without Factory Design Pattern
// class EmailNotification {
//   void send(String message) {
//     print("Sending Email: $message");
//   }
// }
//
// class SmsNotification {
//   void send(String message) {
//     print("Sending SMS: $message");
//   }
// }
//
// class PushNotification {
//   void send(String message) {
//     print("Sending Push Notification: $message");
//   }
// }
//
// void main() {
//   String type = "email";
//
//   if (type == "email") {
//     EmailNotification notification = EmailNotification();
//     notification.send("Hello User");
//   }
//   else if (type == "sms") {
//     SmsNotification notification = SmsNotification();
//     notification.send("Hello User");
//   }
//   else {
//     PushNotification notification = PushNotification();
//     notification.send("Hello User");
//   }
// }


abstract class NotificationService {
  void send(String message);
}

class EmailNotification implements NotificationService {
  @override
  void send(String message) {
    print("Sending Email: $message");
  }
}

class SmsNotification implements NotificationService {
  @override
  void send(String message) {
    print("Sending SMS: $message");
  }
}

class PushNotification implements NotificationService {
  @override
  void send(String message) {
    print("Sending Push Notification: $message");
  }
}
//uses the notification service to send notifications
void main() {
  String type = "email";

  NotificationService notification;

  if (type == "email") {
    notification = EmailNotification();
  } else if (type == "sms") {
    notification = SmsNotification();
  } else {
    notification = PushNotification();
  }

  notification.send("Hello User");
}

// Problem of those above code
/*
 1. Tight coupling: The main function is tightly coupled to the specific implementations of NotificationService.
    If we want to add a new notification type, we have to modify the main function.
 2. Violation of Open/Closed Principle: The main function is not closed for modification.
    Every time we want to add a new notification type, we have to change the existing code, which can lead to bugs and maintenance issues.
3. Lack of flexibility: The main function is not flexible. It cannot easily switch between different notification types at runtime without modifying the code.
   This can be problematic if we want to allow users to choose their preferred notification method or if we want to change the notification type based on certain conditions.
4. Object creation logic is mixed with business logic: The main function is responsible for both creating the notification service and sending the notification.
   This violates the Single Responsibility Principle, as the main function has more than one reason to change.

 */
/// Solution: Use a Factory or Dependency Injection to decouple the creation of the notification service from its usage.
/*
What is factory Design Pattern and how its work?
The Factory Design Pattern is a creational design pattern that provides an interface for creating objects in a superclass,
but allows subclasses to alter the type of objects that will be created. It promotes loose coupling by eliminating the need to bind application-specific classes into the code.
Factory Pattern কি করে?
Object creation logic এক জায়গায় centralize করে।

Client শুধু বলে:

I need notification type X

Factory decide করে কোন object create হবে।
 */
/// Implementation of Factory Design Pattern for NotificationService
class NotificationFactory {
  static NotificationService createNotification(String type) {
    if (type == "email") {
      return EmailNotification();
    } else if (type == "sms") {
      return SmsNotification();
    } else {
      return PushNotification();
    }
  }
}
void main1() {
  NotificationService notification =
  NotificationFactory.createNotification("email");

  notification.send("Hello User");
}
