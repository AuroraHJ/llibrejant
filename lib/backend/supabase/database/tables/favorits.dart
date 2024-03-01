import '../database.dart';

class FavoritsTable extends SupabaseTable<FavoritsRow> {
  @override
  String get tableName => 'favorits';

  @override
  FavoritsRow createRow(Map<String, dynamic> data) => FavoritsRow(data);
}

class FavoritsRow extends SupabaseDataRow {
  FavoritsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavoritsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get fkIdUsuari => getField<String>('fk_idUsuari');
  set fkIdUsuari(String? value) => setField<String>('fk_idUsuari', value);

  int? get fkIdRuta => getField<int>('fk_idRuta');
  set fkIdRuta(int? value) => setField<int>('fk_idRuta', value);
}
