import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../modify_vehicle/modify_vehicle_widget.dart';
import '../profile/profile_widget.dart';
import '../shop_service/shop_service_widget.dart';
import '../shop_service_detail/shop_service_detail_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleDetailWidget extends StatefulWidget {
  const VehicleDetailWidget({
    Key key,
    this.vehicle,
  }) : super(key: key);

  final DocumentReference vehicle;

  @override
  _VehicleDetailWidgetState createState() => _VehicleDetailWidgetState();
}

class _VehicleDetailWidgetState extends State<VehicleDetailWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      curve: Curves.easeOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(79, 0),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<VehiclesRecord>(
      stream: VehiclesRecord.getDocument(widget.vehicle),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: Color(0xFFF74D1E),
              ),
            ),
          );
        }
        final vehicleDetailVehiclesRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
            automaticallyImplyLeading: true,
            title: Text(
              'Detalles',
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Exo 2',
                    color: FlutterFlowTheme.of(context).secondaryColor,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: Text(
                              '${vehicleDetailVehiclesRecord.plate} ${vehicleDetailVehiclesRecord.make} ${vehicleDetailVehiclesRecord.model} ${vehicleDetailVehiclesRecord.year}',
                              style: FlutterFlowTheme.of(context).title1,
                            ),
                          ),
                        ),
                        if (!(vehicleDetailVehiclesRecord.isVerified) ?? true)
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.edit,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 15,
                            ),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: ModifyVehicleWidget(
                                    vehicle: widget.vehicle,
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            vehicleDetailVehiclesRecord.photo,
                            width: MediaQuery.of(context).size.width,
                            height: 240,
                            fit: BoxFit.cover,
                          ),
                        ).animated([animationsMap['imageOnPageLoadAnimation']]),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Text(
                                'Creado en:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Exo 2',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                            ),
                            Text(
                              dateTimeFormat('d/M/y',
                                  vehicleDetailVehiclesRecord.createdDate),
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Exo 2',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                            ),
                          ],
                        ),
                        if (!(vehicleDetailVehiclesRecord.isVerified) ?? true)
                          InkWell(
                            onLongPress: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Eliminar Vehiculo'),
                                            content: Text(
                                                'Eliminar un vehiculo es una accion permanente y no se puede revertir\nDesea continuar?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancelar'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirmar'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                await vehicleDetailVehiclesRecord.reference
                                    .delete();

                                final usersUpdateData = {
                                  'vehicleCount': FieldValue.increment(-(1)),
                                };
                                await currentUserReference
                                    .update(usersUpdateData);
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: ProfileWidget(),
                                  ),
                                );
                              } else {
                                return;
                              }
                            },
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Eliminar',
                              icon: FaIcon(
                                FontAwesomeIcons.trashAlt,
                              ),
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).customColor3,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Exo 2',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: Container(
                      width: 500,
                      height: 7,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).black600,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: StreamBuilder<List<ServicesRecord>>(
                      stream: queryServicesRecord(
                        queryBuilder: (servicesRecord) => servicesRecord.where(
                            'vehicle',
                            isEqualTo: vehicleDetailVehiclesRecord.reference),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color: Color(0xFFF74D1E),
                              ),
                            ),
                          );
                        }
                        List<ServicesRecord> containerServicesRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final containerServicesRecord =
                            containerServicesRecordList.isNotEmpty
                                ? containerServicesRecordList.first
                                : null;
                        return Container(
                          width: 500,
                          height: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: FutureBuilder<List<ServicesRecord>>(
                            future: queryServicesRecordOnce(
                              queryBuilder: (servicesRecord) => servicesRecord
                                  .where('vehicle', isEqualTo: widget.vehicle)
                                  .where('date',
                                      isLessThan: getCurrentTimestamp)
                                  .orderBy('date', descending: true),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: Color(0xFFF74D1E),
                                    ),
                                  ),
                                );
                              }
                              List<ServicesRecord> columnServicesRecordList =
                                  snapshot.data;
                              // Return an empty Container when the document does not exist.
                              if (snapshot.data.isEmpty) {
                                return Container();
                              }
                              final columnServicesRecord =
                                  columnServicesRecordList.isNotEmpty
                                      ? columnServicesRecordList.first
                                      : null;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: Text(
                                          'Ultimo Servicio:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Exo 2',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat('d/M/y',
                                                columnServicesRecord.date),
                                            '-',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .title1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x43000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              reverseDuration:
                                                  Duration(milliseconds: 300),
                                              child: ShopServiceDetailWidget(
                                                service: columnServicesRecord
                                                    .reference,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/Iconos_checkapp__(15).png',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 16, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 16, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            columnServicesRecord
                                                                .service,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            columnServicesRecord
                                                                .shopName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Exo 2',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 8),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    reverseDuration: Duration(
                                                        milliseconds: 300),
                                                    child: ShopServiceWidget(
                                                      shop: columnServicesRecord
                                                          .shop,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x37000000),
                                                      offset: Offset(0, 1),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        reverseDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    300),
                                                        child:
                                                            ShopServiceWidget(
                                                          shop:
                                                              columnServicesRecord
                                                                  .shop,
                                                          vehicle:
                                                              vehicleDetailVehiclesRecord
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 16,
                                                                    0, 0),
                                                        child: Icon(
                                                          Icons.bolt,
                                                          color: Colors.white,
                                                          size: 44,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 8, 0, 0),
                                                        child: AutoSizeText(
                                                          'Servicio Rapido',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Exo 2',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      4, 8, 0),
                                                          child: Text(
                                                            'Agendar con el ultimo taller visitado',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Lexend Deca',
                                                              color: Color(
                                                                  0xB3FFFFFF),
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
