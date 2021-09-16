import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tuambie/constants/colors.dart';
import 'package:tuambie/constants/sizing.dart';
import 'package:tuambie/routes.dart';
import 'package:tuambie/shared/custom_snackbar.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
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
                          'Admin Portal',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          side: BorderSide(color: primaryColor)),
                      onPressed: () async {
                        Navigator.pushNamed(context, Routes.allSurveysPage);
                        customSnackBar(context, 'You have been logged out');
                      },
                      child: Text('Admin Logout',
                          style: TextStyle(color: primaryColor)),
                    )
                  ],
                ),
                mediumVerticalSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.crearteSurveyPage);
                      },
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Column(
                          children: [
                            Container(
                              height: 10,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: fadedPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4))),
                            ),
                            smallVerticalSizedBox,
                            SvgPicture.asset('assets/images/create.svg',
                                height: 60, width: 60),
                            smallVerticalSizedBox,
                            Text('Create Survey'),
                          ],
                        ),
                      ),
                    ),
                    smallHorizontalSizedBox,
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.surveyReportsPage);
                      },
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Column(
                          children: [
                            Container(
                              height: 10,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: fadedPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4))),
                            ),
                            smallVerticalSizedBox,
                            SvgPicture.asset(
                                'assets/images/customer_review.svg',
                                height: 60,
                                width: 60),
                            smallVerticalSizedBox,
                            Text('Survey Reports'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                mediumVerticalSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.adminViewllSurveysPage);
                      },
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Column(
                          children: [
                            Container(
                              height: 10,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: fadedPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4))),
                            ),
                            smallVerticalSizedBox,
                            SvgPicture.asset('assets/images/create.svg',
                                height: 60, width: 60),
                            smallVerticalSizedBox,
                            Text('View Surveys'),
                          ],
                        ),
                      ),
                    ),
                    smallHorizontalSizedBox,
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.addAdminsPage);
                      },
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Column(
                          children: [
                            Container(
                              height: 10,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: fadedPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4))),
                            ),
                            smallVerticalSizedBox,
                            SvgPicture.asset('assets/images/add.svg',
                                height: 60, width: 60),
                            smallVerticalSizedBox,
                            Text('Add New Admin'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
