class GetAnalyticsModel {
  String? message;
  bool? status;
  List<LstAnalytic>? lstAnalytic;

  GetAnalyticsModel({this.message, this.status, this.lstAnalytic});

  GetAnalyticsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['lstAnalytic'] != null) {
      lstAnalytic = <LstAnalytic>[];
      json['lstAnalytic'].forEach((v) {
        lstAnalytic!.add(LstAnalytic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (lstAnalytic != null) {
      data['lstAnalytic'] = lstAnalytic!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LstAnalytic {
  String? vSTATUS;
  String? vCOUNT;

  LstAnalytic({this.vSTATUS, this.vCOUNT});

  LstAnalytic.fromJson(Map<String, dynamic> json) {
    vSTATUS = json['VSTATUS'];
    vCOUNT = json['VCOUNT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['VSTATUS'] = vSTATUS;
    data['VCOUNT'] = vCOUNT;
    return data;
  }
}
