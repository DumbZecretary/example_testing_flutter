import 'package:note_location_app/main.dart' as app;
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // This line enables the extension
  enableFlutterDriverExtension();

  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  app.main();

  test('Test - Main function return Normally', () {
    expect(() => app.main(), returnsNormally);
  });
}
