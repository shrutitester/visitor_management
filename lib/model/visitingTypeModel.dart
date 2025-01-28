class VisitingTypeModel {
  bool? status;
  String? message;
  List<VType>? vType;

  VisitingTypeModel({this.status, this.message, this.vType});

  VisitingTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['VType'] != null) {
      vType = <VType>[];
      json['VType'].forEach((v) {
        vType!.add(VType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (vType != null) {
      data['VType'] = vType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VType {
  String? vTID;
  String? vTNAME;

  VType({this.vTID, this.vTNAME});

  VType.fromJson(Map<String, dynamic> json) {
    vTID = json['VTID'];
    vTNAME = json['VTNAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['VTID'] = vTID;
    data['VTNAME'] = vTNAME;
    return data;
  }
}
