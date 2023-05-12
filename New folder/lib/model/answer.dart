class AnswerModel {
  String? url;
  String? name;
  String? path;
  bool? isAnswer;

  AnswerModel({this.url, this.name, this.path, this.isAnswer});

  AnswerModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    path = json['path'];
    isAnswer = json['isAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['name'] = name;
    data['path'] = path;
    data['isAnswer'] = isAnswer;
    return data;
  }
}
