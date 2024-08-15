
import 'package:flutter/material.dart';
import 'package:practice/Theme/color.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    surface: lBg,
    onSurface: lText,
    primary: lButton,
    onPrimary: lContainer,
  )
);

var darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      surface: dBg,
      onSurface: dText,
      primary: dButton,
      onPrimary: dContainer,
    )
);