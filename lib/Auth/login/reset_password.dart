
import 'package:flutter/material.dart';
import 'package:sprint1/Custom_widgets/Text_field_Widget.dart';
import 'package:sprint1/constants/constant.dart';

class resetpassword extends StatelessWidget {
  static String routname = "resetpawword";
  final password = TextEditingController();

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
                  size: 100,
                  color: Constant.mainColor,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Reset Password",
              style: TextStyle(
                  color: Constant.mainColor,
                   fontSize: 20, 
                   fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),

            TextFieldWidget(controller: password, label:'New Password' , hint:'Enter New Password'),
                

            SizedBox(
              height: 30,
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
                  'Reset Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}



