Future sampleTool(int a, int b) async {
  final result = await Future.delayed(
    const Duration(
      seconds: 1,
    ),
    () {
      return a + b;
    },
  ).then(
    (value) {
      return value;
    },
  );

  return result;
}
