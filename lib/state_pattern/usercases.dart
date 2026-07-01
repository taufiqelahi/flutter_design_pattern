//==========================================================
// STATE DESIGN PATTERN
//==========================================================

/*
==========================================================
Without State Design Pattern
==========================================================

In this approach, the Order class itself is responsible for
managing all state transitions and behaviors.

Problems:
1. Violates Open/Closed Principle
   - Every time a new state is added, the Order class must
     be modified.

2. Large if-else or switch statements
   - As the number of states grows, the code becomes difficult
     to read and maintain.

3. Tight Coupling
   - Business logic for every state is inside one class.

4. Difficult to Test
   - Individual state behavior cannot be tested separately.

5. Hard to Maintain
   - A small change in one state may accidentally affect
     another state.
*/

class OldOrder {
  String _state = "Pending";

  void nextState() {
    if (_state == "Pending") {
      print("Payment received.");
      _state = "Processing";
    } else if (_state == "Processing") {
      print("Order packed.");
      _state = "Shipped";
    } else if (_state == "Shipped") {
      print("Order delivered.");
      _state = "Delivered";
    } else if (_state == "Delivered") {
      print("Order already completed.");
    } else if (_state == "Cancelled") {
      print("Cancelled order cannot proceed.");
    }
  }

  void cancel() {
    if (_state == "Pending") {
      _state = "Cancelled";
      print("Order Cancelled");
    } else {
      print("Cannot cancel after processing.");
    }
  }
}

////////////////////////////////////////////////////////////
/// State Design Pattern
////////////////////////////////////////////////////////////

/*
==========================================================
What is State Design Pattern?
==========================================================

The State Design Pattern is a Behavioral Design Pattern.

It allows an object to change its behavior when its internal
state changes.

Instead of storing state as a String or Enum and writing
large if-else statements, each state is represented by a
separate class.

The Context object simply delegates work to the current
state object.

Benefits:
✔ Eliminates large if-else blocks
✔ Follows Open/Closed Principle
✔ Easy to add new states
✔ Easy to maintain
✔ Easy to test
✔ Better separation of responsibilities

Real-world examples:
• Order Processing
• Traffic Light
• ATM Machine
• Media Player
• Document Workflow
*/

////////////////////////////////////////////////////////////
/// State Interface
////////////////////////////////////////////////////////////

/*
Every state must implement these operations.

Each concrete state decides:
- What should happen next?
- Whether cancellation is allowed?
*/

abstract class OrderState {
  void next(Order order);

  void cancel(Order order);
}

////////////////////////////////////////////////////////////
/// Context Class
////////////////////////////////////////////////////////////

/*
The Context represents the Order.

It doesn't know how each state behaves.

Instead, it delegates all work to the current state object.
*/

class Order {
  OrderState _state = PendingState();

  void setState(OrderState state) {
    _state = state;
  }

  void next() {
    _state.next(this);
  }

  void cancel() {
    _state.cancel(this);
  }
}

////////////////////////////////////////////////////////////
/// Pending State
////////////////////////////////////////////////////////////

class PendingState implements OrderState {
  @override
  void next(Order order) {
    print("Payment received.");
    order.setState(ProcessingState());
  }

  @override
  void cancel(Order order) {
    print("Order Cancelled.");
    order.setState(CancelledState());
  }
}

////////////////////////////////////////////////////////////
/// Processing State
////////////////////////////////////////////////////////////

class ProcessingState implements OrderState {
  @override
  void next(Order order) {
    print("Order Packed.");
    order.setState(ShippedState());
  }

  @override
  void cancel(Order order) {
    print("Cannot cancel after processing.");
  }
}

////////////////////////////////////////////////////////////
/// Shipped State
////////////////////////////////////////////////////////////

class ShippedState implements OrderState {
  @override
  void next(Order order) {
    print("Order Delivered.");
    order.setState(DeliveredState());
  }

  @override
  void cancel(Order order) {
    print("Cannot cancel after shipment.");
  }
}

////////////////////////////////////////////////////////////
/// Delivered State
////////////////////////////////////////////////////////////

class DeliveredState implements OrderState {
  @override
  void next(Order order) {
    print("Order already delivered.");
  }

  @override
  void cancel(Order order) {
    print("Delivered order cannot be cancelled.");
  }
}

////////////////////////////////////////////////////////////
/// Cancelled State
////////////////////////////////////////////////////////////

class CancelledState implements OrderState {
  @override
  void next(Order order) {
    print("Cancelled order cannot proceed.");
  }

  @override
  void cancel(Order order) {
    print("Order already cancelled.");
  }
}

////////////////////////////////////////////////////////////
/// Main
////////////////////////////////////////////////////////////

void main() {
  final order = Order();

  // Pending -> Processing
  order.next();

  // Processing -> Shipped
  order.next();

  // Shipped -> Delivered
  order.next();

  // Already Delivered
  order.next();

  // Cannot cancel after delivery
  order.cancel();
}

/*
==========================================================
Output
==========================================================

Payment received.
Order Packed.
Order Delivered.
Order already delivered.
Delivered order cannot be cancelled.

==========================================================
How it Works
==========================================================

                 +----------------+
                 |     Order      |
                 |----------------|
                 | _state         |
                 +-------+--------+
                         |
                         |
                         ▼
               +------------------+
               |  OrderState      |
               +------------------+
               | next()           |
               | cancel()         |
               +--------+---------+
                        ^
     ___________________|_____________________
    |          |          |          |        |
    |          |          |          |        |
    ▼          ▼          ▼          ▼        ▼
 Pending   Processing   Shipped   Delivered Cancelled

Each state object contains its own behavior.

Instead of writing:

if(state == "Pending") { ... }
else if(state == "Processing") { ... }

The Order simply calls:

_state.next(this);

The current state object decides what should happen next.

==========================================================
When Should You Use It?
==========================================================

Use the State Pattern when:

✔ An object has multiple states.
✔ Behavior changes based on the current state.
✔ You have long if-else or switch statements.
✔ You want to follow the Open/Closed Principle.
✔ New states should be added without modifying existing code.

Examples:
• Order Management
• ATM Machine
• Traffic Signal
• Music Player
• Video Player
• Authentication Flow
• Game Character States
*/