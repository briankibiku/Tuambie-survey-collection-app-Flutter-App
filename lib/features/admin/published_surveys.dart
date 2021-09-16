import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tuambie/constants/colors.dart';
import 'package:tuambie/constants/sizing.dart';
import 'package:tuambie/features/survey/survey_card.dart';
import 'package:tuambie/shared/labels/custom_input_label.dart';

class AdminViewllSurveysPage extends StatelessWidget {
  final Stream<QuerySnapshot> productsFromDatabaseStream =
      FirebaseFirestore.instance.collection('surveys').snapshots();
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
                      'Published Surveys',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
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
                          CustomInputLabel(
                              labelString:
                                  'Use the Add Product button to add products.')
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
                            final surveyDescription =
                                data.docs[index]['surveyDescription'];
                            final String surveyTitle =
                                data.docs[index]['surveyTitle'];
                            final String publishDate =
                                data.docs[index]['publishDate'];
                            final String firstQuestion =
                                data.docs[index]['firstQuestion'];
                            final String secondQuestion =
                                data.docs[index]['secondQuestion'];
                            return Column(
                              children: [
                                SurveyCard(
                                  isClickable: false,
                                  surveyTitle: surveyTitle,
                                  surveyDescription: surveyDescription,
                                  publishDate: publishDate,
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
                // SizedBox(
                //   height: MediaQuery.of(context).size.height - 200,
                //   child: ListView(
                //     shrinkWrap: true,
                //     children: [
                //       SurveyCard(),
                //       smallVerticalSizedBox,
                //       SurveyCard(),
                //       smallVerticalSizedBox,
                //       SurveyCard(),
                //       smallVerticalSizedBox,
                //       SurveyCard(),
                //       smallVerticalSizedBox,
                //       SurveyCard(),
                //       smallVerticalSizedBox,
                //     ],
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
