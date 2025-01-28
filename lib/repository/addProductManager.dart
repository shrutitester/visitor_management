import 'package:visitor_management/constants/stringConstants.dart';
import 'package:visitor_management/model/commonModel.dart';
import 'package:visitor_management/utils/apiHelper.dart';

import '../model/adminProfileModel.dart';
import '../model/chartAnalyticsModel.dart';
import '../model/getAnalyticsModel.dart';
import '../model/getVisitorModel.dart';
import '../model/loginModel.dart';
import '../model/visitingTypeModel.dart';

class AddProductNetworkManager {
  static Future<VisitingTypeModel> getVisitorType() async {
    VisitingTypeModel visitingTypeModel;
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Master/GetVisitorType', callType: StringConstants.postCall);
    if (returnMap.containsKey('exception')) {
      visitingTypeModel = VisitingTypeModel();
      visitingTypeModel.status = false;
      visitingTypeModel.message = returnMap['exception'];
      return visitingTypeModel;
    } else if (returnMap.containsKey('statusCode')) {
      visitingTypeModel = VisitingTypeModel();
      visitingTypeModel.status = false;
      visitingTypeModel.message = returnMap['error'];
      return visitingTypeModel;
    } else {
      visitingTypeModel = VisitingTypeModel.fromJson(returnMap['body']);
      return visitingTypeModel;
    }
  }

