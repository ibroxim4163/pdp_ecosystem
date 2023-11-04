import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/api_constants.dart';
import '../../../common/constants/custom_error.dart';
import '../../../common/services/secure_storage_servise.dart';
import '../repository/sign_in_repository.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepositoryImp repository;

  SignInBloc(this.repository)
      : super(const CheckingUserState(
          password: "",
          username: "",
          isSuperUser: false,
        )) {
    on<SignInUserEvent>(
      (event, emit) async {
        try {
          emit(SignInLoading(
            username: state.username,
            password: state.password,
            isSuperUser: false,
          ));
          final user = await repository.getToken(
            event.username,
            event.password,
          );
          SecureStorage().writeRefresh(user.refresh);
          SecureStorage().writeToken(user.access);
         
          tokenAccess = user.access;
          tokenRefresh = user.refresh;

          emit(
            SignInSuccess(
              username: event.username,
              password: event.password,
              isSuperUser: user.isSuperUser,
            ),
          );
        } catch (e) {
          if (e is AdminRegisterError) {
            emit(
              SignInErrorState(
                isSuperUser: false,
                username: "",
                password: "",
                message: e.message,
              ),
            );
          } else {
            print("asasasasasasasasas");
            print(e);
            emit(
              SignInErrorState(
                username: state.username,
                password: state.password,
                message: "This username did not found",
                isSuperUser: false,
              ),
            );
          }
        }
      },
    );
  }
}
