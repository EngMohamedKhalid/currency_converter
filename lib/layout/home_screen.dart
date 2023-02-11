// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:currency_converter/layout/home_cubit/cubit.dart';
import 'package:currency_converter/layout/home_cubit/states.dart';
import 'package:currency_converter/models/currency_model.dart';
import 'package:currency_converter/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'home_cubit/cubit.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
  String selectedBaseCode = "";
  String selectedBaseName = "EURO";
  String selectedCountryCode = "";
  String selectedCountryName= "US Dollar";
  String selectedCountrySymbol = "£";

  @override
  void initState() {
    HomeCubit.getObject(context).allCurrencies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit = HomeCubit.getObject(context);
    return Scaffold(
      backgroundColor: backGroundColor,
       body:state is LoadingHomeState?
           Center(
             child: CircularProgressIndicator(color: primaryColor,),
           )
           :
       Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Stack(
               alignment: Alignment.center,
               children: [
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                       alignment: Alignment.center,
                       width: 400,
                       height: 120,
                       decoration: BoxDecoration(
                         color: primaryColor,
                         borderRadius: BorderRadius.circular(15)
                       ),
                       child: Row(
                         children: [
                           const Spacer(),
                           Text(
                             selectedBaseName.toUpperCase(),
                             style:const TextStyle(
                               fontSize: 20,
                               color: Colors.black
                             ),
                           ),
                           IconButton(
                               onPressed: (){
                                 showModalBottomSheet(
                                   backgroundColor: Colors.transparent,
                                   context: context,
                                   builder: (ctx){
                                     return Container(
                                       padding: const EdgeInsets.symmetric(
                                           horizontal: 32,vertical: 16),
                                       decoration: const BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.only(
                                             topLeft: Radius.circular(8),
                                             topRight: Radius.circular(8),
                                           )
                                       ),
                                       height: 700,
                                       child: ListView.separated(
                                         itemCount: cubit.currencies.length,
                                         itemBuilder: (context,index){
                                           return ListTile(
                                             onTap: () {
                                               selectedBaseCode =cubit.currencies[index].code!;
                                               selectedCountrySymbol =cubit.currencies[index].symbol!;
                                               selectedBaseName =cubit.currencies[index].name!;
                                               Navigator.pop(context);
                                               setState(() {});
                                             },
                                             leading:Text(cubit.currencies[index].code!,
                                               style: const TextStyle(
                                                 fontSize: 16,
                                                 fontWeight: FontWeight.bold
                                               ),
                                             ),
                                             trailing:Text(cubit.currencies[index].symbol!),
                                             title: Text(cubit.currencies[index].name!),
                                           );
                                         }, separatorBuilder: (BuildContext context, int index) {
                                         return const Divider(
                                           color: Colors.blue,
                                         );
                                       },

                                       ),
                                     );
                                   },
                                 );
                               },
                               icon:const Icon(
                                 Icons.arrow_drop_down,
                                 size: 35,
                               ),
                           ),
                           const Spacer(flex: 4,),
                           Text(
                              "1 $selectedCountrySymbol",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                          ),
                           const Spacer(),
                         ],
                       ),
                     ),
                     const SizedBox(height: 20,),
                     Container(
                       alignment: Alignment.center,
                       width: 400,
                       height: 120,
                       decoration: BoxDecoration(
                           color: primaryColor2,
                           borderRadius: BorderRadius.circular(15)
                       ),
                       child: Row(
                         children: [
                           const Spacer(),
                           Text(
                             selectedCountryName.toUpperCase(),
                             style:const TextStyle(
                                 fontSize: 20,
                                 color: Colors.black
                             ),
                           ),
                           IconButton(
                             onPressed: (){
                               showModalBottomSheet(
                                 backgroundColor: Colors.transparent,
                                 context: context,
                                 builder: (ctx){
                                   return Container(
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 32,vertical: 16),
                                     decoration: const BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.only(
                                           topLeft: Radius.circular(8),
                                           topRight: Radius.circular(8),
                                         )
                                     ),
                                     height: 700,
                                     child: ListView.separated(
                                       itemCount: cubit.currencies.length,
                                       itemBuilder: (context,index){
                                         return ListTile(
                                           onTap: () {
                                             selectedCountryCode=cubit.currencies[index].code!;
                                             selectedCountryName =cubit.currencies[index].name!;
                                             Navigator.pop(context);
                                           },
                                           leading:Text(cubit.currencies[index].code!,
                                             style: const TextStyle(
                                                 fontSize: 16,
                                                 fontWeight: FontWeight.bold
                                             ),
                                           ),
                                           trailing:Text(cubit.currencies[index].symbol!),
                                           title:Text(cubit.currencies[index].name!),
                                         );
                                       }, separatorBuilder: (BuildContext context, int index) {
                                       return const Divider(
                                         color: Colors.blue,
                                       );
                                     },

                                     ),
                                   );
                                 },
                               );
                             },
                             icon:const Icon(
                               Icons.arrow_drop_down,
                               size: 35,
                             ),
                           ),
                           const Spacer(flex: 4,),
                           Text(
                             convertedValue,
                             style: const TextStyle(
                                 fontSize: 17,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black
                             ),
                           ),
                           const Spacer(),
                         ],
                       ),
                     ),
                   ],
                 ),
                 FloatingActionButton(
                   backgroundColor: backGroundColor,
                   onPressed: () {},
                   child: CircleAvatar(
                     maxRadius: 23,
                     backgroundColor: Colors.white,
                     child: Icon(
                       Icons.compare_arrows,
                       size: 42,
                       color: Colors.black,
                     ),
                   ),
                 ),
               ],
             ),
            const SizedBox(height: 30,),
             state is LoadingHomeState?
             Center(
               child: CircularProgressIndicator(color: primaryColor,),
             )
                 :
             InkWell(
               onTap: () {
                cubit.convert(selectedBaseCode, selectedCountryCode);
               },
               child: Container(
                 width: 400,
                 height: 70,
                 decoration: BoxDecoration(
                   color: primaryColor,
                   borderRadius: BorderRadius.circular(15)
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(
                       Icons.send,
                       color: Colors.white,
                       size: 35,
                     ),
                     const SizedBox(width: 10,),
                     Text(
                       "Convert",
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 20,
                         color: Colors.white
                       ),
                     )
                   ],
                 ),
               ),
             ),
             const SizedBox(height: 10,),
             Container(
               width: 400,
               height: 70,
               decoration: BoxDecoration(
                   color: primaryColor,
                   borderRadius: BorderRadius.circular(15)
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children:const [
                   Icon(
                     Icons.history,
                     color: Colors.white,
                     size: 35,
                   ),
                   const SizedBox(width: 10,),
                   Text(
                     "Historical Data",
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 20,
                         color: Colors.white
                     ),
                   )
                 ],
               ),
             ),
           ],
         ),
       ),
    );
  },
);
  }
}
//https://api.freecurrencyapi.com/v1/latest?apikey=vQMEX6QeRHCZw3xHCKiO8o1yn7uvirnaz056X419&currencies=&base_currency=EUR
