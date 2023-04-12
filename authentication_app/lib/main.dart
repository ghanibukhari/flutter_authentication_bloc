import 'package:flutter/material.dart';
import 'package:flutter_authentication_bloc/blocs/auth_bloc.dart';
import 'package:flutter_authentication_bloc/repositories/auth_repository.dart';
import 'package:flutter_authentication_bloc/views/auth_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(AuthRepository())),
      ],
      child: MaterialApp(
        home: const AuthView(),
        title: 'Login',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
