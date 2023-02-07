import 'package:note_location_app/domain/sample/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widget/widget.dart';

class HomeScreenCustomComponent extends StatelessWidget {
  const HomeScreenCustomComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: HomeScreenCustomBtnWidget(
        onPressed: () {
          context.pushNamed(SampleScreenName.feature);
        },
      ),
    );
  }
}
