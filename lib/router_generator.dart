import 'package:flutter/material.dart';
import 'package:tuambie/features/admin/add_new_admin.dart';
import 'package:tuambie/features/admin/admin_login.dart';
import 'package:tuambie/features/admin/admin_page.dart';
import 'package:tuambie/features/admin/create_survey.dart';
import 'package:tuambie/features/admin/survey_reports.dart';
import 'package:tuambie/features/admin/published_surveys.dart';
import 'package:tuambie/features/login/login.dart';
import 'package:tuambie/features/survey/all_surveys.dart';
import 'package:tuambie/features/survey/participant_details.dart';
import 'package:tuambie/features/survey/take_survey.dart';
import 'package:tuambie/routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.surveyPage:
        return MaterialPageRoute(
            builder: (_) => SurveyPage(
                  surveyQuestions: {},
                ));
      case Routes.participantDetailsPage:
        return MaterialPageRoute(builder: (_) => ParticipantDetailsPage());
      case Routes.adminPage:
        return MaterialPageRoute(builder: (_) => AdminPage());
      case Routes.allSurveysPage:
        return MaterialPageRoute(builder: (_) => AllSurveysPage());
      case Routes.crearteSurveyPage:
        return MaterialPageRoute(builder: (_) => CrearteSurveyPage());
      case Routes.surveyReportsPage:
        return MaterialPageRoute(builder: (_) => SurveyReportsPage());
      case Routes.addAdminsPage:
        return MaterialPageRoute(builder: (_) => AddNewAdminPage());
      case Routes.adminLoginPage:
        return MaterialPageRoute(builder: (_) => AdminLoginPage());
      case Routes.adminViewllSurveysPage:
        return MaterialPageRoute(builder: (_) => AdminViewllSurveysPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
