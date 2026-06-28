import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form_validation/bloc/auth_bloc.dart';
import 'package:login_form_validation/login_screen.dart';
import 'package:login_form_validation/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Palette.backGroundColor,
          colorScheme: const ColorScheme.dark(
            primary: Palette.gradient2,
            secondary: Palette.gradient3,
            surface: Palette.surfaceColor,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            foregroundColor: Palette.whiteColor,
          ),
          snackBarTheme: const SnackBarThemeData(
            backgroundColor: Palette.surfaceColor,
            contentTextStyle: TextStyle(color: Palette.whiteColor),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Palette.surfaceColor.withValues(alpha: 0.45),
          ),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
