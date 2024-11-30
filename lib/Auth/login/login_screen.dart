
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sprint1/Custom_widgets/Text_field_Widget.dart';
import 'package:sprint1/Auth/Register/register_screen.dart';
import 'package:sprint1/constants/constant.dart';
import 'package:sprint1/Auth/login/forget_password.dart';
import 'package:sprint1/home/home_screen.dart';


class LoginScreen extends StatefulWidget {

  static const String routname = 'login_screen';                   // routeName of login screen:

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final email = TextEditingController();
  final passsword = TextEditingController();

  final _formKey = GlobalKey<FormState>();            // key of form Widget:

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //centerTitle: true,
          title: const Text(
            'Log In',
            style: TextStyle(
                color: Constant.blackColorDark,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),


        ),

    

        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                            color: Constant.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Sign in to your account",
                        style: TextStyle(
                          color: Constant.greyColor,
                          fontSize: 15,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  
                    const SizedBox(height: 50,),
                  
                    TextFieldWidget(controller:email, label:'Email Address', hint: 'Enter Your Email',
                    isEmail: true),
                  
                    const SizedBox(height: 20,),
                    
                    TextFieldWidget(controller: passsword, label: 'Password', hint: 'Enter Your Password',
                     isPassword: true,obscureText: true,
                    // suffixIcon: ,
                     ),
                  
                     const SizedBox(height: 15,),                  
                  
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end, children: [
                      InkWell(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context,ForgetPassordScreen.routname);               // Navigation:
                          },
                          child: const Text("Forget Password",
                              style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 112, 182, 182),
                       ),
                        ),
                        ),
                      ),
                    ],
                    ),
                  
                    const SizedBox(height:18 ,),
                  
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          validateForm();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  Constant.mainColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 13.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            
                  
                  
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Constant.whiteColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        ),
                    ),
                  
                    const SizedBox(height: 25,),
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don’t have an account?",
                          style: TextStyle(
                            color: Constant.blackColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                  
                        const SizedBox(width: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                            context, RegisterScreen.routeName);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color.fromARGB(255, 112, 182, 182),
                            ),
                          ),
                        ),
                  
                        const SizedBox(height: 15,),
                      ],
                    ),
                  
                    const SizedBox(  height: 25, ),
                    const Center(
                      child:  Text(
                        'Or Sign In With',
                        style: TextStyle(
                          color: Constant.greyColor,
                        ),
                      ),
                    ),
                  
                    const SizedBox( height: 20,  ),
                     Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                    IconButton(
                      onPressed: () {
                        
                      },
                      
                                   icon: const FaIcon(FontAwesomeIcons.google),      // add Google Icon:
                      iconSize: 30,
                      color: Constant.mainColor,
                     // color: Colors.teal,
                    ),
                              
                   const Text('Google',
                   style: TextStyle(
                    color:Constant.blackColor ,
                    fontWeight: FontWeight.w400,
                   ),
                   
                   ),
                              
                   //const SizedBox(width:40 ,),
                              
                  /* IconButton(
                      onPressed: () {
                        
                      },
                      
                      icon: const Icon(Icons.facebook),
                      iconSize: 35,
                     color: Constant.mainColor,
                     // color: Colors.teal,
                    ),
                              
                   const Text('Facebook',
                   style: TextStyle(
                    color: Constant.blackColor,
                    fontWeight: FontWeight.w400,
                   ),
                   
                   ),*/
                              
                  ],
                                  ),
                  
                                  ],
                                   ),
                ),
                ),
               ),
             );
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {
    
    // logoin:
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));


    }
  }
}

