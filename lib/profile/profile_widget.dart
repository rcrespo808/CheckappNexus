import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_vehicle/create_vehicle_widget.dart';
import '../edit_profile/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../shop_list/shop_list_widget.dart';
import '../user_settings/user_settings_widget.dart';
import '../vehicle_detail/vehicle_detail_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 450,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 76),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 450,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 76),
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
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      if ((valueOrDefault(currentUserDocument?.vehicleCount, 0)) == 0) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('No tiene vehiculos Registrados'),
              content: Text('Por favor registre un vehiculo para continuar'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        await Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300),
            child: CreateVehicleWidget(),
          ),
        );
      } else {
        return;
      }
    });

    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
          child: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.home,
              color: FlutterFlowTheme.of(context).secondaryColor,
              size: 30,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 300),
                  reverseDuration: Duration(milliseconds: 300),
                  child: HomePageWidget(),
                ),
              );
            },
          ),
        ),
        title: Text(
          'Mi Perfil',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Exo 2',
                color: FlutterFlowTheme.of(context).secondaryColor,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 300),
                    reverseDuration: Duration(milliseconds: 300),
                    child: UserSettingsWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.settings_outlined,
                color: FlutterFlowTheme.of(context).secondaryColor,
                size: 40,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        label: Container(
          width: 160,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: FFButtonWidget(
            onPressed: () async {
              await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 300),
                  reverseDuration: Duration(milliseconds: 300),
                  child: ShopListWidget(),
                ),
              );
            },
            text: 'Agenda una cita',
            options: FFButtonOptions(
              width: 130,
              height: 40,
              color: FlutterFlowTheme.of(context).secondaryColor,
              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Exo 2',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(188),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x230F1113),
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).lineColor,
                                borderRadius: BorderRadius.circular(15),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  width: 5,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                child: AuthUserStreamWidget(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      currentUserPhoto,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(30, 0, 0, 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AuthUserStreamWidget(
                                    child: Text(
                                      currentUserDisplayName,
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Text(
                                          dateTimeFormat(
                                              'd/M/y', getCurrentTimestamp),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
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
                                            8, 8, 0, 0),
                                        child: Text(
                                          dateTimeFormat(
                                              'Hm', getCurrentTimestamp),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Exo 2',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.55, -1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 50),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: FaIcon(
                              FontAwesomeIcons.edit,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 30,
                            ),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: EditProfileWidget(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 200,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Vehiculos',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                    ),
                                    if ((valueOrDefault(
                                            currentUserDocument?.vehicleCount,
                                            0)) <
                                        3)
                                      AuthUserStreamWidget(
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 0,
                                          buttonSize: 40,
                                          fillColor: Color(0xFFFF5722),
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                          onPressed: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 300),
                                                reverseDuration:
                                                    Duration(milliseconds: 300),
                                                child: CreateVehicleWidget(),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: StreamBuilder<List<VehiclesRecord>>(
                                  stream: queryVehiclesRecord(
                                    queryBuilder: (vehiclesRecord) =>
                                        vehiclesRecord.where('userId',
                                            isEqualTo: currentUserReference),
                                    limit: 3,
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
                                    List<VehiclesRecord>
                                        listViewVehiclesRecordList =
                                        snapshot.data;
                                    return RefreshIndicator(
                                      onRefresh: () async {
                                        final usersUpdateData =
                                            createUsersRecordData(
                                          vehicleCount:
                                              listViewVehiclesRecordList.length,
                                        );
                                        await currentUserReference
                                            .update(usersUpdateData);
                                      },
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewVehiclesRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewVehiclesRecord =
                                              listViewVehiclesRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 16, 12),
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
                                                    child: VehicleDetailWidget(
                                                      vehicle:
                                                          listViewVehiclesRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 120,
                                                decoration: BoxDecoration(
                                                  color: Color(0x4E1D2429),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x230F1113),
                                                      offset: Offset(0, 1),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 8, 8),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image.network(
                                                          listViewVehiclesRecord
                                                              .photo,
                                                          width: 90,
                                                          height: 100,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              listViewVehiclesRecord
                                                                  .plate,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title1,
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                '${listViewVehiclesRecord.make} ${listViewVehiclesRecord.model} ${listViewVehiclesRecord.year}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
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
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 200,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: StreamBuilder<List<ServicesRecord>>(
                            stream: queryServicesRecord(
                              queryBuilder: (servicesRecord) => servicesRecord
                                  .where('owner',
                                      isEqualTo: currentUserReference)
                                  .where('date',
                                      isLessThan: getCurrentTimestamp),
                              limit: 3,
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
                              List<ServicesRecord> listViewServicesRecordList =
                                  snapshot.data;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewServicesRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewServicesRecord =
                                      listViewServicesRecordList[listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 12),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x33000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 2, 2, 2),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 12, 16, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            listViewServicesRecord
                                                                .service,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle1
                                                                .override(
                                                                  fontFamily:
                                                                      'Exo 2',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 120,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'd/M/y',
                                                            listViewServicesRecord
                                                                .date),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 4, 16, 12),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      listViewServicesRecord
                                                          .shopName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ).animated([
                                      animationsMap[
                                          'containerOnPageLoadAnimation1']
                                    ]),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Historial Reciente',
                                  style: FlutterFlowTheme.of(context).subtitle2,
                                ),
                              ],
                            ),
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
    );
  }
}
