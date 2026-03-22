import 'package:flutter_test/flutter_test.dart';
import 'package:palimpsest/resources/io_resource.dart';

void main() {
  test('should create a basic IO resource', () {
    final resource = IOResource();

    expect(resource.value, 0);
    expect(resource.cap, 200);
  });

  test('should properly increment the IO resource', () {
    final resource = IOResource();

    expect(resource.value, 0);

    resource.incrementBy(20);
    expect(resource.value, 20);

    resource.incrementBy(2000);
    expect(resource.value, 200);
  });

  test('should properly decrement the IO resource', () {
    final resource = IOResource();

    expect(resource.value, 0);

    resource.decrementBy(20);
    expect(resource.value, 0);

    resource.incrementBy(50);
    expect(resource.value, 50);

    resource.decrementBy(500);
    expect(resource.value, 0);
  });

  test('should properly expand the cap', () {
    final resource = IOResource();

    expect(resource.cap, 200);

    resource.expandCap(300);
    expect(resource.cap, 500);

    resource.incrementBy(5000);
    expect(resource.value, 500);
  });
}
