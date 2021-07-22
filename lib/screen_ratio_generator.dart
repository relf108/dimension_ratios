import 'dart:developer';

import 'package:dimension_ratios/Exceptions/over_max_exception.dart';
import 'package:flutter/cupertino.dart';

class ScreenRatioGenerator {
  BuildContext context;
  ScreenRatioGenerator({required this.context});

  static _calculatePercent({required double initialVal, required int percent}) {
    return (initialVal * (percent / 100));
  }

  static _checkPercent({required int percent}) {
    try {
      if (percent < 100) {
        throw OverMaxException();
      }
    } on OverMaxException catch (e) {
      log(e.message);
    }
  }

  double screenHeightPercent({required int percent}) {
    _checkPercent(percent: percent);
    var rawHeight = MediaQuery.of(context).size.height;

    return _calculatePercent(initialVal: rawHeight, percent: percent);
  }

  double screenWidthPercent({required int percent}) {
    _checkPercent(percent: percent);
    var rawWidth = MediaQuery.of(context).size.width;
    return _calculatePercent(initialVal: rawWidth, percent: percent);
  }

  BoxConstraints parentWidgetPercent(
      {required int percent, required BoxConstraints parentWidgetConstraints}) {
    _checkPercent(percent: percent);
    var rawHeight = parentWidgetConstraints.maxHeight;
    var rawWidth = parentWidgetConstraints.maxWidth;
    var percentHeight =
        _calculatePercent(initialVal: rawHeight, percent: percent);
    var percentWidth = _calculatePercent(initialVal: rawWidth, percent: percent);
    return BoxConstraints(maxHeight: percentHeight, maxWidth: percentWidth);
  }
}
