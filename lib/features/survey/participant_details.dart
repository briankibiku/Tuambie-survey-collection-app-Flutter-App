import 'package:flutter/material.dart';
import 'package:tuambie/constants/colors.dart';
import 'package:tuambie/constants/numbers.dart';
import 'package:tuambie/constants/sizing.dart';
import 'package:tuambie/routes.dart';
import 'package:tuambie/shared/input_widgets/custom_text_form_field.dart';
import 'package:tuambie/shared/labels/custom_input_label.dart';

class ParticipantDetailsPage extends StatelessWidget {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 6,
                          color: primaryColor,
                        ),
                        smallHorizontalSizedBox,
                        Text(
                          'Provide Your Contact Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ), 
                mediumVerticalSizedBox,
                CustomInputLabel(labelString: 'Full Name'),
                smallVerticalSizedBox,
                CustomTextFormField(), 
                mediumVerticalSizedBox,
                CustomInputLabel(labelString: 'Email'),
                smallVerticalSizedBox,
                CustomTextFormField(), 
                mediumVerticalSizedBox,
                CustomInputLabel(labelString: 'Phone Number'),
                smallVerticalSizedBox,
                CustomTextFormField(),
              ],
            ),
            MaterialButton(
              height: number56,
              minWidth: double.infinity,
              color: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              onPressed: () {
                Navigator.pushNamed(context, Routes.participantDetailsPage);
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
