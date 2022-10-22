class DriverModel {
  int? id;
  String? phone;
  String? name;
  String? img;
  String? logo;
  String? schoolName;
  DriverModel(
      {required this.id,
      required this.phone,
      required this.name,
      required this.img,this.logo,this.schoolName});

  DriverModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    name = json['name'];
    img = json['img'];
    logo= json['logo'];
    schoolName= json['school_name'];
  }

}
