class ChartAnalytics {
  String? message;
  bool? status;
  List<LstAnalytics>? lstAnalytics;

  ChartAnalytics({this.message, this.status, this.lstAnalytics});

  ChartAnalytics.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['lstAnalytic'] != null) {
      lstAnalytics = <LstAnalytics>[];
      json['lstAnalytic'].forEach((v) {
        lstAnalytics!.add(new LstAnalytics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.lstAnalytics != null) {
      data['lstAnalytic'] = this.lstAnalytics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LstAnalytics {
  String? vDATETIME;
  String? vDAY;
  String? vMONTH;
  String? vCOUNT;

  LstAnalytics({this.vDATETIME, this.vDAY, this.vMONTH, this.vCOUNT});

  LstAnalytics.fromJson(Map<String, dynamic> json) {
    vDATETIME = json['VDATETIME'];
    vDAY = json['VDAY'];
    vMONTH = json['VMONTH'];
    vCOUNT = json['VCOUNT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VDATETIME'] = this.vDATETIME;
    data['VDAY'] = this.vDAY;
    data['VMONTH'] = this.vMONTH;
    data['VCOUNT'] = this.vCOUNT;
    return data;
  }
}