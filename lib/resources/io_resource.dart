import 'package:flutter/foundation.dart';
import 'package:palimpsest/resources/resource.dart';

class IOResource extends ChangeNotifier implements Resource {
  double _value = 0;
  double _cap = 200;

  @override
  double get value => _value;

  @override
  double get cap => _cap;

  @override
  void incrementBy(double step) {
    _value = (value + step).clamp(0, cap);
    notifyListeners();
  }

  @override
  void decrementBy(double step) {
    _value = (value - step).clamp(0, cap);
    notifyListeners();
  }

  @override
  void expandCap(double amount) {
    _cap = cap + amount;
    notifyListeners();
  }
}
