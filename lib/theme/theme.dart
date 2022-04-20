import 'package:base_flutter_project/theme/colors.dart';
import 'package:base_flutter_project/theme/dimens.dart';
import 'package:base_flutter_project/theme/text_styles.dart';
import 'package:flutter/material.dart';

export 'colors.dart';
export 'dimens.dart';
export 'icons.dart';
export 'images.dart';
export 'text_styles.dart';

class AppTheme {
  static AppTheme? _instance;

  static late final ThemeData _defaultThemeData;

  factory AppTheme.base(ThemeData theme) {
    if (_instance != null) return _instance!;

    _instance = AppTheme._init(theme);
    return _instance!;
  }

  AppTheme._init(ThemeData theme) {
    _defaultThemeData = theme;
  }

  ThemeData get appTheme {
    return _defaultThemeData.copyWith(
      elevatedButtonTheme: elevatedButtonTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      primaryColor: AppColors.black,
      primaryColorDark: AppColors.black,
      primaryColorLight: AppColors.black,
      appBarTheme: appBarTheme,
      iconTheme: IconThemeData(color: AppColors.black),
      scaffoldBackgroundColor: AppColors.black,
      dialogTheme: dialogTheme,
      inputDecorationTheme: inputDecorationTheme,
      tabBarTheme: tabbarTheme,
    );
  }

  TabBarTheme get tabbarTheme {
    return _defaultThemeData.tabBarTheme.copyWith(
      labelStyle: AppTextStyle.t14w700(),
      labelColor: AppColors.black,
      unselectedLabelColor: AppColors.black,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.black, width: 1.dp),
        insets: EdgeInsets.symmetric(horizontal: 16.dp),
      ),
    );
  }

  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        filled: true,
        fillColor: AppColors.black,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        isDense: true,
        hintStyle: AppTextStyle.t14w400(AppColors.black),
      );

  DialogTheme get dialogTheme {
    return _defaultThemeData.dialogTheme.copyWith(
      backgroundColor: AppColors.black,
    );
  }

  AppBarTheme? get appBarTheme {
    return _defaultThemeData.appBarTheme.copyWith(
      backgroundColor: AppColors.white,
      centerTitle: true,
      titleTextStyle: AppTextStyle.appbar,
      elevation: 0,
      iconTheme: _defaultThemeData.iconTheme.copyWith(color: AppColors.black),
      actionsIconTheme: _defaultThemeData.iconTheme.copyWith(
        color: AppColors.black,
      ),
    );
  }

  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.dp),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.any((state) => state == MaterialState.disabled)) {
                return AppColors.black;
              }
              return AppColors.black;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              return AppColors.white;
            },
          ),
          textStyle: MaterialStateProperty.resolveWith(
            (states) => AppTextStyle.button,
          ),
          padding: MaterialStateProperty.resolveWith(
            (states) => EdgeInsets.symmetric(vertical: 14.dp, horizontal: 30),
          ),
        ),
      );

  OutlinedButtonThemeData? get outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.dp),
          ),
        ),
        side: MaterialStateProperty.resolveWith(
          (states) {
            if (states.any((state) => state == MaterialState.disabled)) {
              return BorderSide(color: AppColors.black);
            }
            return const BorderSide(color: AppColors.black);
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.any((state) => state == MaterialState.disabled)) {
              return AppColors.black;
            }
            return AppColors.black;
          },
        ),
        backgroundColor: MaterialStateColor.resolveWith((states) => AppColors.white),
        textStyle: MaterialStateProperty.resolveWith(
          (states) => AppTextStyle.button,
        ),
        padding: MaterialStateProperty.resolveWith(
          (states) => EdgeInsets.symmetric(vertical: 14.dp, horizontal: 30),
        ),
      ),
    );
  }
}
