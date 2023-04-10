class AccountModel {
  String? sId;
  int? age;
  String? category;
  String? name;
  String? password;

  AccountModel({this.sId, this.age, this.name, this.password, this.category});

  AccountModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    age = json['age'];
    category = json['age'] > 10 ? "adult" : "kids";
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['age'] = age;
    data['name'] = name;
    data['password'] = password;
    return data;
  }
}
