

import 'package:currency_converter/layout/home_screen.dart';
import 'package:currency_converter/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
part 'cubit_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialState());
  static  RegisterCubit getObject(context)=>BlocProvider.of(context);
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();

  Future<void> signUp(context)async{
    emit(RegisterLoading());
    http.post(
        Uri.parse("http://restapi.adequateshop.com/api/authaccount/registration"),
        body: {
          "name":nameCont.text,
          "email":emailCont.text,
          "password":passwordCont.text
        }
    ).then((value) {
      emit(RegisterSuccess());
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(
        builder: (context) => const HomeScreen(),),
              (route) => false);
    }).catchError((onError){
      emit(RegisterError());
    });
  }

  // void signUp(){
  //   DioHelper.auth(
  //     url: "authaccount/registration",
  //     data:{
  //       "name":nameCont.text,
  //       "email":emailCont.text,
  //       "password":passwordCont.text
  //     },
  //   ).then((value){
  //     Navigator.pushAndRemoveUntil(
  //         context, MaterialPageRoute(builder: (context) => const HomeScreen(),),
  //             (route) => false);
  //   });
  // }
}
