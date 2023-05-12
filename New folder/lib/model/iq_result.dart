class IQResult {
  String? sId;
  String? accountId;
  double? iq;
  int? logicCount;
  int? mathCount;
  int? correctCount;
  int? questionsCount;
  double? mentalAge;

  IQResult({this.sId, this.accountId, this.iq, this.mentalAge, this.logicCount, this.mathCount, this.correctCount, this.questionsCount});

  IQResult.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    accountId = json['accountId'];
    iq = double.tryParse(json['iq'].toString());
    logicCount = json['logicCount'];
    mathCount = json['mathCount'];
    mentalAge = double.tryParse(json['mentalAge'].toString());
    correctCount = json['correctCount'];
    questionsCount = json['questionsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['accountId'] = accountId;
    data['iq'] = iq;
    data['logicCount'] = logicCount;
    data['mathCount'] = mathCount;
    data['correctCount'] = correctCount;
    data['questionsCount'] = questionsCount;
    data['mentalAge'] = mentalAge;
    return data;
  }
}
