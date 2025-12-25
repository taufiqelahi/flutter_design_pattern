abstract class Vehicle{
  void refuel();
  void move();
}
class ElectricCar extends Vehicle{
  @override
  void move() {
    print("Electric car is moving");
  }

  @override
  void refuel() {
    print("Electric car is charging");
  }
}
class GasolineCar extends Vehicle{
  @override
  void move() {
    print("Gasoline car is moving");
  }

  @override
  void refuel() {
    print("Gasoline car is refueling");
  }
}
void serviceVehicle(Vehicle vehicle){
  vehicle.refuel();
  vehicle.move();
}
void main(){
  Vehicle myElectricCar = ElectricCar();
  Vehicle myGasolineCar = GasolineCar();
  serviceVehicle(myElectricCar);
  serviceVehicle(myGasolineCar);
}

/*
What is Liskov Substitution Principle?
The Liskov Substitution Principle (LSP) is one of the SOLID principles of object-oriented design.
It states that objects of a superclass should be replaceable with objects of a subclass without affecting the correctness of the program.
In other words, if S is a subtype of T, then objects of type T should be replaceable with objects of type S without altering any of the desirable properties of the program (correctness, task performed, etc.).
 */
// The above code violates Liskov Substitution Principle because the ElectricCar and GasolineCar classes have different implementations of the refuel method, which may lead to unexpected behavior when using them interchangeably.
// To adhere to Liskov Substitution Principle, we can separate the refuel method into different interfaces as shown below:
/*
How to adhere to Liskov Substitution Principle?
Hints:
1.Identify the methods that may not be applicable to all subclasses (e.g., refueling for electric vehicles).
2.Use interfaces or abstract classes to define specific behaviors.
3.Implement these behaviors in the relevant subclasses.
4.Ensure that subclasses can be used interchangeably without affecting the correctness of the program.
*/
abstract class VehicleLSP{
  void move();
}
abstract class FuelVehicle extends VehicleLSP{
  void refuel();
}
abstract class ElectricVehicle extends VehicleLSP{
  void charge();
}
class ElectricCarLSP extends ElectricVehicle{
  @override
  void move() {
    print("Electric car is moving");
  }
  @override
  void charge() {
    print("Electric car is charging");
  }
}
class GasolineCarLSP extends FuelVehicle{
  @override
  void move() {
    print("Gasoline car is moving");
  }
  @override
  void refuel() {
    print("Gasoline car is refueling");
  }
}
void serviceFuelVehicle(FuelVehicle vehicle){
  vehicle.refuel();
  vehicle.move();
}
void serviceElectricVehicle(ElectricVehicle vehicle){
  vehicle.charge();
  vehicle.move();
}
//real life example of LSP in Flutter
abstract class Button{
  void render();
  void onClick();
}
class AndroidButton extends Button{
  @override
  void render() {
    print("Rendering Android button");
  }
  @override
  void onClick() {
    print("Android button clicked");
  }
}
class IosButton extends Button{
  @override
  void render() {
    print("Rendering iOS button");
  }
  @override
  void onClick() {
    print("iOS button clicked");
  }
}
void displayButton(Button button){
  button.render();
  button.onClick();
}
void mainLSP(){
  Button androidButton = AndroidButton();
  Button iosButton = IosButton();
  displayButton(androidButton);
  displayButton(iosButton);
}

