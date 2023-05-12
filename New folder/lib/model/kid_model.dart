class KidsModel {
  String? sId;
  String? category;
  int? age;
  String? name;
  String? userID;

  KidsModel({this.sId, this.age, this.name, this.userID, this.category});

  KidsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    age = json['age'];
    name = json['name'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['age'] = age;
    data['category'] = category;
    data['name'] = name;
    data['userID'] = userID;
    return data;
  }
}
