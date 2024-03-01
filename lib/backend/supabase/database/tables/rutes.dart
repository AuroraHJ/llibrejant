import '../database.dart';

class RutesTable extends SupabaseTable<RutesRow> {
  @override
  String get tableName => 'rutes';

  @override
  RutesRow createRow(Map<String, dynamic> data) => RutesRow(data);
}

class RutesRow extends SupabaseDataRow {
  RutesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RutesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get nom => getField<String>('nom');
  set nom(String? value) => setField<String>('nom', value);

  String? get ciutat => getField<String>('ciutat');
  set ciutat(String? value) => setField<String>('ciutat', value);

  String? get fkIdUsuari => getField<String>('fk_idUsuari');
  set fkIdUsuari(String? value) => setField<String>('fk_idUsuari', value);

  int? get fkIdLlibre => getField<int>('fk_idLlibre');
  set fkIdLlibre(int? value) => setField<int>('fk_idLlibre', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  String? get titol => getField<String>('titol');
  set titol(String? value) => setField<String>('titol', value);

  String? get autor => getField<String>('autor');
  set autor(String? value) => setField<String>('autor', value);

  String? get descripcio => getField<String>('descripcio');
  set descripcio(String? value) => setField<String>('descripcio', value);
}
