class Shape{
  String type;
  Shape(this.type);
}
class AreaCalculator{
  double calculateArea(Shape shape){
    if(shape.type == 'circle'){
      // calculate area of circle
      return 3.14 * 5 * 5; // assuming radius is 5
    }else if(shape.type == 'rectangle'){
      // calculate area of rectangle
      return 10 * 5; // assuming length is 10 and width is 5
    }
    throw UnimplementedError('Shape not supported');
  }
}
/*
What is ocp?
Open/Closed Principle (OCP) is one of the SOLID principles of object-oriented design.
It states that software entities (classes, modules, functions, etc.) should be open for extension but closed for modification. This means that you should be able to add new functionality to a system without changing existing code, thereby reducing the risk of introducing bugs and making the system more maintainable.
 */
// Its violating Open/Closed Principle because every time we want to add a new shape, we have to modify the AreaCalculator class.
// To adhere to Open/Closed Principle, we can use polymorphism as shown below:
/*

How to adhere to Open/Closed Principle?
Hints:
1.Identify the parts of the code that may change (e.g., adding new shapes).
2.Use abstraction (e.g., interfaces or abstract classes) to define common behavior.
3.Implement new functionality by extending existing code rather than modifying it.
4.Use Abstraction to allow new shapes to define their own area calculation.
5.Use polymorphism to calculate area without modifying existing code.
6.Dont use Concrete types directly in the AreaCalculator.
 */
abstract class ShapeOCP{
  double area();
}
class Circle extends ShapeOCP{
  double radius;
  Circle(this.radius);
  @override
  double area(){
    return 3.14 * radius * radius;
  }
}
class Rectangle extends ShapeOCP{
  double length;
  double width;
  Rectangle(this.length,this.width);
  @override
  double area(){
    return length * width;
  }
}
class AreaCalculatorOCP{
  double calculateArea(ShapeOCP shape){
    return shape.area();
  }
}
// Now, if we want to add a new shape, we can simply create a new class that extends ShapeOCP and implements the area method without modifying the AreaCalculatorOCP class.
