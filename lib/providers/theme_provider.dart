import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

enum ThemeModeSetting { light, dark, system }

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeModeSetting build() {
    return ThemeModeSetting.system;
  }

  void setThemeMode(ThemeModeSetting mode) {
    state = mode;
  }
}

@riverpod
ThemeMode currentThemeMode(CurrentThemeModeRef ref) {
  final themeModeSetting = ref.watch(themeModeNotifierProvider);
  switch (themeModeSetting) {
    case ThemeModeSetting.light:
      return ThemeMode.light;
    case ThemeModeSetting.dark:
      return ThemeMode.dark;
    case ThemeModeSetting.system:
      return ThemeMode.system;
  }
}
