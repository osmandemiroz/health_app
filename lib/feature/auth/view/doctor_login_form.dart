import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app/feature/auth/widgets/login_button.dart';
import 'package:health_app/feature/auth/widgets/login_text_field.dart';
import 'package:health_app/feature/blocs/login_bloc.dart';
import 'package:health_app/feature/blocs/login_event.dart';
import 'package:health_app/feature/blocs/login_state.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorLoginForm extends StatelessWidget {
  const DoctorLoginForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.licenseNumberController,
    required this.specialtyController,
    super.key,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController licenseNumberController;
  final TextEditingController specialtyController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login successful!')),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LoginTextField(
                controller: emailController,
                label: 'Email',
                icon: Icons.email_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 2.h),
              LoginTextField(
                controller: passwordController,
                label: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 2.h),
              LoginTextField(
                controller: licenseNumberController,
                label: 'Medical License Number',
                icon: Icons.badge_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your license number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 2.h),
              LoginTextField(
                controller: specialtyController,
                label: 'Specialty',
                icon: Icons.local_hospital_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your specialty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 3.h),
              LoginButton(
                userType: 'Doctor',
                state: state,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(
                          LoginSubmitted(
                            email: emailController.text,
                            password: passwordController.text,
                            userType: 'Doctor',
                            additionalFields: {
                              'licenseNumber': licenseNumberController.text,
                              'specialty': specialtyController.text,
                            },
                          ),
                        );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
