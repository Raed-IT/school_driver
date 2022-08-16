class StudentsModel {
  String? name;
  String? img;
  String? address;
  String? status;
  String? lat;
  String? long;
  String? section;
  String? department;

  StudentsModel(
      {this.name,
        this.img,
        this.address,
        this.status,
        this.lat,
        this.long,
        this.section,
        this.department});

  StudentsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    address = json['address'];
    status = json['status'];
    lat = json['lat'];
    long = json['long'];
    section = json['section'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['img'] = this.img;
    data['address'] = this.address;
    data['status'] = this.status;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['section'] = this.section;
    data['department'] = this.department;
    return data;
  }
}