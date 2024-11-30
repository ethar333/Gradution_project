
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:sprint1/Auth/auth_cubit/Auth_states.dart';
import 'package:http/http.dart' as http;       // object from http package to access http methods:

 // Cubit: that contain Functions of Auth api:
class AuthCubit extends Cubit <AuthStates>{
  AuthCubit():super(AuthIntialState());

  static const String baseUrl = 'https://localhost:7151/api/Account';
  static const String registerApi = '$baseUrl/register';                 // register api:
  static const String loginApi = '$baseUrl/login';                      // login api:
  static const String forgetPasswordApi = '$baseUrl/forgetPassword';   // forget password api:
  static const String resetPasswordApi = '$baseUrl/resetPassword';    // reset password api:
  static const String rolesApi = '$baseUrl/roles';                   // roles of users api:
  static const String googleLoginApi = '$baseUrl/googleLogin';      // googleLogin api:


 // Method of Register => http (post) => request:

     void  register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String city,
    required String country,
    required String district,
    required String phoneNumber,
    required String roleId,
    })async{
   
     emit(RegisterLoadingState());        // show loading for User: 
    // call Api:

    try{
      Response response =await http.post(           // store the response that return from api:
     Uri.parse(registerApi),
     // send data to database: 
     body: {                 
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "city": city,
          "phoneNumber": phoneNumber,
          "district": district,
          "country": country,
          "roleId": roleId,
        }
      );
    
     
     if(response.statusCode == 200 || response.statusCode == 201){

     emit(RegisterSuccessState());    // emit Success state:

     }

     else{

       var responseBody = jsonDecode(response.body);       // convert json to map:(parsing):
       // emit failed:
       emit(RegisterErrorStata(message: responseBody['message']));     // to access value of message:

   }

  }  
  
  catch(e){

   emit(RegisterErrorStata(message: e.toString()));

  }


  }


   void login({required String email, required String password})async{

   var response = await http.post(

     Uri.parse(loginApi),

    );




   }


    
    


  }

