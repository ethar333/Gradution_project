
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sprint1/Custom_widgets/Text_field_Widget.dart';
import 'package:sprint1/constants/constant.dart';
import 'package:sprint1/login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _registerdesignState();
     
    static const String routeName = 'register_screen';            // routeName of this screen:

}

class _registerdesignState extends State<RegisterScreen> {

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final districtController = TextEditingController();
  final phoneNumber = TextEditingController();

  String? selectedRole;
   String passsword = '';
   String confirmPassword = '';


  final _formKey = GlobalKey<FormState>();            // key of form:

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
    appBar: AppBar(
      //centerTitle: true,
      title: const Row(
      children: [
        Icon(Icons.arrow_back), 
        SizedBox(width: 10),
        Text('Sign Up',
        style: TextStyle(
         color: Constant.blackColorDark,
         fontSize: 24,
         fontWeight: FontWeight.bold
    
      ),
      ), 
      ],
    ),

    ),

      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                const Padding(
                  padding: EdgeInsets.only(left:8),
                  child: Text(
                    "Welcome To Innova App",
                    style: TextStyle(
                        color: Constant.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
               
                 const Padding(
                   padding:  EdgeInsets.only(left:8.0),
                   child: Text(
                      "Start Your journey now!",
                      style: TextStyle(
                          color: Constant.greyColor,
                          fontSize: 15,
                         // fontWeight: FontWeight.bold
                          ),
                    ),
                 ),
            
                 const SizedBox(height: 20,),
            
                 TextFieldWidget(controller: firstnameController, label: 'FirstName', hint: 'Enter Your First Name',
                    isFirstName: true),
                 
                  const SizedBox(height: 15,),

                   TextFieldWidget(controller: lastnameController, label: 'LastName', hint: 'Enter Your Last Name',
                    isLastName: true),
                    
                   const SizedBox(height: 15,),

                 TextFieldWidget(controller:emailController , label: 'Email', hint: 'Enter Your Email',
                    isEmail: true),

                  const SizedBox(height: 15,),

                 TextFieldWidget(controller: passwordController, label: 'Password', hint: 'Enter Your Password',
                  obscureText: false,isPassword: true,
                  isChanged: (value){
                   
                   passsword = value;

                  },
                  ),

                 const SizedBox(height: 15,),
                 TextFieldWidget(controller: confirmPasswordController, label: 'Confirm password', hint: 'please confirm your password',
                  obscureText: false,isConfirmPassword: true,
                  isChanged: (value){
                    confirmPassword = value;
                  },
                  ),

                 const SizedBox(height: 15,),
                 TextFieldWidget(controller: phoneNumber, label: 'phoneNumber', hint: 'Enter Your phoneNumber',
                    isPhone: true,),

                   const SizedBox(height: 15,),
                 TextFieldWidget(controller: countryController, label: 'Country', hint: 'Enter Your Country',
                  isCountry: true,),

                 const SizedBox(height: 15,),

               TextFieldWidget(controller: cityController, label: 'City', hint: 'Enter Your City',
                 isCity: true, ), 

                const SizedBox(height: 15,),
                 TextFieldWidget(controller: districtController, label: 'District', hint: 'Enter Your District',
                  isDistrict: true,),
                  const SizedBox(height: 15,),

                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Select Role",
                     labelStyle: const TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 15
                       ),
                      hintText: "Choose one",
                      suffixIcon: DropdownButton<String>(
                        items: ["User", "Investor", "Owner"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedRole = value;
                          });
                        },
                        underline: SizedBox(), // Removes the default underline
                        icon: Icon(Icons.arrow_drop_down), // Dropdown arrow icon
                      ),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color:Constant.greyColor2),
                      ),
                       focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Constant.greyColor2),
                      ),
                       enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(12),
                       borderSide:const BorderSide(color:Constant.greyColor2),
                   ),
                  ),
                    controller: TextEditingController(text: selectedRole),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a role';
                      }
                      return null;
                    },
                  ),
                ),
            
                  const SizedBox(height: 20,),
            
                 Container(
                  width: double.infinity,
                   child: ElevatedButton(
                    onPressed:() {
                     
                    validateForm();

                   }, 
                   style: ElevatedButton.styleFrom(
                    
                    backgroundColor:Color.fromARGB(255, 63, 154, 152),
                     padding:const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
                     shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                     ),
                     
                   ),
                   child:const Text('Create Account',
                   
                   style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Constant.whiteColor,
                    fontSize: 20,
                   ),
                   
                   ),       
                   ),
                 ),
            
                  const SizedBox(height: 20,),
            
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(
                      color: Constant.blackColor,
                      fontWeight: FontWeight.w400,
                      
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.routname);
                      },
                      child:const Text("Log In",
                       style: TextStyle(
                         fontWeight: FontWeight.w400,
                         color: Color.fromARGB(255, 63, 154, 152),
                       
                       ),
                       ),
                    ),
                  ],
                ),
                 
                const SizedBox(height: 10,),
            
                 
              ],
            ),
          ),
        ),
      ),
    );
  }

   void validateForm() {
  
  if(_formKey.currentState!.validate() == true){

    // register:
  
   }

  }

}
 

