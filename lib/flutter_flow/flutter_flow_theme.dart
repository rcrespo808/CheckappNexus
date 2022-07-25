// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color primaryBtnText;
  Color lineColor;
  Color customColor1;
  Color noColor;
  Color grayIcon;
  Color gray200;
  Color gray600;
  Color black600;
  Color tertiary400;
  Color textColor;
  Color btnText;
  Color customColor3;
  Color customColor4;
  Color white;
  Color background;
  Color backgroundComponents;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFFFFF5F2);
  Color secondaryColor = const Color(0xFFF74D1E);
  Color tertiaryColor = const Color(0xFFFFF5F2);
  Color alternate = const Color(0xF32089F4);
  Color primaryBackground = const Color(0xFFF1F4F8);
  Color secondaryBackground = const Color(0xFFC7D1DA);
  Color primaryText = const Color(0xFF101213);
  Color secondaryText = const Color(0xFFFFF5F2);

  Color primaryBtnText = Color(0xFFFFFFFF);
  Color lineColor = Color(0xFFE0E3E7);
  Color customColor1 = Color(0xFF2FB73C);
  Color noColor = Color(0x00FFFFFF);
  Color grayIcon = Color(0xFF95A1AC);
  Color gray200 = Color(0xFFDBE2E7);
  Color gray600 = Color(0xFF262D34);
  Color black600 = Color(0xFF090F13);
  Color tertiary400 = Color(0xFF39D2C0);
  Color textColor = Color(0xFF1E2429);
  Color btnText = Color(0xFFFFFFFF);
  Color customColor3 = Color(0xFFDF3F3F);
  Color customColor4 = Color(0xFF090F13);
  Color white = Color(0xFFFFFFFF);
  Color background = Color(0xFF1D2429);
  Color backgroundComponents = Color(0xFF1D2428);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Exo 2';
  TextStyle get title1 => GoogleFonts.getFont(
        'Exo 2',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  String get title2Family => 'Exo 2';
  TextStyle get title2 => GoogleFonts.getFont(
        'Exo 2',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      );
  String get title3Family => 'Exo 2';
  TextStyle get title3 => GoogleFonts.getFont(
        'Exo 2',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  String get subtitle1Family => 'Exo 2';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Exo 2',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );
  String get subtitle2Family => 'Exo 2';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Exo 2',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  String get bodyText1Family => 'Exo 2';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Exo 2',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
  String get bodyText2Family => 'Exo 2';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Exo 2',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0x00272C2D);
  Color secondaryColor = const Color(0xFFF74D1E);
  Color tertiaryColor = const Color(0xFFFFF5F2);
  Color alternate = const Color(0xF320F42D);
  Color primaryBackground = const Color(0xFF272C2D);
  Color secondaryBackground = const Color(0xFF76787E);
  Color primaryText = const Color(0xFFFFFFFF);
  Color secondaryText = const Color(0xFF191B1E);

  Color primaryBtnText = Color(0xFFFFFFFF);
  Color lineColor = Color(0xFF22282F);
  Color customColor1 = Color(0xFF47C612);
  Color noColor = Color(0x000F1113);
  Color grayIcon = Color(0xFF95A1AC);
  Color gray200 = Color(0xFFDBE2E7);
  Color gray600 = Color(0xFF262D34);
  Color black600 = Color(0xFF090F13);
  Color tertiary400 = Color(0xFF39D2C0);
  Color textColor = Color(0xFF1E2429);
  Color btnText = Color(0xFFFFFFFF);
  Color customColor3 = Color(0xFFDF3F3F);
  Color customColor4 = Color(0xFF090F13);
  Color white = Color(0xFFFFFFFF);
  Color background = Color(0xFF1D2429);
  Color backgroundComponents = Color(0xFF1D2428);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    double letterSpacing,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
