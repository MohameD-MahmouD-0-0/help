/// FirstName : "Abeer"
/// LasttName : "Hassan"
/// patientID : 2
/// EscortID : null
/// DiseaseID : null
/// Email : "abeerhassan8@gmail.com"
/// PhoneNumber : "01019742210"
/// Handel : "Abeer"
/// Male : false
/// Female : true

class PaitentRequest {
  PaitentRequest({
      this.firstName, 
      this.lasttName, 
      this.patientID, 
      this.escortID, 
      this.diseaseID, 
      this.email, 
      this.phoneNumber, 
      this.handel, 
      this.male, 
      this.female,});

  PaitentRequest.fromJson(dynamic json) {
    firstName = json['FirstName'];
    lasttName = json['LasttName'];
    patientID = json['patientID'];
    escortID = json['EscortID'];
    diseaseID = json['DiseaseID'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    handel = json['Handel'];
    male = json['Male'];
    female = json['Female'];
  }
  String? firstName;
  String? lasttName;
  int? patientID;
  dynamic escortID;
  dynamic diseaseID;
  String? email;
  String? phoneNumber;
  String? handel;
  bool? male;
  bool? female;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FirstName'] = firstName;
    map['LasttName'] = lasttName;
    map['patientID'] = patientID;
    map['EscortID'] = escortID;
    map['DiseaseID'] = diseaseID;
    map['Email'] = email;
    map['PhoneNumber'] = phoneNumber;
    map['Handel'] = handel;
    map['Male'] = male;
    map['Female'] = female;
    return map;
  }

}