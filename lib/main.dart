import 'package:currency_converter/layout/home_cubit/cubit.dart';
import 'package:currency_converter/layout/home_screen.dart';
import 'package:currency_converter/modules/login/login_cubit/cubit.dart';
import 'package:currency_converter/modules/login/login_screen.dart';
import 'package:currency_converter/modules/register/register_cubit/cubit_cubit.dart';
import 'package:currency_converter/modules/register/register_screen.dart';
import 'package:currency_converter/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => HomeCubit(),),
      BlocProvider(create: (context) => LoginCubit(),),
      BlocProvider(create: (context) => RegisterCubit(),),
    ],
      child: const MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}

