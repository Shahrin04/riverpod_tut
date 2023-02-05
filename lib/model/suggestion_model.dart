class SuggestionModel {
  String? activity;
  String? type;
  double? participants;
  double? price;
  String? link;
  String? key;
  double? accessibility;

  SuggestionModel(
      {this.activity,
        this.type,
        this.participants,
        this.price,
        this.link,
        this.key,
        this.accessibility});

  SuggestionModel.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    type = json['type'];
    participants = json['participants'] == null ? null : double.parse(json['participants'].toString());
    price = json['price'] == null ? null : double.parse(json['price'].toString());
    link = json['link'];
    key = json['key'];
    accessibility = json['accessibility'] == null ? null : double.parse(json['accessibility'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity'] = activity;
    data['type'] = type;
    data['participants'] = participants;
    data['price'] = price;
    data['link'] = link;
    data['key'] = key;
    data['accessibility'] = accessibility;
    return data;
  }
}