# Flutter Design Patterns

A small Flutter/Dart learning project containing complete, runnable examples of
the five SOLID principles and common creational, structural, and behavioral
design patterns.

## Included examples

### SOLID

- Single Responsibility Principle
- Open/Closed Principle
- Liskov Substitution Principle
- Interface Segregation Principle
- Dependency Inversion Principle

### Creational patterns

- Singleton
- Factory
- Builder

### Structural patterns

- Adapter

### Behavioral patterns

- Strategy
- Observer
- State

## Run the Flutter catalog

```bash
flutter pub get
flutter run
```

The home screen lists every example and its source path.

## Run every console demo

```bash
dart run bin/run_examples.dart
```

## Run checks

```bash
flutter analyze
flutter test
```

## Project notes

- The examples intentionally show a small legacy or problematic design before
  the improved design.
- Unsupported input is rejected explicitly instead of silently falling back to
  another implementation.
- Models are immutable where practical.
- Pattern behavior is separated from the Flutter UI, so the examples are easy
  to test and reuse.
