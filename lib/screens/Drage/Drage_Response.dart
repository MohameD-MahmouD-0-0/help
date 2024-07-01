/// DrugName : "BTR"
/// DrugID : 5
/// purpose_of_use : "LLL"
/// Description : "LLLLL"
/// Duration_of_use : "2024-07-30T01:00:00Z"
/// number_of_times_day : 1
/// type : "SUGER"
/// expire_date : "2024-07-31"
/// Pillsnum : 2

class DrageResponse {
  DrageResponse({
      this.drugName, 
      this.drugID, 
      this.purposeOfUse, 
      this.description, 
      this.durationOfUse, 
      this.numberOfTimesDay, 
      this.type, 
      this.expireDate, 
      this.pillsnum,});

  DrageResponse.fromJson(dynamic json) {
    drugName = json['DrugName'];
    drugID = json['DrugID'];
    purposeOfUse = json['purpose_of_use'];
    description = json['Description'];
    durationOfUse = json['Duration_of_use'];
    numberOfTimesDay = json['number_of_times_day'];
    type = json['type'];
    expireDate = json['expire_date'];
    pillsnum = json['Pillsnum'];
  }
  String? drugName;
  int? drugID;
  String? purposeOfUse;
  String? description;
  String? durationOfUse;
  int? numberOfTimesDay;
  String? type;
  String? expireDate;
  int? pillsnum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['DrugName'] = drugName;
    map['DrugID'] = drugID;
    map['purpose_of_use'] = purposeOfUse;
    map['Description'] = description;
    map['Duration_of_use'] = durationOfUse;
    map['number_of_times_day'] = numberOfTimesDay;
    map['type'] = type;
    map['expire_date'] = expireDate;
    map['Pillsnum'] = pillsnum;
    return map;
  }

}