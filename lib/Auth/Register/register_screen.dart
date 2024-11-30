
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprint1/Auth/auth_cubit/Auth_cubit.dart';
import 'package:sprint1/Auth/auth_cubit/Auth_states.dart';
import 'package:sprint1/Custom_widgets/Text_field_Widget.dart';
import 'package:sprint1/constants/constant.dart';
import 'package:sprint1/Auth/login/login_screen.dart';
import 'package:sprint1/home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreenState();

  static const String routeName =
    'register_screen';                     // routeName of this screen:
  }

class RegisterScreenState extends State<RegisterScreen> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final districtController = TextEditingController();
  final phoneNumberController = TextEditingController();
  bool isObscurepassword = true;
  bool isObscureconfirm = true; // To control the visibility of password:

  String? selectedRole;
  bool isLoading = false;
  String? errorMessage;

  final _formKey = GlobalKey<FormState>(); // key of form:

  //final _authService = AuthService();                // Instance of AuthService

  /*void validateAndSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      try {
        await _authService.register(
          firstName: firstnameController.text,
          lastName: lastnameController.text,
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
          city: cityController.text,
          country: countryController.text,
          district: districtController.text,
          phoneNumber:phoneNumberController.text,
          roleId: '84cfb1b6-de20-4b01-a39c-e34dcd708bd3',
        );

        setState(() {
          isLoading = false;
        });


      final snackBar =  SnackBar(

              content: Text('Registration successful!'),
              duration: Duration(seconds: 3),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);

        // Navigate to the profile screen on success
        Navigator.push( context, MaterialPageRoute(
            builder: (context) => ProfileScreen(
              firstnameController: firstnameController.text,
              lastnameController: lastnameController.text,
              emailController: emailController.text,
              passwordController: passwordController.text,
              cityController: cityController.text,
              phoneNumber: phoneNumberController.text,
            ),
          ),
        );
      }
       catch (e) {
        setState(() {
          isLoading = false;
          errorMessage = e.toString();
        });
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    // var cubitProvider = BlocProvider.of<AuthCubit>(context);
    return BlocProvider(
      create: (context) => AuthCubit(), // to initialize AuthCubit:
      child: BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
        } else if (state is RegisterErrorStata) {
          // show an error message:
          final snackBar = SnackBar(
            content: Text(state.message),
            duration: const Duration(seconds: 10),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }, builder: (context, state) {
        // to build UI:

        return Scaffold(
          appBar: AppBar(
            //centerTitle: true,
            backgroundColor: Colors.transparent,
            title: const Row(
              children: [
              //  Icon(Icons.arrow_back),
                SizedBox(width: 10),
                Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Constant.blackColorDark,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
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
                        "Welcome To Innova App",
                        style: TextStyle(
                            color: Constant.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Start Your journey now!",
                        style: TextStyle(
                          color: Constant.greyColor,
                          fontSize: 15,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),



             Row(children: [
                TextFieldWidget(
                        controller: firstnameController,
                        label: 'FirstName',
                        hint: 'Enter Your First Name',
                        isFirstName: true),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                        controller: lastnameController,
                        label: 'LastName',
                        hint: 'Enter Your Last Name',
                        isLastName: true),
              ],
              ),
                  /*TextFieldWidget(
                        controller: firstnameController,
                        label: 'FirstName',
                        hint: 'Enter Your First Name',
                        isFirstName: true),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                        controller: lastnameController,
                        label: 'LastName',
                        hint: 'Enter Your Last Name',
                        isLastName: true),*/


                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                        controller: emailController,
                        label: 'Email',
                        hint: 'Enter Your Email',
                        isEmail: true),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                      controller: passwordController,
                      label: 'Password',
                      hint: 'Enter Your Password',
                      obscureText: isObscurepassword,
                      isPassword: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscurepassword =!isObscurepassword; // تبديل حالة النص عند الضغط
                          
                          });
                        },

                        icon: Icon(
                          isObscurepassword
                              ? Icons.visibility_off
                              : Icons.visibility, // To show Icon:
                          color: isObscurepassword
                              ? Colors.grey
                              : Constant.blackColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        // onChanged:isChanged,
                        controller: confirmPasswordController,
                        obscureText: isObscureconfirm,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(
                              14), // تقليل المسافة داخل الـ TextField
                          labelText: 'Confirm password',
                          labelStyle: const TextStyle(
                              color: Color(0xFF333333), fontSize: 15),
                          hintText: 'please confirm your password',
                          hintStyle: const TextStyle(
                            color: Color(0xFF333333),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xFFB2B1B1),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Constant.greyColor2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Constant.greyColor2),
                          ),

                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscureconfirm =
                                    !isObscureconfirm; // تبديل حالة النص عند الضغط
                              });
                            },
                            icon: Icon(
                              isObscureconfirm
                                  ? Icons.visibility_off
                                  : Icons.visibility, // To show Icon:
                              color: isObscurepassword
                                  ? Colors.grey
                                  : Constant.blackColor,
                            ),
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),

                    /*TextFieldWidget(controller: confirmPasswordController, label: 'Confirm password', hint: 'please confirm your password',
                      obscureText: isObscureconfirm,isConfirmPassword: true,
                      
                      ),*/

                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                      controller: phoneNumberController,
                      label: 'phoneNumber',
                      hint: 'Enter Your phoneNumber',
                      isPhone: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                      controller: countryController,
                      label: 'Country',
                      hint: 'Enter Your Country',
                      isCountry: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                      controller: cityController,
                      label: 'City',
                      hint: 'Enter Your City',
                      isCity: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                      controller: districtController,
                      label: 'District',
                      hint: 'Enter Your District',
                      isDistrict: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: "Select Role",
                          labelStyle: const TextStyle(
                              color: Color(0xFF333333), fontSize: 15),
                          hintText: "Choose one",
                          suffixIcon: DropdownButton<String>(
                            items: ["User", "Investor", "Owner"]
                                .map((String value) {
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
                            underline:
                                const SizedBox(), // Removes the default underline
                            icon: const Icon(
                                Icons.arrow_drop_down), // Dropdown arrow icon
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                const BorderSide(color: Constant.greyColor2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                const BorderSide(color: Constant.greyColor2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Constant.greyColor2),
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
                    const SizedBox(
                      height: 20,
                    ),
                    if (errorMessage != null)
                      Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.black),
                      ),
                    const SizedBox(height: 10),
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                //validateForm();
                                if (_formKey.currentState!.validate() == true) {
                                  // register:
                                  // object from cubit to access Method:
                                  BlocProvider.of<AuthCubit>(context).register(
                                    firstName: firstnameController
                                        .text, // to access value from textfield:
                                    lastName: lastnameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    confirmPassword:
                                        confirmPasswordController.text,
                                    city: cityController.text,
                                    country: countryController.text,
                                    district: districtController.text,
                                    phoneNumber: phoneNumberController.text,
                                    roleId: selectedRole!,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 63, 154, 152),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 13.0),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              child: Text(
                                state is RegisterLoadingState
                                    ? 'Loading...'
                                    : // else:

                                    'Create Account',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Constant.whiteColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
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
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                          },
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 63, 154, 152),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void validateForm() {
    if (_formKey.currentState!.validate() == true) {
      // register:
      // object from cubit to access Method:
      BlocProvider.of<AuthCubit>(context).register(
        firstName: firstnameController.text, // to access value from textfield:
        lastName: lastnameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        city: cityController.text,
        country: countryController.text,
        district: districtController.text,
        phoneNumber: phoneNumberController.text,
        roleId: selectedRole!,
      );
    }
  }
}
