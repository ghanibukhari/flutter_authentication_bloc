import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_authentication_bloc/repositories/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthLoading()) {
    on<LoginButtonPress>((event, emit) async {
      emit(AuthLoading());
      final result = await _authRepository.login(event.email!, event.password!);
      print(result);
      if(result != "user not found"){
        emit(AuthSuccessful());
      }
      if(result == "user not found"){
        emit(AuthError('User not found Or Something wrong'));
      }
    });
  }
}
