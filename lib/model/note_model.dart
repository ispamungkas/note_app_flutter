class NoteModel {
  int? id;
  Categories? kategori ;
  String? judul;
  String? deskripsi;
  DateTime? tanggal;
}

enum Categories{
  QuickNote,
  Todo,
  Journal
}