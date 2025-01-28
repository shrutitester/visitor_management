import 'package:get/get.dart';
import 'package:visitor_management/model/commonModel.dart';
import 'package:visitor_management/model/getVisitorModel.dart';
import 'package:visitor_management/model/visitingTypeModel.dart';
import 'package:visitor_management/repository/addProductManager.dart';

import '../model/adminProfileModel.dart';
import '../model/chartAnalyticsModel.dart';
import '../model/getAnalyticsModel.dart';
import '../model/loginModel.dart';

class AddProductController extends GetxController {
  // String currentDate = DateFormat('dd-MMM-yyyy').format(DateTime.now());
  List<VType> vType = [];
  List<VType> department = [];
  List<VType> vIdType = [];
  List<VType> purposed = [];
  List<LstParty> lstParty = [];
  List<LstParty> visitor = [];
  List<LstParty> upcoming = [];
  List<LstParty> party = [];
  List<LstParty> checkIn = [];
  List<LstAnalytic> lstAnalytic = [];
  List<LstAnalytic> lstAnalytics = [];
  List<LstAdmin> lstAdmin = [];
  List<LstLogin> lstLogin = [];
  List<LstAnalytics> listAnalytics =[];
  String? name, no,gender,
      visitorId,
      visitorName,
      pending,
      pendingStatus,
      email,
      phone,
      address,
      visitorType,
      purpose,
      date,
      time,
      timeOut,
      id,
      msg,
      status,
      visitorMsg,
      visitorStatus,
      outTiming,
      img,
      adminMsg,
      adminId,
      checkInMsg,
      aId,
      otp;
  bool? otpStatus;
  bool? adminStatus;
  bool? checkStatus;
  int? noOfParty;
  CommonModel? model;

  @override
  void onInit() {
    getVisitorType();
    getDepartment();
    getVisitorIDType();
    getPurpose();
    getProfile('', '', '', '', '', '','');
    // getUpcomingList(currentDate,currentDate,"");
    super.onInit();
  }

  getVisitorType() async {
    VisitingTypeModel data = await AddProductNetworkManager.getVisitorType();
    vType.clear();
    if (data.vType != null) {
      vType.addAll(data.vType!);
    }
    update();
  }

  getConcern(String phone, String depId) async {
    AdminProfileModel data = await AddProductNetworkManager.getConcern(phone, depId);
    lstAdmin.clear();
    if (data.lstAdmin != null) {
      lstAdmin.addAll(data.lstAdmin!);
      aId = data.lstAdmin![0].aID;
    }
    update();
  }

  getConcerns(String phone) async {
    AdminProfileModel data = await AddProductNetworkManager.getConcerns(phone);
    lstAdmin.clear();
    if (data.lstAdmin != null) {
      lstAdmin.addAll(data.lstAdmin!);
      aId = data.lstAdmin![0].aID;
    }
    update();
  }

  getDepartment() async {
    VisitingTypeModel data = await AddProductNetworkManager.getDepartment();
    department.clear();
    if (data.vType != null) {
      department.addAll(data.vType!);
    }
    update();
  }

  getVisitorIDType() async {
    VisitingTypeModel data = await AddProductNetworkManager.getVisitorIDType();
    vIdType.clear();
    if (data.vType != null) {
      vIdType.addAll(data.vType!);
    }
    update();
  }

  getPurpose() async {
    VisitingTypeModel data = await AddProductNetworkManager.getPurpose();
    purposed.clear();
    if (data.vType != null) {
      purposed.addAll(data.vType!);
    }
    update();
  }

  getDetailSave(
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
    update();
    GetVisitorModel data = await AddProductNetworkManager.getDetailSave(
        name, email, phone, address, company, image, vIdType, imageId, gender,);
    if (data.lstParty != null) {
      party.addAll(data.lstParty ?? []);
      status = data.status.toString();
      msg = data.message;
      id = data.lstParty![0].vID;
    }
    update();
  }

  getUpdateDetail(
      String name,
      String email,
      String phone,
      String address,
      String company,
      String gender,
      String vId
      ) async {
    update();
    GetVisitorModel data = await AddProductNetworkManager.getUpdateDetail(
        name, email, phone, address, company, gender, vId);
    if (data.lstParty != null) {
      party.addAll(data.lstParty ?? []);
      status = data.status.toString();
      msg = data.message;
    }
    update();
  }

