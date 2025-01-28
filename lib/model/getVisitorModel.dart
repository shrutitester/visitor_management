class GetVisitorModel {
  String? message;
  bool? status;
  List<LstParty>? lstParty;

  GetVisitorModel({this.message, this.status, this.lstParty});

  GetVisitorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['lstParty'] != null) {
      lstParty = <LstParty>[];
      json['lstParty'].forEach((v) {
        lstParty!.add(LstParty.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (lstParty != null) {
      data['lstParty'] = lstParty!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LstParty {
  String? vID;
  String? vImg;
  String? vNAME;
  String? vEMAIL;
  String? vPHONE;
  String? vADDRESS;
  String? vCompanyNAME;
  String? visitDATE;
  String? visitINTIME;
  String? visitOUTTIME;
  String? vTID;
  String? vTNAME;
  String? vPURPOSE;
  String? vMEETTO;
  String? dEPID;
  String? dEPNAME;
  String? rEFNAME;
  String? rEFNO;
  String? vSTATUS;
  String? vAPPROVALID;
  String? vINTIME;
  String? vOUTTIME;
  String? vIDImg;
  String? vIDType;
  String? vIDTypeName;
  String? vGender;

  LstParty(
      {this.vID,
      this.vImg,
      this.vNAME,
      this.vEMAIL,
      this.vPHONE,
      this.vADDRESS,
      this.vCompanyNAME,
      this.visitDATE,
      this.visitINTIME,
      this.visitOUTTIME,
      this.vTID,
      this.vTNAME,
      this.vPURPOSE,
      this.vMEETTO,
      this.dEPID,
      this.dEPNAME,
      this.rEFNAME,
      this.rEFNO,
      this.vSTATUS,
      this.vAPPROVALID,
      this.vINTIME,
      this.vOUTTIME,
      this.vIDImg,
      this.vIDType,
      this.vIDTypeName,
      this.vGender});

  LstParty.fromJson(Map<String, dynamic> json) {
    vID = json['VID'];
    vImg = json['VImg'];
    vNAME = json['VNAME'];
    vEMAIL = json['VEMAIL'];
    vPHONE = json['VPHONE'];
    vADDRESS = json['VADDRESS'];
    vCompanyNAME = json['VCOMPANYNAME'];
    visitDATE = json['VISITDATE'];
    visitINTIME = json['VISITINTIME'];
    visitOUTTIME = json['VISITOUTTIME'];
    vTID = json['VTID'];
    vTNAME = json['VTNAME'];
    vPURPOSE = json['VPURPOSE'];
    vMEETTO = json['VMEETTO'];
    dEPID = json['DEPID'];
    dEPNAME = json['DEPNAME'];
    rEFNAME = json['REFNAME'];
    rEFNO = json['REFNO'];
    vSTATUS = json['VSTATUS'];
    vAPPROVALID = json['VAPPROVALID'];
    vINTIME = json['VINTIME'];
    vOUTTIME = json['VOUTTIME'];
    vIDImg = json['VIDImg'];
    vIDType = json['VIDType'];
    vIDTypeName = json['VIDTypeName'];
    vGender = json['VGENDER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['VID'] = vID;
    data['VImg'] = vImg;
    data['VNAME'] = vNAME;
    data['VEMAIL'] = vEMAIL;
    data['VPHONE'] = vPHONE;
    data['VADDRESS'] = vADDRESS;
    data['VCOMPANYNAME'] = vCompanyNAME;
    data['VISITDATE'] = visitDATE;
    data['VISITINTIME'] = visitINTIME;
    data['VISITOUTTIME'] = visitOUTTIME;
    data['VTID'] = vTID;
    data['VTNAME'] = vTNAME;
    data['VPURPOSE'] = vPURPOSE;
    data['VMEETTO'] = vMEETTO;
    data['DEPID'] = dEPID;
    data['DEPNAME'] = dEPNAME;
    data['REFNAME'] = rEFNAME;
    data['REFNO'] = rEFNO;
    data['VSTATUS'] = vSTATUS;
    data['VAPPROVALID'] = vAPPROVALID;
    data['VINTIME'] = vINTIME;
    data['VOUTTIME'] = vOUTTIME;
    data['VIDImg'] = vIDImg;
    data['VIDType'] = vIDType;
    data['VIDTypeName'] = vIDTypeName;
    data['VGENDER'] = vGender;
    return data;
  }
}
