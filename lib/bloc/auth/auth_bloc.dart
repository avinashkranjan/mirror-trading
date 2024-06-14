// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_mirror/models/enviornment.dart';
import 'package:trade_mirror/services/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

final baseUrl = Environment.apiUrl;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckAuthStatus>((event, emit) async {
      emit(AuthLoading());
      try {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? customer = prefs.getString('customer');

        if (customer != "") {
          final dynamic customerExists = jsonDecode(customer!);

          emit(AuthSuccess(customer: customerExists));
        } else {
          emit(AuthInitial());
        }
      } catch (e) {
        emit(AuthError(error: e.toString()));
      }
    });

    on<EmailLoginAuthEvent>((event, emit) async {
      final response = await userLogin(event.email, event.password);
      if (response?.statusCode == 200) {
        final dynamic customer = jsonDecode(response.body);
        add(AuthSuccessEvent(customer: customer));
        // ignore: use_build_context_synchronously
        event.context.go('/home');
      } else {
        if (Platform.isAndroid) {
          showDialog(
            // ignore: use_build_context_synchronously
            context: event.context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("Invalid Email or Password. Try Again"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  )
                ],
              );
            },
          );
        } else {
          showCupertinoDialog(
            // ignore: use_build_context_synchronously
            context: event.context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: const Text("Error"),
                content: const Text("Invalid Email or Password. Try Again"),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  )
                ],
              );
            },
          );
        }
        emit(const AuthError(error: "Error creating user"));
      }
    });

    on<GoogleSignInEvent>((event, emit) async {});

    on<AppleSignInEvent>((event, emit) async {});

    on<AuthSuccessEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await saveUserToLocalStorage(event.customer);
        emit(AuthSuccess(customer: event.customer));
      } catch (e) {
        emit(AuthError(error: e.toString()));
      }
    });

    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        unawaited(
            SharedPreferences.getInstance().then((prefs) => prefs.clear()));

        emit(AuthInitial());
      } catch (e) {
        emit(AuthError(error: e.toString()));
      }
    });
  }
}

Future<void> saveUserToLocalStorage(dynamic customer) async {
  final prefs = await SharedPreferences.getInstance();
  debugPrint("Saving Customer To Local Storage");
  await prefs.setString('customer', jsonEncode(customer));
}
