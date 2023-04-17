class AccountModel {
  String? sId;
  String? type;
  String? email;
  String? name;
  String? password;

  AccountModel({this.sId, this.email, this.name, this.password, this.type});

  AccountModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['type'] = type;
    data['name'] = name;
    data['password'] = password;
    return data;
  }
}
