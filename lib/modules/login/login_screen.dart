import 'package:currency_converter/shared/components/custom_button.dart';
import 'package:currency_converter/shared/components/custom_statefull_text_field.dart';
import 'package:currency_converter/shared/components/custom_stateless_text_field.dart';
import 'package:currency_converter/shared/custom_text_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                const CustomStatelessTextField(lableText: "Email",),
                const SizedBox(height: 25,),
                const CustomStateFullTextField(text: "Password"),
                const SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      minWidth: 320,
                        onPressed: (){},
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
                    CustomTextButton(onPressed: (){}, text: "Sign Up")
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
