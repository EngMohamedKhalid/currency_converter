import 'package:currency_converter/modules/login/login_screen.dart';
import 'package:currency_converter/modules/register/register_screen.dart';
import 'package:currency_converter/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: RegisterScreen(),
    );
  }
}

