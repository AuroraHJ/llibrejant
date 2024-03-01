import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';
import 'detalls_rutes_model.dart';
export 'detalls_rutes_model.dart';

class DetallsRutesWidget extends StatefulWidget {
  const DetallsRutesWidget({
    super.key,
    this.nomRuta,
    required this.id,
  });

  final String? nomRuta;
  final int? id;

  @override
  State<DetallsRutesWidget> createState() => _DetallsRutesWidgetState();
}

class _DetallsRutesWidgetState extends State<DetallsRutesWidget> {
  late DetallsRutesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetallsRutesModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
          child: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            buttonSize: 48.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).alternate,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
        ),
        title: Text(
          'Detalls ruta',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).alternate,
                fontSize: 20.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: FutureBuilder<List<RutesRow>>(
          future: RutesTable().querySingleRow(
            queryFn: (q) => q.eq(
              'nom',
              widget.nomRuta,
            ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF4BBFDF),
                    ),
                  ),
                ),
              );
            }
            List<RutesRow> columnRutesRowList = snapshot.data!;
            final columnRutesRow =
                columnRutesRowList.isNotEmpty ? columnRutesRowList.first : null;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.nomRuta,
                              'NomRuta',
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: FutureBuilder<List<RutesRow>>(
                            future: RutesTable().queryRows(
                              queryFn: (q) => q.eq(
                                'nom',
                                widget.nomRuta,
                              ),
                              limit: 1,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xFF4BBFDF),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<RutesRow> imageRutesRowList = snapshot.data!;
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    columnRutesRow?.foto,
                                    'https://www.tea-tron.com/antorodriguez/blog/wp-content/uploads/2016/04/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png',
                                  ),
                                  width: 150.0,
                                  height: 150.0,
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 25.0, 0.0, 0.0),
                            child: Text(
                              'Informació del llibre:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Títol: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                            FutureBuilder<List<RutesRow>>(
                              future: RutesTable().queryRows(
                                queryFn: (q) => q.eq(
                                  'nom',
                                  widget.nomRuta,
                                ),
                                limit: 1,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xFF4BBFDF),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<RutesRow> textRutesRowList =
                                    snapshot.data!;
                                return Text(
                                  valueOrDefault<String>(
                                    columnRutesRow?.titol,
                                    'Error amb  el titol',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        fontSize: 16.0,
                                      ),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Autor: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                            FutureBuilder<List<RutesRow>>(
                              future: RutesTable().queryRows(
                                queryFn: (q) => q.eq(
                                  'nom',
                                  widget.nomRuta,
                                ),
                                limit: 1,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xFF4BBFDF),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<RutesRow> textRutesRowList =
                                    snapshot.data!;
                                return Text(
                                  valueOrDefault<String>(
                                    columnRutesRow?.autor,
                                    'Error amb el autor',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        fontSize: 16.0,
                                      ),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Descripció: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                            FutureBuilder<List<RutesRow>>(
                              future: RutesTable().queryRows(
                                queryFn: (q) => q.eq(
                                  'nom',
                                  widget.nomRuta,
                                ),
                                limit: 1,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xFF4BBFDF),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<RutesRow> textRutesRowList =
                                    snapshot.data!;
                                return Text(
                                  valueOrDefault<String>(
                                    columnRutesRow?.descripcio,
                                    'Error amb la descripció',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        fontSize: 16.0,
                                      ),
                                );
                              },
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 0.0, 0.0),
                            child: Text(
                              'Punts de la ruta',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        FlutterFlowStaticMap(
                          location: LatLng(9.341465, -79.891704),
                          apiKey: 'ENTER_YOUR_MAPBOX_API_KEY_HERE',
                          style: MapBoxStyle.Light,
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          zoom: 12,
                          tilt: 0,
                          rotation: 0,
                        ),
                        FutureBuilder<List<PuntsInteresRow>>(
                          future: PuntsInteresTable().queryRows(
                            queryFn: (q) => q.eq(
                              'fk_idRuta',
                              widget.id,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFF4BBFDF),
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<PuntsInteresRow> listViewPuntsInteresRowList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewPuntsInteresRowList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewPuntsInteresRow =
                                    listViewPuntsInteresRowList[listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                listViewPuntsInteresRow.nomPunt,
                                                'nomPunt',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 20.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              'https://picsum.photos/seed/557/600',
                                              width: 150.0,
                                              height: 150.0,
                                              fit: BoxFit.cover,
                                              alignment: Alignment(-1.0, 0.0),
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                                alignment: Alignment(-1.0, 0.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: FlutterFlowVideoPlayer(
                                            path:
                                                'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                                            videoType: VideoType.network,
                                            width: 150.0,
                                            height: 150.0,
                                            autoPlay: false,
                                            looping: true,
                                            showControls: true,
                                            allowFullScreen: true,
                                            allowPlaybackSpeedMenu: false,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: FlutterFlowAudioPlayer(
                                            audio: Audio.network(
                                              'https://filesamples.com/samples/audio/mp3/sample3.mp3',
                                              metas: Metas(
                                                id: 'sample3.mp3-f12cd1a8',
                                                title: 'Fragment',
                                              ),
                                            ),
                                            titleTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 18.0,
                                                    ),
                                            playbackDurationTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            playbackButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            elevation: 4.0,
                                            playInBackground: PlayInBackground
                                                .disabledRestoreOnForeground,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        FutureBuilder<List<RutesRow>>(
                          future: RutesTable().querySingleRow(
                            queryFn: (q) => q,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFF4BBFDF),
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<RutesRow> textRutesRowList = snapshot.data!;
                            final textRutesRow = textRutesRowList.isNotEmpty
                                ? textRutesRowList.first
                                : null;
                            return Text(
                              valueOrDefault<String>(
                                textRutesRow?.nom,
                                'Error amb el nom de la ruta',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 20.0,
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
