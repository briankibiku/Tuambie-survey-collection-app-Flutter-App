import 'package:flutter/material.dart';
import 'package:tuambie/constants/colors.dart';
import 'package:tuambie/constants/sizing.dart';
import 'package:tuambie/features/survey/take_survey.dart';
import 'package:tuambie/shared/labels/custom_input_label.dart';

class SurveyCard extends StatelessWidget {
  const SurveyCard(
      {required this.surveyTitle,
      required this.surveyDescription,
      required this.publishDate,
      required this.firstQuestion,
      required this.secondQuestion,
      required this.isClickable});
  final String surveyTitle;
  final String surveyDescription;
  final String publishDate;
  final String firstQuestion;
  final String secondQuestion;
  final bool isClickable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isClickable
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SurveyPage(surveyQuestions: {
                    'firstQuestion': firstQuestion,
                    'secondQuestion': secondQuestion
                  }),
                ),
              )
            : null;

        // Navigator.pushNamed(context, Routes.surveyPage, arguments: {
        //   'firstQuestion': firstQuestion,
        //   'secondQuestion': secondQuestion
        // });
      },
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 70,
                      width: 10,
                      decoration: BoxDecoration(
                          color: fadedPrimaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4))),
                    ),
                    smallHorizontalSizedBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomInputLabel(labelString: surveyTitle),
                        verySmallVerticalSizedBox,
                        Text(
                          surveyDescription,
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        Text(
                          publishDate,
                          style: TextStyle(fontSize: 10, color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
                isClickable ? Icon(Icons.arrow_forward) : Text('')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
