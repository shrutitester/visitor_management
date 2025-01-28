class AdminProfileModel {
  String? message;
  bool? status;
  List<LstAdmin>? lstAdmin;

  AdminProfileModel({this.message, this.status, this.lstAdmin});

  AdminProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['lstAdmin'] != null) {
      lstAdmin = <LstAdmin>[];
      json['lstAdmin'].forEach((v) {
        lstAdmin!.add(LstAdmin.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (lstAdmin != null) {
      data['lstAdmin'] = lstAdmin!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LstAdmin {
  String? aID;
  String? aNAME;
  String? aPHONE;
  String? aDepID;
  String? aDepNAME;
  String? aGENDER;
  String? aCompanyNAME;
  String? aEMAIL;
  String? aIMG;
  String? aIdIMG;
  String? aIdTYPE;
  String? aIdTYPENAME;
  String? aPASS;

  LstAdmin(
      {this.aID,
      this.aNAME,
      this.aPHONE,
      this.aDepID,
      this.aDepNAME,
      this.aGENDER,
      this.aCompanyNAME,
      this.aEMAIL,
      this.aIMG,
      this.aIdIMG,
      this.aIdTYPE,
      this.aIdTYPENAME,
      this.aPASS});

  LstAdmin.fromJson(Map<String, dynamic> json) {
    aID = json['AID'];
    aNAME = json['ANAME'];
    aPHONE = json['APHONE'];
    aDepID = json['ADEPID'];
    aDepNAME = json['ADEPNAME'];
    aGENDER = json['AGENDER'];
    aCompanyNAME = json['ACOMPANYNAME'];
    aEMAIL = json['AEMAIL'];
    aIMG = json['AIMG'];
    aIdIMG = json['AIDIMG'];
    aIdTYPE = json['AIDTYPE'];
    aIdTYPENAME = json['AIDTYPENAME'];
    aPASS = json['APASS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AID'] = aID;
    data['ANAME'] = aNAME;
    data['APHONE'] = aPHONE;
    data['ADEPID'] = aDepID;
    data['ADEPNAME'] = aDepNAME;
    data['AGENDER'] = aGENDER;
    data['ACOMPANYNAME'] = aCompanyNAME;
    data['AEMAIL'] = aEMAIL;
    data['AIMG'] = aIMG;
    data['AIDIMG'] = aIdIMG;
    data['AIDTYPE'] = aIdTYPE;
    data['AIDTYPENAME'] = aIdTYPENAME;
    data['APASS'] = aPASS;
    return data;
  }
}
