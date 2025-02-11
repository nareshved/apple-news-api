

import 'package:flutter/cupertino.dart';

class ResponsiveApp {

  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).height > MediaQuery.sizeOf(context).width;
  }

  static bool isDesktop (BuildContext context) {
    return MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height;
  }

}