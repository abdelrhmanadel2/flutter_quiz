class IQResult {
  String? sId;
  String? accountId;
  double? iq;
  int? logicAnswered;
  int? mathAnswered;
  int? logicCount;
  int? mathCount;
  int? correctCount;
  late int questionsCount;
  double? mentalAge;

  IQResult(
      {this.sId,
      this.accountId,
      this.iq,
      this.mentalAge,
      this.logicAnswered,
      this.mathAnswered,
      this.logicCount,
      this.mathCount,
      this.correctCount,
      required this.questionsCount});

  IQResult.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    accountId = json['accountId'];
    iq = double.tryParse(json['iq'].toString());
    logicAnswered = json['logicAnswered'];
    mathAnswered = json['mathAnswered'];
    logicCount = json['logicCount'];
    mathCount = json['mathCount'];
    mentalAge = double.tryParse(json['mentalAge'].toString());
    correctCount = json['correctCount'];
    questionsCount = json['questionsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sId != null) data['_id'] = sId;
    data['accountId'] = accountId;
    data['iq'] = iq;
    data['logicAnswered'] = logicAnswered;
    data['mathAnswered'] = mathAnswered;
    data['logicCount'] = logicCount;
    data['mathCount'] = mathCount;
    data['correctCount'] = correctCount;
    data['questionsCount'] = questionsCount;
    data['mentalAge'] = mentalAge;
    return data;
  }
}
