import 'package:flutter/material.dart';
import 'package:flutter_application_1/common_widget/custom_alert_dialog.dart';
import 'package:flutter_application_1/common_widget/custom_button.dart';
import 'package:flutter_application_1/common_widget/custom_text_formfield.dart';
import 'package:flutter_application_1/features/home_screen.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:flutter_application_1/util/value_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'loginbloc/login_bloc_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          milliseconds: 100,
        ), () {
      User? currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser != null && currentUser.appMetadata['role'] == 'admin') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const AdminDashboard(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBlocBloc(),
        child: BlocConsumer<LoginBlocBloc, LoginBlocState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const AdminDashboard()),
                (route) => false,
              );
            } else if (state is LoginFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failed',
                  description: state.message,
                  primaryButton: 'Ok',
                ),
              );
            }
          },
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/mflogo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: SizedBox(
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'MINDFRAME',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: secondaryColor),
                            ),
                            const Text(
                              'Enter your email and password',
                              style: TextStyle(
                                  fontSize: 18, color: secondaryColor),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Email',
                                style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextFormField(
                              labelText: 'Email',
                              controller: _emailController,
                              validator: emailValidator,
                              isLoading: state is LoginLoadingState,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Password',
                                style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                                enabled: state is! LoginLoadingState,
                                controller: _passwordController,
                                obscureText: _isObscure,
                                validator: notEmptyValidator,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        _isObscure = !_isObscure;
                                        setState(() {});
                                      },
                                      icon: Icon(_isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                  border: const OutlineInputBorder(),
                                  hintText: 'Password',
                                )),
                            const SizedBox(height: 20),
                            CustomButton(
                              isLoading: state is LoginLoadingState,
                              inverse: true,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<LoginBlocBloc>(context).add(
                                    LoginEvent(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    ),
                                  );
                                }
                              },
                              label: 'Signin',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
