import '../database.dart';

class UsuarisTable extends SupabaseTable<UsuarisRow> {
  @override
  String get tableName => 'Usuaris';

  @override
  UsuarisRow createRow(Map<String, dynamic> data) => UsuarisRow(data);
}

class UsuarisRow extends SupabaseDataRow {
  UsuarisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuarisTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get nom => getField<String>('nom');
  set nom(String? value) => setField<String>('nom', value);

  String? get cognom => getField<String>('cognom');
  set cognom(String? value) => setField<String>('cognom', value);

  String? get urlFoto => getField<String>('url_foto');
  set urlFoto(String? value) => setField<String>('url_foto', value);

  String? get contrasenya => getField<String>('contrasenya');
  set contrasenya(String? value) => setField<String>('contrasenya', value);
}
