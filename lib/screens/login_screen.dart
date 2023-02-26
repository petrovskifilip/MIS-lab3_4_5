import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login_bloc.dart';
import '../components/login_form.dart';
import '../data/user_repository.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  LoginScreen({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          state.navigateToExamScheduleScreen(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: LoginForm(userRepository: _userRepository),
      ),
    );
  }
}

