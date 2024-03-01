import '../database.dart';

class PuntsInteresTable extends SupabaseTable<PuntsInteresRow> {
  @override
  String get tableName => 'punts_interes';

  @override
  PuntsInteresRow createRow(Map<String, dynamic> data) => PuntsInteresRow(data);
}

class PuntsInteresRow extends SupabaseDataRow {
  PuntsInteresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PuntsInteresTable();

  String? get nomPunt => getField<String>('nom_punt');
  set nomPunt(String? value) => setField<String>('nom_punt', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  String? get audio => getField<String>('audio');
  set audio(String? value) => setField<String>('audio', value);

  int? get fkIdRuta => getField<int>('fk_idRuta');
  set fkIdRuta(int? value) => setField<int>('fk_idRuta', value);

  double? get latitud => getField<double>(' latitud');
  set latitud(double? value) => setField<double>(' latitud', value);

  double? get longitud => getField<double>('longitud');
  set longitud(double? value) => setField<double>('longitud', value);

  int get idPunt => getField<int>('idPunt')!;
  set idPunt(int value) => setField<int>('idPunt', value);

  String? get video => getField<String>('video');
  set video(String? value) => setField<String>('video', value);
}
