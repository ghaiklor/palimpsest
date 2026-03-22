abstract class Resource {
  double get value;
  double get cap;

  void incrementBy(double step);
  void decrementBy(double step);

  void expandCap(double amount);
}
