import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tuambie/constants/colors.dart';
import 'package:tuambie/constants/sizing.dart';
import 'package:tuambie/features/survey/survey_card.dart';
import 'package:tuambie/shared/labels/custom_input_label.dart';

class SurveyReportsPage extends StatelessWidget {
  const SurveyReportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> productsFromDatabaseStream =
        FirebaseFirestore.instance.collection('surveys').snapshots();
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
                          'Survey Reports',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: productsFromDatabaseStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }

                    if (!snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          smallVerticalSizedBox,
                          CustomInputLabel(labelString: 'Loading...')
                        ],
                      );
                    }
                    if (!snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          smallVerticalSizedBox,
                          CustomInputLabel(labelString: 'No data found...')
                        ],
                      );
                    }

                    final data = snapshot.requireData;
                    if (data.size == 0) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/no_results.svg',
                              height: 260, width: 260),
                          smallVerticalSizedBox,
                          CustomInputLabel(labelString: 'No surveys found...'),
                          smallVerticalSizedBox,
                        ],
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.size,
                          itemBuilder: (BuildContext context, int index) {
                            final String surveyTitle =
                                data.docs[index]['surveyTitle'];
                            final String firstQuestion =
                                data.docs[index]['firstQuestion'];
                            final String secondQuestion =
                                data.docs[index]['secondQuestion'];
                            return Column(
                              children: [
                                SurveyCard(
                                  isClickable: false,
                                  surveyTitle: surveyTitle,
                                  surveyDescription: 'View Results',
                                  publishDate: '',
                                  firstQuestion: firstQuestion,
                                  secondQuestion: secondQuestion,
                                ),
                                smallVerticalSizedBox
                              ],
                            );
                          }),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
