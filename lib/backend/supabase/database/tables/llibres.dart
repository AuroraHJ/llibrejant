import '../database.dart';

class LlibresTable extends SupabaseTable<LlibresRow> {
  @override
  String get tableName => 'llibres';

  @override
  LlibresRow createRow(Map<String, dynamic> data) => LlibresRow(data);
}

class LlibresRow extends SupabaseDataRow {
  LlibresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LlibresTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get titol => getField<String>('titol');
  set titol(String? value) => setField<String>('titol', value);

  String? get autor => getField<String>('autor');
  set autor(String? value) => setField<String>('autor', value);

  String? get descripcio => getField<String>('descripcio');
  set descripcio(String? value) => setField<String>('descripcio', value);
}
