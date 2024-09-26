import 'package:flutter/material.dart';

class Util {
  final BuildContext context;

  const Util(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  bool get isPhone => width <= 400;
  bool get isTablet => width > 401 && width <= 750;
  bool get isPc => width > 751;
}
