import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'preferides_model.dart';
export 'preferides_model.dart';

class PreferidesWidget extends StatefulWidget {
  const PreferidesWidget({super.key});

  @override
  State<PreferidesWidget> createState() => _PreferidesWidgetState();
}

class _PreferidesWidgetState extends State<PreferidesWidget> {
  late PreferidesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreferidesModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              'Preferides',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).alternate,
                    fontSize: 20.0,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FutureBuilder<List<FavoritsRow>>(
                      future: FavoritsTable().queryRows(
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
                        List<FavoritsRow> listViewFavoritsRowList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewFavoritsRowList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewFavoritsRow =
                                listViewFavoritsRowList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 8.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x411D2429),
                                      offset: Offset(0.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: FutureBuilder<List<FavoritsRow>>(
                                    future: FavoritsTable().querySingleRow(
                                      queryFn: (q) => q.eq(
                                        'id',
                                        listViewFavoritsRow.id,
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Color(0xFF4BBFDF),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<FavoritsRow> columnFavoritsRowList =
                                          snapshot.data!;
                                      final columnFavoritsRow =
                                          columnFavoritsRowList.isNotEmpty
                                              ? columnFavoritsRowList.first
                                              : null;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child:
                                                FutureBuilder<List<RutesRow>>(
                                              future:
                                                  RutesTable().querySingleRow(
                                                queryFn: (q) => q.eq(
                                                  'id',
                                                  columnFavoritsRow?.fkIdRuta,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          Color(0xFF4BBFDF),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<RutesRow>
                                                    imageRutesRowList =
                                                    snapshot.data!;
                                                final imageRutesRow =
                                                    imageRutesRowList.isNotEmpty
                                                        ? imageRutesRowList
                                                            .first
                                                        : null;
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    imageRutesRow!.foto!,
                                                    width: 300.0,
                                                    height: 200.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: Text(
                                                      'Nom de la ruta:',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FutureBuilder<
                                                          List<RutesRow>>(
                                                        future: RutesTable()
                                                            .querySingleRow(
                                                          queryFn: (q) => q.eq(
                                                            'id',
                                                            columnFavoritsRow
                                                                ?.fkIdRuta,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    Color(
                                                                        0xFF4BBFDF),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<RutesRow>
                                                              textRutesRowList =
                                                              snapshot.data!;
                                                          final textRutesRow =
                                                              textRutesRowList
                                                                      .isNotEmpty
                                                                  ? textRutesRowList
                                                                      .first
                                                                  : null;
                                                          return Text(
                                                            valueOrDefault<
                                                                String>(
                                                              textRutesRow?.nom,
                                                              'nom',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Títol del llibre:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge,
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: FutureBuilder<
                                                      List<RutesRow>>(
                                                    future: RutesTable()
                                                        .querySingleRow(
                                                      queryFn: (q) => q.eq(
                                                        'id',
                                                        columnFavoritsRow
                                                            ?.fkIdRuta,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Color(
                                                                    0xFF4BBFDF),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<RutesRow>
                                                          textRutesRowList =
                                                          snapshot.data!;
                                                      final textRutesRow =
                                                          textRutesRowList
                                                                  .isNotEmpty
                                                              ? textRutesRowList
                                                                  .first
                                                              : null;
                                                      return Text(
                                                        valueOrDefault<String>(
                                                          textRutesRow?.titol,
                                                          'titol',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'Autor/a del llibre: ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge,
                                                ),
                                              ),
                                              FutureBuilder<List<RutesRow>>(
                                                future:
                                                    RutesTable().querySingleRow(
                                                  queryFn: (q) => q.eq(
                                                    'id',
                                                    columnFavoritsRow?.fkIdRuta,
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Color(0xFF4BBFDF),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<RutesRow>
                                                      textRutesRowList =
                                                      snapshot.data!;
                                                  final textRutesRow =
                                                      textRutesRowList
                                                              .isNotEmpty
                                                          ? textRutesRowList
                                                              .first
                                                          : null;
                                                  return Text(
                                                    valueOrDefault<String>(
                                                      textRutesRow?.autor,
                                                      'autor',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    'Ciutat: ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                ),
                                                FutureBuilder<List<RutesRow>>(
                                                  future: RutesTable()
                                                      .querySingleRow(
                                                    queryFn: (q) => q.eq(
                                                      'id',
                                                      columnFavoritsRow
                                                          ?.fkIdRuta,
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              Color(0xFF4BBFDF),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<RutesRow>
                                                        textRutesRowList =
                                                        snapshot.data!;
                                                    final textRutesRow =
                                                        textRutesRowList
                                                                .isNotEmpty
                                                            ? textRutesRowList
                                                                .first
                                                            : null;
                                                    return Text(
                                                      valueOrDefault<String>(
                                                        textRutesRow?.ciutat,
                                                        'ciutat',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                              ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
