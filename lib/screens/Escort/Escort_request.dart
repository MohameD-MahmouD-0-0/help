/// FirstName : "sonn"
/// LasttName : "bbbb"
/// EscortID : 3
/// Email : "ss2VV"
/// PhoneNumber : "111"
/// yourHandel : "AA"
/// Male : false
/// Female : true
/// LastModified : "2024-06-30T21:56:52.772586Z"

class EscortRequest {
  EscortRequest({
      this.firstName, 
      this.lasttName, 
      this.escortID, 
      this.email, 
      this.phoneNumber, 
      this.yourHandel, 
      this.male, 
      this.female, 
      this.lastModified,});

  EscortRequest.fromJson(dynamic json) {
    firstName = json['FirstName'];
    lasttName = json['LasttName'];
    escortID = json['EscortID'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    yourHandel = json['yourHandel'];
    male = json['Male'];
    female = json['Female'];
    lastModified = json['LastModified'];
  }
  String? firstName;
  String? lasttName;
  int? escortID;
  String? email;
  String? phoneNumber;
  String? yourHandel;
  bool? male;
  bool? female;
  String? lastModified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FirstName'] = firstName;
    map['LasttName'] = lasttName;
    map['EscortID'] = escortID;
    map['Email'] = email;
    map['PhoneNumber'] = phoneNumber;
    map['yourHandel'] = yourHandel;
    map['Male'] = male;
    map['Female'] = female;
    map['LastModified'] = lastModified;
    return map;
  }

}