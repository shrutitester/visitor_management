import'package:flutter/material.dart';
import 'package:visitor_management/view/checkInQr/checkInQrScreen.dart';
import 'package:visitor_management/view/createProfile/createVisitorProfileScreen.dart';
import 'package:visitor_management/view/home/homeScreen.dart';
import 'package:visitor_management/view/login/loginScreen.dart';
import 'package:visitor_management/view/login/otpVerification.dart';
import '../view/decisionScreen.dart';
import '../view/visitorList/visitorMenu.dart';

class RoutesLinks{
  static const String decisionPage = "decision";
  static const String loginPage = "login";
  static const String otpPage = "otpVerification";
  static const String takePicturePage = "takePicture";
  static const String uploadIdPage = "takePicture";
  static const String loginAdminPage = "loginAdmin";
  static const String homePage = "home";
  static const String visitorListPage = "visitorList";
  static const String enterYourDetailPage = "enterYourDetails";
  static const String profilePage = "profile";
  static const String checkInPage = "checkIn";
  static const String createVisitorProfile = "createVisitorProfile";
  static const String createAdminProfile = "createAdminProfile";
}

class RoutesProvider {
  static Route<dynamic> provideRoutes(RouteSettings settings){
    switch (settings.name) {
      case RoutesLinks.decisionPage:
        return MaterialPageRoute(builder: (context) => const DecisionScreen());
      case RoutesLinks.loginPage:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesLinks.otpPage:
        return MaterialPageRoute(builder: (context) =>  OtpVerificationScreen(''));
      case RoutesLinks.createVisitorProfile:
        return MaterialPageRoute(builder: (context) => CreateProfileScreen(''));
      case RoutesLinks.homePage:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesLinks.visitorListPage:
        return MaterialPageRoute(builder: (context) => const VisitorMenu());
      case RoutesLinks.checkInPage:
        return MaterialPageRoute(builder: (context) =>  CheckInQrScreen(''));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}