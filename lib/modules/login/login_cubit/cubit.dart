
import 'package:currency_converter/layout/home_screen.dart';
import 'package:currency_converter/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


part 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());
static  LoginCubit getObject(context)=>BlocProvider.of(context);
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();
  Future<void> logIn(context)async{
    emit(LoginLoading());
    http.post(
        Uri.parse("http://restapi.adequateshop.com/api/authaccount/login"),
        body: {
          "email":emailCont.text,
          "password":passwordCont.text
        }
    ).then((value) {
      emit(LoginSuccess());
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => const HomeScreen(),),
              (route) => false);
    }).catchError((onError){
      emit(LoginError());
    });
  }
   // void signIn(){
   //   DioHelper.auth(
   //     url: "authaccount/login",
   //     data: {
   //       "email":emailCont.text,
   //       "password":passwordCont.text
   //     },
   //   );
   // }
}
