import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized()
    ..scheduleAttachRootWidget(const MyApp())
    ..scheduleWarmUpFrame();
}


qd