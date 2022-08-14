class DriverModel {
  int? id;
  String? phone;
  String? name;
  String? img;

  DriverModel({this.id, this.phone, this.name, this.img});

  DriverModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['img'] = this.img;
    return data;
  }
}
