/// username : "79e2c1f4d9@boxmail.lol"

class LoginRequest {
  LoginRequest({
      this.username,});

  LoginRequest.fromJson(dynamic json) {
    username = json['username'];
  }
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    return map;
  }

}