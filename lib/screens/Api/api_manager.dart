import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/screens/Add_Diseases/DiseaseRespnse.dart';
import 'package:flutter_application_1/screens/Add_Diseases/Diseases_Request.dart';
import 'package:flutter_application_1/screens/Escort/EscortRequest.dart';
import 'package:flutter_application_1/screens/Escort/Escort_request.dart';
import 'package:flutter_application_1/screens/Escort/Escort_response.dart';
import 'package:flutter_application_1/screens/add_screen.dart';
import 'package:http/http.dart' as http;
import '../../Dialog.dart';
import '../Drage/Drage_Request.dart';
import '../Drage/Drage_Response.dart';
import '../Escort/EscortResponse.dart';
import '../Login/Login_Response.dart';
import '../Paitent/paitentRequest.dart';
import '../Paitent/paitentRespnse.dart';
import '../Paitent/paitent_request.dart';
import '../Paitent/paitent_response.dart';
import '../Register/Register_Request.dart';
import '../Register/Register_Response.dart';
import '../addPaitientInfo_screen.dart';
import 'api_constant.dart';

class Api_manager {
  static Future<RegisterResponse?> register(
      String name,
      String emaill,
      String Password,
      String RePassword,
      String PhoneNumber,
      BuildContext context) async {
    Uri url = Uri.https(Api_constant.baseurl, Api_constant.register);
    DialogUtils.showLoading(context, "Loding");
    try {
      var requestbody = RegisterRequest(
          name: name,
          emaill: emaill,
          password: Password,
          rePassword: RePassword,
          phoneNumber: PhoneNumber);
      var response = await http.post(url, body: requestbody.toJson());
      if (response.statusCode == 201) {
        DialogUtils.closeLoading(context);
        DialogUtils.showMessage(context,
            message: "Register Succuessfully",
            title: "Success",
            posActionName: 'Ok', posAction: () {
              Navigator.of(context).pushNamed(AddScreen.routeName);
            });
        return RegisterResponse.fromJson(jsonDecode(response.body));
      }
      if (response.statusCode == 400) {
        DialogUtils.closeLoading(context);
        DialogUtils.showMessage(context,
            message: "register with this name already exists  ",
            title: "Fail",
            posActionName: 'Ok');
      }
    } catch (e) {
      throw e;
    }
    return null;
  }

  static Future<LoginResponse?> Login(
      String name, String Password, BuildContext context) async {
    Uri url = Uri.https(Api_constant.baseurl, Api_constant.Login);
    DialogUtils.showLoading(context, "Loding");
    try {
      var headers = {'Content-Type': 'application/json'};
      Map<String, String> requestbody = {
        "username": name,
        'Password': Password,
      };
      var response =
      await http.post(url, body: jsonEncode(requestbody), headers: headers);

      if (response.statusCode == 201) {
        DialogUtils.closeLoading(context);
        DialogUtils.showMessage(context,
            message: "Login Succuessfully",
            title: "Success",
            posActionName: 'Ok', posAction: () {
              Navigator.of(context).pushNamed(AddScreen.routeName);
            });
        return LoginResponse.fromJson(jsonDecode(response.body));
      }
      if (response.statusCode == 400) {
        DialogUtils.closeLoading(context);
        DialogUtils.showMessage(context,
            message: "register with this name already exists  ",
            title: "Fail",
            posActionName: 'Ok');
      }
    } catch (e) {
      throw e;
    }
    return null;
  }

  static Future<DiseaseResponse?> registerDisease(
      String deasesname,
      String deasesDiscription,
      String commenSymptoms,
      BuildContext context) async {
    Uri url = Uri.https(Api_constant.baseurl, Api_constant.Diseases);
    DialogUtils.showLoading(context, "Loading");

    var headers = {'Content-Type': 'application/json'};
    try {
      var requestBody = DiseasesRequest(
        deasesname: deasesname,
        deasesDiscription: deasesDiscription,
        commenSymptoms: commenSymptoms,
      );
      var response = await http.post(
          headers: headers, url, body: jsonEncode(requestBody.toJson()));
      print(response.statusCode);
      if (response.statusCode == 201) {
        DialogUtils.closeLoading(context);
        DialogUtils.showMessage(context,
            message: "Disease Added successfully",
            title: "Success",
            posActionName: 'Ok', posAction: () {
              Navigator.of(context).pushNamed(AddPatientInfo.routeName);
            });
        return DiseaseResponse.fromJson(jsonDecode(response.body));
      }
      if (response.statusCode == 400) {
        DialogUtils.closeLoading(context);
        DialogUtils.showMessage(context,
            message: "failed operation", title: "Fail", posActionName: 'Ok');
      }
    } catch (e) {
      throw e;
    }
    return null;
  }

