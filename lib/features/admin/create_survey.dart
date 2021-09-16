import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tuambie/constants/colors.dart';
import 'package:tuambie/constants/numbers.dart';
import 'package:tuambie/constants/sizing.dart';
import 'package:tuambie/constants/strings.dart';
import 'package:tuambie/routes.dart';
import 'package:tuambie/shared/custom_snackbar.dart';
import 'package:tuambie/shared/input_widgets/custom_text_form_field.dart';
import 'package:tuambie/shared/labels/custom_input_label.dart';
import 'package:intl/intl.dart';

class CrearteSurveyPage extends StatefulWidget {
  @override
  _CrearteSurveyPageState createState() => _CrearteSurveyPageState();
}

class _CrearteSurveyPageState extends State<CrearteSurveyPage> {
  TextEditingController? firstQuestionController;
  TextEditingController? secondQuestionController;
  TextEditingController? surveyDescriptionController;
  TextEditingController? surveyTitleController;
  late String firstQuestion;
  late String secondQuestion;
  late String surveyDescription;
  late String surveyTitle;
  bool isFirstQuestionFilled = false;
  bool isSurveyTitlevalueFilled = false;
  bool issurveyDescriptionFilled = false;
  bool isSecondNameFilled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
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
                      'Create Survey',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                mediumVerticalSizedBox,
                Text(
                  'Create a new survey',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                ),
                mediumVerticalSizedBox,
                CustomInputLabel(labelString: 'Survey Title'),
                smallVerticalSizedBox,
                CustomTextFormField(
                  customController: surveyTitleController,
                  onChangeFunc: (surveyTitlevalue) {
                    setState(() {
                      isSurveyTitlevalueFilled = true;
                      surveyTitle = surveyTitlevalue;
                    });
                  },
                ),
                mediumVerticalSizedBox,
                CustomInputLabel(labelString: 'Survey Description'),
                smallVerticalSizedBox,
                CustomTextFormField(
                  customController: surveyDescriptionController,
                  onChangeFunc: (descriptionvalue) {
                    setState(() {
                      issurveyDescriptionFilled = true;
                      surveyDescription = descriptionvalue;
                    });
                  },
                ),
                mediumVerticalSizedBox,
                CustomInputLabel(labelString: 'Type first question'),
                smallVerticalSizedBox,
                CustomTextFormField(
                  customController: firstQuestionController,
                  onChangeFunc: (firstQuestionvalue) {
                    setState(() {
                      isFirstQuestionFilled = true;
                      firstQuestion = firstQuestionvalue;
                    });
                  },
                ),
                mediumVerticalSizedBox,
                CustomInputLabel(labelString: 'Type second question'),
                smallVerticalSizedBox,
                CustomTextFormField(
                  customController: secondQuestionController,
                  onChangeFunc: (secondQuestionvalue) {
                    setState(() {
                      isSecondNameFilled = true;
                      secondQuestion = secondQuestionvalue;
                    });
                  },
                ),
              ],
            ),
            mediumVerticalSizedBox,
            MaterialButton(
              height: number56,
              minWidth: double.infinity,
              color: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              onPressed: () async {
                if (!isFirstQuestionFilled ||
                    !isSecondNameFilled ||
                    !isSurveyTitlevalueFilled ||
                    !issurveyDescriptionFilled) {
                  customSnackBar(context, fillAllFieldsWarning);
                }
                if (isFirstQuestionFilled &&
                    isSecondNameFilled &&
                    issurveyDescriptionFilled &&
                    isSurveyTitlevalueFilled) {
                  // set loading status of loading indicator
                  _showMaterialDialog(context);
                  DateTime now = DateTime.now();
                  String formattedDate =
                      DateFormat('EEE d MMM y').format(now);
                  // save details to firestore
                  await FirebaseFirestore.instance
                      .collection('surveys')
                      .doc()
                      .set({
                    'firstQuestion': firstQuestion,
                    'secondQuestion': secondQuestion,
                    'publisherName': 'Shakespeare',
                    'surveyTitle': surveyTitle,
                    'surveyDescription': surveyDescription,
                    'publishDate': formattedDate
                  });
                  await Navigator.pushNamed(context, Routes.adminPage);
                }
              },
              child: Text(
                'Publish',
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
            title: new Text('Saving Product...'),
            content: Container(
                height: 40,
                width: 40,
                child: Center(child: new CircularProgressIndicator())),
          ));
}
