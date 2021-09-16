import 'package:flutter/material.dart';
import 'package:tuambie/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {this.customController,
      this.isObscure,
      this.keyBoardType,
      this.onChangeFunc});
  final TextEditingController? customController;
  final bool? isObscure;
  final TextInputType? keyBoardType;
  final Function(String)? onChangeFunc;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextFormField(
        keyboardType: keyBoardType ?? TextInputType.name,
        controller: customController,
        obscureText: isObscure ?? false,
        onChanged: onChangeFunc,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(4))),
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusColor: primaryColor,
          // fillColor: fadedPrimaryColor,
          filled: true,
        ),
      ),
    );
  }
}