  static Future<PaitentResponse?> registerPatient(
      String firstName,
      String lastName,
      String email,
      String phoneNumber,
      String handel,
      // String profilePicture,
      bool male,
      bool female,
      BuildContext context) async {
    Uri url = Uri.https(Api_constant.baseurl, Api_constant.Patinet);
    DialogUtils.showLoading(context, "Loading");
    // var headers = {
    //   'Content-Type': 'application/json',
    // };
    try {
      var requestBody = PaitentRequest(
        firstName: firstName,
        lasttName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        handel: handel,
        // profilePicture: profilePicture,
        male: male,
        female: female,
      );
      var headers = {'Content-Type': 'application/json'};
      var response = await http.post(
          headers: headers, url, body: jsonEncode(requestBody.toJson()));
      if (response.statusCode == 201) {
        DialogUtils.closeLoading(context);
        DialogUtils.showMessage(
          context,
          message: "Paitent Added Successfully",
          title: "Success",
          posActionName: 'Ok',
          posAction: () {
            Navigator.of(context).pushNamed('/AddScreen');
          },
        );
        return PaitentResponse.fromJson(jsonDecode(response.body));
      }
      if (response.statusCode == 400) {
        DialogUtils.closeLoading(context);
        DialogUtils.showMessage(
          context,
          message: "Failed to add paitent",
          title: "Fail",
          posActionName: 'Ok',
        );
      }
    } catch (e) {
      DialogUtils.closeLoading(context);
      DialogUtils.showMessage(
        context,
        message: "An error occurred: $e",
        title: "Error",
        posActionName: 'Ok',
      );
    }
    return null;
  }

  static Future<EscortResponse?> registerEscort(
      String firstName,
      String lasttName,
      String email,
      String phoneNumber,
      String yourHandel,
      bool male,
      bool female,
      BuildContext context) async {
    Uri url = Uri.https(Api_constant.baseurl, Api_constant.Escort);
    DialogUtils.showLoading(context, "Loding");
    try {
      print('function test');
      print(firstName);
      var requestbody = EscortRequest(
          firstName: firstName,
          lasttName: lasttName,
          email: email,
          phoneNumber: phoneNumber,
          yourHandel: yourHandel,
          male: male,
          female: female);

      var headers = {'Content-Type': 'application/json'};
      var response = await http.post(url,
          body: jsonEncode(requestbody.toJson()), headers: headers);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
        DialogUtils.closeLoading(context);
        DialogUtils.showMessage(context,
            message: "Register Succuessfully",
            title: "Success",
            posActionName: 'Ok', posAction: () {
              Navigator.of(context).pushNamed(AddScreen.routeName);
            });
      }
      if (response.statusCode == 400) {
        DialogUtils.closeLoading(context);
        DialogUtils.showMessage(context,
            message: "register with this name already exists",
            title: "Fail",
            posActionName: 'Ok');
      }
    } catch (e) {
      print(e);
      throw e;
    }
    return null;}
  static Future<DrageResponse?> Drage(
      String drugName,
      String purposeOfUse,
      String description,
      String durationOfUse,
      int numberOfTimesDay,
      String type,
      String expireDate,
      int pillsnum,
      BuildContext context) async {
    Uri url = Uri.https(Api_constant.baseurl, Api_constant.Drage);
    DialogUtils.showLoading(context, "Loding");
    try {
      var requestbody = DrageRequest(
          drugName: drugName,purposeOfUse: purposeOfUse,description:
      description,durationOfUse: durationOfUse,
          numberOfTimesDay: numberOfTimesDay,
          type: type,expireDate: expireDate,pillsnum: pillsnum
      );
      var response = await http.post(url, body: requestbody.toJson());
      if (response.statusCode == 201) {
        DialogUtils.closeLoading(context);
        DialogUtils.showMessage(context,
            message: "Register Succuessfully",
            title: "Success",
            posActionName: 'Ok', posAction: () {
              Navigator.of(context).pushNamed(AddScreen.routeName);
            });
        return DrageResponse.fromJson(jsonDecode(response.body));
      }
      if (response.statusCode == 400) {
        DialogUtils.closeLoading(context);
        DialogUtils.showMessage(context,
            message: "register with this name already exists  ",
            title: "Fail",
            posActionName: 'Ok');
      }
    } catch (e) {
      throw e;
    }
    return null;
  }
}


