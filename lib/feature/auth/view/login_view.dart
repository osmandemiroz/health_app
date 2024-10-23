import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/feature/auth/view/doctor_login_form.dart';
import 'package:health_app/feature/auth/view/patient_login_form.dart';
import 'package:health_app/feature/auth/widgets/login_tabbar.dart';
import 'package:health_app/feature/blocs/login_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  late TabController _tabController;
  late AnimationController _fadeController;

  // Controllers for text fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _licenseNumberController = TextEditingController();
  final _specialtyController = TextEditingController();
  final _healthIdController = TextEditingController();
  final _dateOfBirthController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _tabController.addListener(() {
      _fadeController.reset();
    });
    _fadeController.forward();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _fadeController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _licenseNumberController.dispose();
    _specialtyController.dispose();
    _healthIdController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 8.h),
                  _buildHeader(),
                  SizedBox(height: 4.h),
                  LoginTabBar(controller: _tabController),
                  SizedBox(height: 3.h),
                  _buildLoginForms(),
                  SizedBox(height: 2.h),
                  _buildBottomLinks(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Hero(
      tag: 'app_logo',
      child: Text(
        'Health App',
        style: GoogleFonts.poppins(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildLoginForms() {
    return SizedBox(
      height: 70.h,
      child: TabBarView(
        controller: _tabController,
        children: [
          DoctorLoginForm(
            formKey: _formKey1,
            emailController: _emailController,
            passwordController: _passwordController,
            licenseNumberController: _licenseNumberController,
            specialtyController: _specialtyController,
          ),
          PatientLoginForm(
            formKey: _formKey2,
            emailController: _emailController,
            passwordController: _passwordController,
            healthIdController: _healthIdController,
            dateOfBirthController: _dateOfBirthController,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomLinks() {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            // TODO: Implement forgot password navigation
          },
          child: Text(
            'Forgot Password?',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: GoogleFonts.poppins(fontSize: 12.sp),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement registration navigation
              },
              child: Text(
                'Register',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
