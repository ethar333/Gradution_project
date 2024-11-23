
import 'package:flutter/material.dart';
import 'package:sprint1/Custom_widgets/Text_field_Widget.dart';
import 'package:sprint1/constants/constant.dart';

class forgetpassword extends StatelessWidget {

  static const String routname = "forget_password";


  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock,
                  size: 65,
                  color: Constant.mainColor,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Forget Password",
              style: TextStyle(
                color: Constant.mainColor, 
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Please Enter Your Email Address",
                  style: TextStyle(color: Constant.mainColor
                  , fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            TextFieldWidget(controller: email, label: 'Email', hint: 'Please Enter Your Email',
            isEmail: true, ),
          
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 63, 154, 152),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 13.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                child: const Text(
                  'Send',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTextFormField(
    TextEditingController controller, String label, String hint,
    {bool obscureText = false,
    bool isName = false,
    bool isEmail = false,
    bool isPassword = false}) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(14), // تقليل المسافة داخل الـ TextField
        labelText: label,
        labelStyle: TextStyle(color: Constant.mainColor, fontSize: 15),
        hintText: hint,
        hintStyle: TextStyle(
          color: Constant.mainColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Constant.mainColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Constant.mainColor)),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Constant.mainColor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (isName && !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
          return 'Please enter a valid name (letters only)';
        }
        if (isEmail &&
            !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                .hasMatch(value)) {
          return 'Please enter your valid email';
        }
        if (isPassword && value.length < 8) {
          return 'password must be at least 8 chars';
        }
      },
    ),
  );
}
