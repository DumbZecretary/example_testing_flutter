import 'package:flutter_test/flutter_test.dart';
import 'package:note_location_app/utils/sample_tool.dart';

void main() async {}

void sampleToolTest() {
  group(
    "SAMPLE TOOL TEST:",
    () {
      test(
        "test function",
        () async {
          // given
          const firstInput = 1;
          const secondInput = 2;

          // when
          final result = await sampleTool(firstInput, secondInput);

          // then
          expect(result, 3);
        },
      );
    },
  );
}
