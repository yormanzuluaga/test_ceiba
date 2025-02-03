// ignore_for_file: prefer_const_constructors

import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:test_ceiba/bootstrap.dart';
import 'package:test_ceiba/flavor.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  bootstrap(
    flavor: FlavorType.dev,
  );
}
