// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'dart:convert';

import 'package:currency_converter/layout/home_screen.dart';
import 'package:currency_converter/models/register_model.dart';
import 'package:currency_converter/modules/login/login_screen.dart';
import 'package:currency_converter/modules/register/register_cubit/cubit_cubit.dart';
import 'package:currency_converter/shared/components/custom_button.dart';
import 'package:currency_converter/shared/components/custom_statefull_text_field.dart';
import 'package:currency_converter/shared/components/custom_stateless_text_field.dart';
import 'package:currency_converter/shared/custom_text_button.dart';
import 'package:currency_converter/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RegisterCubit.getObject(context);
        return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.arrow_back_ios_sharp,
                          size: 25,
                          color: Color(0xffE5E2E2FF),
                        ),
                        SizedBox(width: 15,),
                        Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: const [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white10,
                          child: Icon(
                            Icons.person_outline_rounded,
                            size: 80,
                            color: Color(0xffE5E2E2FF),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 30),
                          child: CircleAvatar(
                            radius: 17.5,
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.camera_alt,
                              size: 20,
                              color: Color(0xffE5E2E2FF),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 35,),
                    CustomStatelessTextField(
                        controller: cubit.nameCont,
                        lableText: "Full Name"),
                    const SizedBox(height: 20,),
                    // const CustomStatelessTextField(lableText: "Phone Number"),
                    // const SizedBox(height: 20,),
                    CustomStatelessTextField(
                        controller: cubit.emailCont,
                        lableText: "Email"),
                    const SizedBox(height: 20,),
                    CustomStateFullTextField(
                        controller: cubit.passwordCont,
                        text: "Password"),
                    // const SizedBox(height: 20,),
                    // const CustomStateFullTextField(text: "Confirm Password"),
                    const SizedBox(height: 50,),
                    state is RegisterLoading?
                       const Center(child: CircularProgressIndicator(backgroundColor: Colors.deepOrange,),)
                        :
                    CustomButton(onPressed: () {
                      cubit.signUp(context);
                    }, text: "Create Account", minWidth: 411),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey
                          ),
                        ),
                        const SizedBox(width: 2),
                        CustomTextButton(onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context, MaterialPageRoute(
                            builder: (context) => LoginScreen(),),
                                  (route) => false);
                        }, text: "Login")
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
