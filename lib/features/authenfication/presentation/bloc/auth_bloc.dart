import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:examtest/features/authenfication/data/data_sourse/data_sourse.dart';
import 'package:examtest/features/authenfication/data/repository/auth_repository_impl.dart';
import 'package:examtest/features/authenfication/domain/entities/auth_entities.dart';
import 'package:examtest/features/authenfication/domain/usecase/logout-usecase.dart';
import 'package:examtest/features/authenfication/domain/usecase/usecase.dart';

import '../../../../core/auth_status/status.dart';
import '../../../../core/usecase/usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(
          AuthState(
            status: Status.pure,
            user: AuthEntities(
              email: '',
            ),
          ),
        ) {
    on<AuthBlocStarted>((event, emit) async {
      final usecase = AuthUseCase(
        repository: AuthRepositoryImpl(
          dataSourse: AuthDataSourse(),
        ),
      );
      final either = await usecase.call(GetUserStatus());
      either.either((failure) {
        emit(
          state.copyWith(
            status: Status.unAuthen,
          ),
        );
      }, (user) {
        emit(
          state.copyWith(
            status: Status.authen,
            user: user,
          ),
        );
      });
    });

    on<AuthSignUp>(
      (event, emit) async {
        final usecase = AuthUseCase(
          repository: AuthRepositoryImpl(
            dataSourse: AuthDataSourse(),
          ),
        );
        final either = await usecase.call(
          SignUp(
            email: event.email,
            password: event.password,
          ),
        );
        either.either(
          (failure) {
            event.failure();
          },
          (user) {
            emit(
              state.copyWith(
                status: Status.authen,
                user: user,
              ),
            );
            event.onSuccsess();
          },
        );
      },
    );
    on<LogOutButtonPressed>(
      (event, emit) async {
        final usecase = LogoutUseCase(
          repository: AuthRepositoryImpl(
            dataSourse: AuthDataSourse(),
          ),
        );
        final either = await usecase.call(
          NoParams(),
        );
        either.either(
          (failure) {},
          (succsess) {
            emit(
              state.copyWith(
                status: Status.unAuthen,
              ),
            );
            event.succsess();
          },
        );
      },
    );

    on<LoginButtonPressed>(
      (event, emit) async {
        final usecase = AuthUseCase(
          repository: AuthRepositoryImpl(
            dataSourse: AuthDataSourse(),
          ),
        );
        final either = await usecase.call(
          LoginParams(
            email: event.email,
            password: event.password,
          ),
        );
        either.either(
          (failure) {
            event.failure();
          },
          (user) {
            emit(
              state.copyWith(
                status: Status.authen,
                user: user,
              ),
            );
            event.succsess();
          },
        );
      },
    );
  }
}
