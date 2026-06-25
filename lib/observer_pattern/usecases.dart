//observer pattern
/// example of without observer pattern
class Subject {
  String _state = "Initial State";
  String get state => _state;
  void setState(String newState) {
    _state = newState;
    print("State changed to: $_state");
  }
}

///problem of above code
/*
1. Tight Coupling: The Subject class is tightly coupled with the code that uses it. If you want to notify other parts of the application when the state changes, you would have to modify the Subject class directly, which can lead to code that is hard to maintain and extend.
2. Lack of Flexibility: The Subject class does not provide a way for other parts of the application to register for notifications when the state changes. This means that if you want to add new functionality that depends on the state change, you would have to modify the Subject class, which can be cumbersome and error-prone.
3. Difficulty in Maintenance: If the state management logic becomes more complex, the Subject class can become bloated and difficult to maintain. Any changes to the state management logic would require modifications to the Subject class, which can introduce bugs and make it harder to understand the code

 */
///What is Observer Pattern?
/*
The Observer Pattern is a behavioral design pattern that defines a one-to-many dependency between objects,
 so that when one object (the subject) changes state, all its dependents (observers) are notified and updated automatically.
 This pattern is particularly useful in scenarios where an object needs to maintain consistency across multiple dependent objects without tightly coupling them together.

 */
/// Example of Observer Pattern
abstract class Observer {
  void update(String state);
}

class ConcreteObserver implements Observer {
  final String name;
  ConcreteObserver(this.name);
  @override
  void update(String state) {
    print("$name received update: $state");
  }
}

class SubjectWithObserver {
  String _state = "Initial State";
  final List<Observer> _observers = [];

  String get state => _state;

  void attach(Observer observer) {
    _observers.add(observer);
  }

  void detach(Observer observer) {
    _observers.remove(observer);
  }

  void notify() {
    for (var observer in _observers) {
      observer.update(_state);
    }
  }

  void setState(String newState) {
    _state = newState;
    print("State changed to: $_state");
    notify();
  }
}

void main() {
  final subject = SubjectWithObserver();
  final observer1 = ConcreteObserver("Observer 1");
  final observer2 = ConcreteObserver("Observer 2");

  subject.attach(observer1);
  subject.attach(observer2);

  subject.setState("New State 1");
  subject.setState("New State 2");
}
/// Explanation of Observer Pattern
/*
1. Subject: The SubjectWithObserver class maintains a list of observers and provides methods to attach, detach, and notify them. It also has a state that can change, and when it does, it notifies all attached observers.
2. Observer: The Observer interface defines a method update that observers must implement to receive updates from the subject.
3. ConcreteObserver: The ConcreteObserver class implements the Observer interface and defines how it reacts to updates from the subject. In this example, it simply prints the new state to the console.
4. Main Function: In the main function, we create an instance of SubjectWithObserver and two ConcreteObserver instances. We attach the observers to the subject and then change the state of the subject. When the state changes, both observers are notified and print the new state to the console.

 */
