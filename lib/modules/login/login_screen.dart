import 'package:currency_converter/layout/home_screen.dart';
import 'package:currency_converter/modules/login/login_cubit/cubit.dart';
import 'package:currency_converter/modules/register/register_screen.dart';
import 'package:currency_converter/shared/components/custom_button.dart';
import 'package:currency_converter/shared/components/custom_statefull_text_field.dart';
import 'package:currency_converter/shared/components/custom_stateless_text_field.dart';
import 'package:currency_converter/shared/custom_text_button.dart';
import 'package:currency_converter/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
const   LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit = LoginCubit.getObject(context);
    return Scaffold(
     backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Wellcome back!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 12,),
                const Text(
                  "Login into your account",
                  style: TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey
                  ),
                ),
                const SizedBox(height: 100,),
                 CustomStatelessTextField(controller: cubit.emailCont,lableText: "Email",),
                const SizedBox(height: 25,),
                 CustomStateFullTextField(controller: cubit.passwordCont,text: "Password"),
                const SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    state is LoginLoading?
                    const Center(child: CircularProgressIndicator(backgroundColor: Colors.deepOrange,),)
                        :
                    CustomButton(
                      minWidth: 320,
                        onPressed: (){
                            cubit.logIn(context);
                        },
                        text: "Login",
                    ),
                    const SizedBox(width: 16),
                    ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: MaterialButton(
                color: Colors.deepOrange,
                padding:const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8
                ),
                minWidth: 50,
                onPressed: (){},
                child:const Icon(
                  Icons.fingerprint,
                  size: 33,
                  color: Colors.white,
                )

              ),
            ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account yet?",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey
                      ),
                    ),
                    const SizedBox(width: 2),
                    CustomTextButton(onPressed: (){
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context) =>  RegisterScreen(),),
                              (route) => false);
                    }, text: "Sign Up")
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
