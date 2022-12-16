class Course {
  int? id;
  String? durasi;
  String? img;
  int? modul;
  String? nama;
  String? level;
  String? url;

  Course(
      {this.id,
      this.durasi,
      this.img,
      this.modul,
      this.nama,
      this.level,
      this.url});

  Course.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    durasi = json["durasi"];
    img = json["img"];
    modul = json["modul"];
    nama = json["nama"];
    level = json["level"];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