  static Future<AdminProfileModel> getConcern(
      String phone, String depId) async {
    AdminProfileModel adminProfileModel;
    Map<String, dynamic> bodyMap = {'vPhone': phone, 'vDepId': depId};
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Admin/getAdmin',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      adminProfileModel = AdminProfileModel();
      adminProfileModel.status = false;
      adminProfileModel.message = returnMap['exception'];
      return adminProfileModel;
    } else if (returnMap.containsKey('statusCode')) {
      adminProfileModel = AdminProfileModel();
      adminProfileModel.status = false;
      adminProfileModel.message = returnMap['error'];
      return adminProfileModel;
    } else {
      adminProfileModel = AdminProfileModel.fromJson(returnMap['body']);
      return adminProfileModel;
    }
  }

  static Future<AdminProfileModel> getConcerns(String phone) async {
    AdminProfileModel adminProfileModel;
    Map<String, dynamic> bodyMap = {
      'vPhone': phone,
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Admin/getAdmin',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      adminProfileModel = AdminProfileModel();
      adminProfileModel.status = false;
      adminProfileModel.message = returnMap['exception'];
      return adminProfileModel;
    } else if (returnMap.containsKey('statusCode')) {
      adminProfileModel = AdminProfileModel();
      adminProfileModel.status = false;
      adminProfileModel.message = returnMap['error'];
      return adminProfileModel;
    } else {
      adminProfileModel = AdminProfileModel.fromJson(returnMap['body']);
      return adminProfileModel;
    }
  }

  static Future<VisitingTypeModel> getDepartment() async {
    VisitingTypeModel visitingTypeModel;
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Master/GetDepartment', callType: StringConstants.postCall);
    if (returnMap.containsKey('exception')) {
      visitingTypeModel = VisitingTypeModel();
      visitingTypeModel.status = false;
      visitingTypeModel.message = returnMap['exception'];
      return visitingTypeModel;
    } else if (returnMap.containsKey('statusCode')) {
      visitingTypeModel = VisitingTypeModel();
      visitingTypeModel.status = false;
      visitingTypeModel.message = returnMap['error'];
      return visitingTypeModel;
    } else {
      visitingTypeModel = VisitingTypeModel.fromJson(returnMap['body']);
      return visitingTypeModel;
    }
  }

  static Future<VisitingTypeModel> getVisitorIDType() async {
    VisitingTypeModel visitingTypeModel;
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Master/GetVisitorIDType', callType: StringConstants.postCall);
    if (returnMap.containsKey('exception')) {
      visitingTypeModel = VisitingTypeModel();
      visitingTypeModel.status = false;
      visitingTypeModel.message = returnMap['exception'];
      return visitingTypeModel;
    } else if (returnMap.containsKey('statusCode')) {
      visitingTypeModel = VisitingTypeModel();
      visitingTypeModel.status = false;
      visitingTypeModel.message = returnMap['error'];
      return visitingTypeModel;
    } else {
      visitingTypeModel = VisitingTypeModel.fromJson(returnMap['body']);
      return visitingTypeModel;
    }
  }

  static Future<VisitingTypeModel> getPurpose() async {
    VisitingTypeModel visitingTypeModel;
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Master/GetPurpose', callType: StringConstants.postCall);
    if (returnMap.containsKey('exception')) {
      visitingTypeModel = VisitingTypeModel();
      visitingTypeModel.status = false;
      visitingTypeModel.message = returnMap['exception'];
      return visitingTypeModel;
    } else if (returnMap.containsKey('statusCode')) {
      visitingTypeModel = VisitingTypeModel();
      visitingTypeModel.status = false;
      visitingTypeModel.message = returnMap['error'];
      return visitingTypeModel;
    } else {
      visitingTypeModel = VisitingTypeModel.fromJson(returnMap['body']);
      return visitingTypeModel;
    }
  }

  static Future<GetVisitorModel> getVisitorList(
      String date, String toDate, String aid) async {
    GetVisitorModel getVisitorModel;
    Map<String, dynamic> bodyMap = {
      'fromVisitorDate': date,
      'toVisitorDate': toDate,
      'aid': aid
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Visitor/GetVisitor',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      getVisitorModel = GetVisitorModel();
      getVisitorModel.status = false;
      getVisitorModel.message = returnMap['exception'];
      return getVisitorModel;
    } else if (returnMap.containsKey('statusCode')) {
      getVisitorModel = GetVisitorModel();
      getVisitorModel.status = false;
      getVisitorModel.message = returnMap['error'];
      return getVisitorModel;
    } else {
      getVisitorModel = GetVisitorModel.fromJson(returnMap['body']);
      return getVisitorModel;
    }
  }

  static Future<GetVisitorModel> getProfile(
      String id,
      String status,
      String date,
      String toDate,
      String aid,
      String approvalId,
      String depid) async {
    GetVisitorModel getVisitorModel;
    Map<String, dynamic> bodyMap = {
      'fromVisitorDate': date,
      'toVisitorDate': toDate,
      'vId': id,
      'vStatus': status,
      'aid': aid,
      'vApprovalId': approvalId,
      "vdepid": depid
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Visitor/GetVisitor',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      getVisitorModel = GetVisitorModel();
      getVisitorModel.status = false;
      getVisitorModel.message = returnMap['exception'];
      return getVisitorModel;
    } else if (returnMap.containsKey('statusCode')) {
      getVisitorModel = GetVisitorModel();
      getVisitorModel.status = false;
      getVisitorModel.message = returnMap['error'];
      return getVisitorModel;
    } else {
      getVisitorModel = GetVisitorModel.fromJson(returnMap['body']);
      return getVisitorModel;
    }
  }

  static Future<GetAnalyticsModel> getAnalytics(String id) async {
    GetAnalyticsModel getAnalyticsModel;
    Map<String, dynamic> bodyMap = {
      'vid': id,
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Visitor/GetAnalytics',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      getAnalyticsModel = GetAnalyticsModel();
      getAnalyticsModel.status = false;
      getAnalyticsModel.message = returnMap['exception'];
      return getAnalyticsModel;
    } else if (returnMap.containsKey('statusCode')) {
      getAnalyticsModel = GetAnalyticsModel();
      getAnalyticsModel.status = false;
      getAnalyticsModel.message = returnMap['error'];
      return getAnalyticsModel;
    } else {
      getAnalyticsModel = GetAnalyticsModel.fromJson(returnMap['body']);
      return getAnalyticsModel;
    }
  }

  static Future<GetAnalyticsModel> getAnalyticsHome(String? value) async {
    GetAnalyticsModel getAnalyticsModel;
    Map<String, dynamic> bodyMap = {
      'Aid': value,
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Visitor/GetAnalytics',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      getAnalyticsModel = GetAnalyticsModel();
      getAnalyticsModel.status = false;
      getAnalyticsModel.message = returnMap['exception'];
      return getAnalyticsModel;
    } else if (returnMap.containsKey('statusCode')) {
      getAnalyticsModel = GetAnalyticsModel();
      getAnalyticsModel.status = false;
      getAnalyticsModel.message = returnMap['error'];
      return getAnalyticsModel;
    } else {
      getAnalyticsModel = GetAnalyticsModel.fromJson(returnMap['body']);
      return getAnalyticsModel;
    }
  }

  static Future<ChartAnalytics> getChartAnalytics(
      String? value, String fromdate, String toDate) async {
    ChartAnalytics chartAnalytics;
    Map<String, dynamic> bodyMap = {
      'Aid': value,
      'fromVisitorDate': fromdate,
      'toVisitorDate': toDate
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Visitor/GetChartAnalytics',
        callType: StringConstants.postCall, //964744
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      chartAnalytics = ChartAnalytics();
      chartAnalytics.status = false;
      chartAnalytics.message = returnMap['exception'];
      return chartAnalytics;
    } else if (returnMap.containsKey('statusCode')) {
      chartAnalytics = ChartAnalytics();
      chartAnalytics.status = false;
      chartAnalytics.message = returnMap['error'];
      return chartAnalytics;
    } else {
      chartAnalytics = ChartAnalytics.fromJson(returnMap['body']);
      return chartAnalytics;
    }
  }

  static Future<CommonModel> getUpdateVisitor(
      String id, String status, String reason, String approvalId) async {
    CommonModel commonModel;
    Map<String, dynamic> bodyMap = {
      'vId': id,
      'vStatus': status,
      'vReason': reason,
      'vApprovalId': approvalId
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Visitor/UpdateVisitorStatus',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      commonModel = CommonModel();
      commonModel.status = false;
      commonModel.message = returnMap['exception'];
      return commonModel;
    } else if (returnMap.containsKey('statusCode')) {
      commonModel = CommonModel();
      commonModel.status = false;
      commonModel.message = returnMap['error'];
      return commonModel;
    } else {
      commonModel = CommonModel.fromJson(returnMap['body']);
      return commonModel;
    }
  }

  static Future<CommonModel> getReschedule(String id, String date,
      String timeIn, String timeOut, String approvalId) async {
    CommonModel commonModel;
    Map<String, dynamic> bodyMap = {
      'vId': id,
      'visitDate': date,
      'visitInTime': timeIn,
      'visitOutTime': timeOut,
      'vApprovalId': approvalId
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Visitor/RescheduleVisitor',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      commonModel = CommonModel();
      commonModel.status = false;
      commonModel.message = returnMap['exception'];
      return commonModel;
    } else if (returnMap.containsKey('statusCode')) {
      commonModel = CommonModel();
      commonModel.status = false;
      commonModel.message = returnMap['error'];
      return commonModel;
    } else {
      commonModel = CommonModel.fromJson(returnMap['body']);
      return commonModel;
    }
  }

  static Future<CommonModel> getOutTiming(String id, String status) async {
    CommonModel commonModel;
    Map<String, dynamic> bodyMap = {'vApprovalId': id, 'vStatus': status};
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Visitor/INOUTVisitor',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      commonModel = CommonModel();
      commonModel.status = false;
      commonModel.message = returnMap['exception'];
      return commonModel;
    } else if (returnMap.containsKey('statusCode')) {
      commonModel = CommonModel();
      commonModel.status = false;
      commonModel.message = returnMap['error'];
      return commonModel;
    } else {
      commonModel = CommonModel.fromJson(returnMap['body']);
      return commonModel;
    }
  }

  static Future<CommonModel> getLogin(String phone) async {
    CommonModel commonModel;
    Map<String, dynamic> bodyMap = {
      'vPhone': phone,
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'OTP/SendWhatsApp',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      commonModel = CommonModel();
      commonModel.status = false;
      commonModel.message = returnMap['exception'];
      return commonModel;
    } else if (returnMap.containsKey('statusCode')) {
      commonModel = CommonModel();
      commonModel.status = false;
      commonModel.message = returnMap['error'];
      return commonModel;
    } else {
      commonModel = CommonModel.fromJson(returnMap['body']);
      return commonModel;
    }
  }

  static Future<LoginPage> getVerifyOTP(String phone, String otp) async {
    LoginPage loginPage;
    Map<String, dynamic> bodyMap = {'vPhone': phone, 'vOtp': otp};
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'OTP/VerifyOTP',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      loginPage = LoginPage();
      loginPage.status = false;
      loginPage.message = returnMap['exception'];
      return loginPage;
    } else if (returnMap.containsKey('statusCode')) {
      loginPage = LoginPage();
      loginPage.status = false;
      loginPage.message = returnMap['error'];
      return loginPage;
    } else {
      loginPage = LoginPage.fromJson(returnMap['body']);
      return loginPage;
    }
  }

  static Future<GetVisitorModel> getCheckIn(
    String id,
    String depId,
    String meetTo,
    String purpose,
    String refName,
    String refNo,
    String date,
    String inTime,
    String outTime,
  ) async {
    GetVisitorModel getVisitorModel;
    Map<String, dynamic> bodyMap = {
      'vid': id,
      'visitDate': date,
      'visitInTime': inTime,
      'visitOutTime': outTime,
      'vPurpose': purpose,
      'AId': meetTo,
      'vDepId': depId,
      'vRefName': refName,
      'vRefNo': refNo,
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Visitor/CheckInVisitor',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      getVisitorModel = GetVisitorModel();
      getVisitorModel.status = false;
      getVisitorModel.message = returnMap['exception'];
      return getVisitorModel;
    } else if (returnMap.containsKey('statusCode')) {
      getVisitorModel = GetVisitorModel();
      getVisitorModel.status = false;
      getVisitorModel.message = returnMap['error'];
      return getVisitorModel;
    } else {
      getVisitorModel = GetVisitorModel.fromJson(returnMap['body']);
      return getVisitorModel;
    }
  }

  static Future<GetVisitorModel> getDetailSave(
    String name,
    String email,
    String phone,
    String address,
    String company,
    String image,
    String vIdType,
    String imageId,
    String gender,
  ) async {
    GetVisitorModel getVisitorModel;
    Map<String, dynamic> bodyMap = {
      'vIdType': vIdType,
      'vIdImg': image,
      'vNAME': name,
      'vEMAIL': email,
      'vPHONE': phone,
      'vCompanyNAME': company,
      'vADDRESS': address,
      'vIMG': imageId,
      'vGENDER': gender
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Visitor/SaveVisitor',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      getVisitorModel = GetVisitorModel();
      getVisitorModel.status = false;
      getVisitorModel.message = returnMap['exception'];
      return getVisitorModel;
    } else if (returnMap.containsKey('statusCode')) {
      getVisitorModel = GetVisitorModel();
      getVisitorModel.status = false;
      getVisitorModel.message = returnMap['error'];
      return getVisitorModel;
    } else {
      getVisitorModel = GetVisitorModel.fromJson(returnMap['body']);
      return getVisitorModel;
    }
  }

  static Future<GetVisitorModel> getUpdateDetail(
      String name,
      String email,
      String phone,
      String address,
      String company,
      String gender,
      String vId) async {
    GetVisitorModel getVisitorModel;
    Map<String, dynamic> bodyMap = {
      'vNAME': name,
      'vEMAIL': email,
      'vPHONE': phone,
      'vCompanyNAME': company,
      'vADDRESS': address,
      'vGENDER': gender,
      'vId': vId
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'Visitor/SaveVisitor',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      getVisitorModel = GetVisitorModel();
      getVisitorModel.status = false;
      getVisitorModel.message = returnMap['exception'];
      return getVisitorModel;
    } else if (returnMap.containsKey('statusCode')) {
      getVisitorModel = GetVisitorModel();
      getVisitorModel.status = false;
      getVisitorModel.message = returnMap['error'];
      return getVisitorModel;
    } else {
      getVisitorModel = GetVisitorModel.fromJson(returnMap['body']);
      return getVisitorModel;
    }
  }
}
