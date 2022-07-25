import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopServiceWidget extends StatefulWidget {
  const ShopServiceWidget({
    Key key,
    this.shop,
    this.vehicle,
  }) : super(key: key);

  final DocumentReference shop;
  final DocumentReference vehicle;

  @override
  _ShopServiceWidgetState createState() => _ShopServiceWidgetState();
}

class _ShopServiceWidgetState extends State<ShopServiceWidget> {
  DateTimeRange calendarSelectedDay;
  String choiceChipsValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ShopsRecord>(
      future: ShopsRecord.getDocumentOnce(widget.shop),
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
        final shopServiceShopsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: true,
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(45, 0, 0, 2),
              child: Text(
                'Agenda Tu Cita',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Exo 2',
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      fontSize: 22,
                    ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
            elevation: 8,
            label: FFButtonWidget(
              onPressed: () async {
                if ((calendarSelectedDay.end) > (getCurrentTimestamp)) {
                  if (!((choiceChipsValue != null && choiceChipsValue != ''))) {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Servicio no seleccionado'),
                          content:
                              Text('Seleccione un servicio para continuar'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }
                } else {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Fecha no valida'),
                        content: Text(
                            'Seleccione una fecha posterior a la fecha actual para continuar'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }

                final servicesCreateData = createServicesRecordData(
                  vehicle: widget.vehicle,
                  owner: currentUserReference,
                  service: choiceChipsValue,
                  date: calendarSelectedDay?.end,
                  shop: widget.shop,
                  ownerName: currentUserDisplayName,
                  carName: '',
                  shopName: shopServiceShopsRecord.name,
                );
                await ServicesRecord.collection.doc().set(servicesCreateData);
                await Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 300),
                    reverseDuration: Duration(milliseconds: 300),
                    child: HomePageWidget(),
                  ),
                  (r) => false,
                );
              },
              text: 'Agendar',
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: FlutterFlowTheme.of(context).secondaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Exo 2',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              shopServiceShopsRecord.name,
                              style: FlutterFlowTheme.of(context).title1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: FutureBuilder<VehiclesRecord>(
                        future: VehiclesRecord.getDocumentOnce(widget.vehicle),
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
                          final containerVehiclesRecord = snapshot.data;
                          return Container(
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(7, 0, 7, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      containerVehiclesRecord.photo,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 150,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          containerVehiclesRecord.plate,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                      Container(
                                        width: 150,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          '${containerVehiclesRecord.make} ${containerVehiclesRecord.model} ${containerVehiclesRecord.year}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Text(
                                'Seleccione un servicio',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Exo 2',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                            ),
                            FlutterFlowChoiceChips(
                              initiallySelected: [choiceChipsValue],
                              options:
                                  (shopServiceShopsRecord.services.toList() ??
                                          [])
                                      .map((label) => ChipData(label))
                                      .toList(),
                              onChanged: (val) =>
                                  setState(() => choiceChipsValue = val.first),
                              selectedChipStyle: ChipStyle(
                                backgroundColor: Color(0xFF323B45),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Exo 2',
                                      color: Colors.white,
                                    ),
                                iconColor: Colors.white,
                                iconSize: 18,
                                elevation: 4,
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Exo 2',
                                      color: Color(0xFF323B45),
                                    ),
                                iconColor: Color(0xFF323B45),
                                iconSize: 18,
                                elevation: 4,
                              ),
                              chipSpacing: 20,
                              multiselect: false,
                              alignment: WrapAlignment.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 450,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Text(
                                'Seleccione una fecha',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Exo 2',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 5, 0),
                                    child: Text(
                                      'Fecha actual:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                  Text(
                                    dateTimeFormat(
                                        'd/M/y', getCurrentTimestamp),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            FlutterFlowCalendar(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              weekFormat: false,
                              weekStartsMonday: true,
                              onChange: (DateTimeRange newSelectedDate) {
                                setState(() =>
                                    calendarSelectedDay = newSelectedDate);
                              },
                              titleStyle: TextStyle(),
                              dayOfWeekStyle: TextStyle(),
                              dateStyle: TextStyle(),
                              selectedDateStyle: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Exo 2',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                  ),
                              inactiveDateStyle: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