  getCheckIn(
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
    update();
    GetVisitorModel data = await AddProductNetworkManager.getCheckIn(
        id, depId, meetTo, purpose, refName, refNo, date, inTime, outTime);
    checkIn.clear();
    if (data.lstParty != null) {
      checkIn.addAll(data.lstParty ?? []);
      checkInMsg = data.message;
      checkStatus = data.status;
    }
    update();
  }

  getVisitorList(String date, String toDate, String aid) async {
    GetVisitorModel data =
        await AddProductNetworkManager.getVisitorList(date, toDate, aid);
    visitor.clear();
    if (data.lstParty != null) {
      visitor.addAll(data.lstParty ?? []);
    }
    update();
  }

  getUpcomingList(String date, String toDate, String aid) async {
    GetVisitorModel data =
        await AddProductNetworkManager.getVisitorList(date, toDate, aid);
    upcoming.clear();
    if (data.lstParty != null) {
      upcoming.addAll(data.lstParty ?? []);
    }
    update();
  }

  getProfile(
      String id, String status, String dated, String toDate, String aid, String approvalId, String depid) async {
    GetVisitorModel data = await AddProductNetworkManager.getProfile(
        id, status, dated, toDate, aid, approvalId, depid);
    lstParty.clear();
    if (data.lstParty != null) {
      lstParty.addAll(data.lstParty!);
      name = data.lstParty![0].vNAME;
      gender = data.lstParty![0].vGender;
      email = data.lstParty![0].vEMAIL;
      phone = data.lstParty![0].vPHONE;
      address = data.lstParty![0].vADDRESS;
      visitorType = data.lstParty![0].vIDTypeName;
      purpose = data.lstParty![0].vCompanyNAME;
      img = data.lstParty![0].vImg;
      time = data.lstParty![0].visitINTIME;
      timeOut = data.lstParty![0].visitOUTTIME;
    }
    update();
  }

  getAnalytics(String id) async {
    GetAnalyticsModel data = await AddProductNetworkManager.getAnalytics(id);
    if (data.lstAnalytic != null) {
      lstAnalytic.clear();
      lstAnalytic.addAll(data.lstAnalytic!);
    }
    update();
  }

  getAnalyticsHome(String? value) async {
    GetAnalyticsModel data = await AddProductNetworkManager.getAnalyticsHome(value);
    if (data.lstAnalytic != null) {
      lstAnalytics.clear();
      lstAnalytics.addAll(data.lstAnalytic!);
    }
    update();
  }

  getChartAnalytics(String? value,String fromdate, String toDate) async {
    ChartAnalytics data = await AddProductNetworkManager.getChartAnalytics(value, fromdate, toDate);
    if (data.lstAnalytics != null) {
      listAnalytics.clear();
      listAnalytics.addAll(data.lstAnalytics!);
    }
    update();
  }

  getUpdateVisitor(
      String id, String status, String reason, String approvalId) async {
    CommonModel data = await AddProductNetworkManager.getUpdateVisitor(
        id, status, reason, approvalId);
    if (data.message != null) {
      visitorMsg = data.message;
    }
    update();
  }

  getReschedule(String id, String date, String timeIn, String timeOut,
      String approvalId) async {
    CommonModel data = await AddProductNetworkManager.getReschedule(
        id, date, timeIn, timeOut, approvalId);
    if (data.message != null) {
      visitorStatus = data.message;
    }
    update();
  }

  getOutTiming(String id, String status) async {
    CommonModel data = await AddProductNetworkManager.getOutTiming(id, status);
    if (data.message != null) {
      outTiming = data.message;
    }
    update();
  }

  getLogin(String phone) async {
    CommonModel data = await AddProductNetworkManager.getLogin(phone);
    if (data.message != null) {
      otp = data.message;
    }
    update();
  }

  getVerifyOTP(String phone, String otp) async {
    LoginPage data = await AddProductNetworkManager.getVerifyOTP(phone, otp);
    lstLogin.clear();
    if (data.lstLogin != null) {
      lstLogin.addAll(data.lstLogin!);
      otpStatus = data.status;
      noOfParty = data.lstLogin!.length;
    }
    update();
  }

}
