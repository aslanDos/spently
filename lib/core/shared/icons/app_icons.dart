import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIcons {
  AppIcons._();

  static IconData add(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return isIOS ? CupertinoIcons.add : Icons.add;
  }

  static IconData close(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return isIOS ? CupertinoIcons.xmark : Icons.close;
  }

  static IconData sort(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return isIOS ? CupertinoIcons.arrow_up_arrow_down : Icons.swap_vert;
  }

  static IconData arrowUpleft(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return isIOS ? CupertinoIcons.arrow_up_left : Icons.north_west;
  }

  static IconData arrowDownRight(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return isIOS ? CupertinoIcons.arrow_down_right : Icons.south_east;
  }
}
