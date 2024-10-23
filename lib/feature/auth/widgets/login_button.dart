import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/feature/blocs/login_state.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    required this.onPressed,
    required this.userType,
    required this.state,
    super.key,
  });
  final VoidCallback? onPressed;
  final String userType;
  final LoginState state;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: state is LoginLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: state is LoginLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(
              'Login as $userType',
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
