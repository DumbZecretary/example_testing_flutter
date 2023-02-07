import 'package:flutter/material.dart';

class HomeScreenCustomBtnWidget extends StatelessWidget {
  const HomeScreenCustomBtnWidget({
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed?.call();
      },
      child: Container(
        width: 200,
        height: 68,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: const Text(
          r"Next screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
