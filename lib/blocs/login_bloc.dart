import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/user_repository.dart';
import '../screens/exam_schedule_screen.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        await userRepository.signInWithEmailAndPassword(
            event.email, event.password);
        yield LoginSuccess();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }

    if (event is LogoutButtonPressed) {
      userRepository.signOut();
      yield LoginInitial();
    }
  }
}

@immutable
abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}

class LogoutButtonPressed extends LoginEvent {}

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  @override
  List<Object?> get props => [];

  @override
  String toString() => 'LoginSuccess';

  void navigateToExamScheduleScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ExamScheduleScreen()),
    );
  }
}
class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}
