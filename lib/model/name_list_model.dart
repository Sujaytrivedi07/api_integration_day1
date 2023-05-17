class Namelist {
  String? name;
  String? city;

  Namelist({this.name, this.city});

  Namelist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['city'] = this.city;
    return data;
  }
}
