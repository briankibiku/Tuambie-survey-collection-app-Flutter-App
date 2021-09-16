import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tuambie/constants/colors.dart';
import 'package:tuambie/constants/numbers.dart';
import 'package:tuambie/constants/sizing.dart';
import 'package:tuambie/constants/strings.dart';
import 'package:tuambie/routes.dart';
import 'package:tuambie/shared/custom_snackbar.dart';
import 'package:tuambie/shared/input_widgets/custom_text_form_field.dart';
import 'package:tuambie/shared/labels/custom_input_label.dart';

class AdminLoginPage extends StatefulWidget {
  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;

  late String email;
  late String password;
  bool isEmailFilled = false;
  bool isPasswordFilled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mediumVerticalSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(
                      image: AssetImage('assets/images/tuambie_banner.png'),
                      height: 80,
                      width: 80,
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 25,
                      width: 6,
                      color: primaryColor,
                    ),
                    smallHorizontalSizedBox,
                    Text(
                      'Admin Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                mediumVerticalSizedBox,
                Text(
                  'Fill credentials to login',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                ),
                mediumVerticalSizedBox,
                CustomInputLabel(labelString: 'Email'),
                smallVerticalSizedBox,
                CustomTextFormField(
                  customController: emailTextController,
                  onChangeFunc: (emailvalue) {
                    setState(() {
                      isEmailFilled = true;
                      email = emailvalue;
                    });
                  },
                ),
                mediumVerticalSizedBox,
                CustomInputLabel(
                  labelString: 'Password',
                ),
                smallVerticalSizedBox,
                CustomTextFormField(
                  customController: passwordTextController,
                  onChangeFunc: (passWordvalue) {
                    setState(() {
                      isPasswordFilled = true;
                      password = passWordvalue;
                    });
                  },
                  isObscure: true,
                ),
              ],
            ),
            MaterialButton(
              height: number56,
              minWidth: double.infinity,
              color: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              onPressed: () async {
                if (!isEmailFilled || !isPasswordFilled) {
                  customSnackBar(context, fillAllFieldsWarning);
                }
                if (isEmailFilled && isPasswordFilled) {
                  _showMaterialDialog(context);
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password);
                    Navigator.pushNamed(context, Routes.adminPage);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                    Navigator.pop(context);
                    customSnackBar(context, 'Wrong email or password entered');
                  }
                }
              },
              child: Text(
                'Proceed',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

_showMaterialDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
            title: new Text('Logging in...'),
            content: Container(
                height: 40,
                width: 40,
                child: Center(child: new CircularProgressIndicator())),
          ));
}
