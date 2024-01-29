class NoteModel {
  int? id;
  String? kategori ;
  String? judul;
  String? deskripsi;
  DateTime? tanggal;

  NoteModel.second();
  NoteModel(this.id, this.kategori, this.judul, this.deskripsi, this.tanggal);

  fromJson(Map<String,dynamic> json) {
    return NoteModel(json['id'], json['kategori'], json['judul'], json['deskripsi'], json['date']);
  }

  Map<String,dynamic> toJson() {
    return {
      "id" : id,
      "kategori" : kategori,
      "judul" : judul,
      "deskripsi" : deskripsi,
      "date" : tanggal
    };
  }
}