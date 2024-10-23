import 'package:flutter/material.dart';
import 'package:health_app/feature/auth/view/login_view.dart';
import 'package:health_app/feature/splash/splash_view.dart';
import 'package:health_app/product/utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        home: const SplashView(),
        theme: ThemeData.light(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: AppColors.greyLight,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.greyWhite,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
