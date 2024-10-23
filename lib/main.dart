import 'package:flutter/material.dart';
import 'package:health_app/feature/auth/view/login_view.dart';
import 'package:health_app/product/utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        home: const LoginView(),
        theme: ThemeData.light().copyWith(
          primaryColor: AppColors.primaryGreen,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primaryGreen,
            foregroundColor: AppColors.primaryGreen,
          ),
          scaffoldBackgroundColor: AppColors.greyLight,
        ),
      ),
    );
  }
}
