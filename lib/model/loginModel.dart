class LoginPage {
  bool? status;
  String? message;
  List<LstLogin>? lstLogin;

  LoginPage({this.status, this.message, this.lstLogin});

  LoginPage.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['lstLogin'] != null) {
      lstLogin = <LstLogin>[];
      json['lstLogin'].forEach((v) {
        lstLogin!.add(LstLogin.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (lstLogin != null) {
      data['lstLogin'] = lstLogin!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LstLogin {
  String? type;
  String? vID;
  String? vNAME;
  String? vPHONE;

  LstLogin({this.type, this.vID, this.vNAME, this.vPHONE});

  LstLogin.fromJson(Map<String, dynamic> json) {
    type = json['Type'];
    vID = json['VID'];
    vNAME = json['VNAME'];
    vPHONE = json['VPHONE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Type'] = type;
    data['VID'] = vID;
    data['VNAME'] = vNAME;
    data['VPHONE'] = vPHONE;
    return data;
  }
}
