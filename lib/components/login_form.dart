import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login_bloc.dart';
import '../data/user_repository.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;

  LoginForm({required this.userRepository});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(userRepository: widget.userRepository),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<LoginBloc>(context).add(
                      LoginButtonPressed(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<LoginBloc>(context).add(
                      LogoutButtonPressed(),
                    );
                  },
                  child: Text('Logout'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
