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
    Key? key,
    this.shop,
    this.vehicle,
  }) : super(key: key);

  final DocumentReference? shop;
  final DocumentReference? vehicle;

  @override
  _ShopServiceWidgetState createState() => _ShopServiceWidgetState();
}

class _ShopServiceWidgetState extends State<ShopServiceWidget> {
  DateTimeRange? calendarSelectedDay;
  String? choiceChipsValue;
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
      future: ShopsRecord.getDocumentOnce(widget.shop!),
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
        final shopServiceShopsRecord = snapshot.data!;
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
                      color: FlutterFlowTheme.of(context).primaryText,
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
                if (calendarSelectedDay!.end > getCurrentTimestamp) {
                  if (!(choiceChipsValue != null && choiceChipsValue != '')) {
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

                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Confirmar Cita'),
                          content:
                              Text('Desea confirmar su cita en el taller?'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, false),
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, true),
                              child: Text('Confirmar'),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
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
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Cita Agendada'),
                        content: Text(
                            'Su cita en el taller ha sido agendada, aguarde su confirmacion.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
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
                } else {
                  return;
                }
              },
              text: 'Agendar',
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
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x33000000),
                              offset: Offset(0.5, 0.5),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 7),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                shopServiceShopsRecord.name!,
                                style: FlutterFlowTheme.of(context).title1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: FutureBuilder<VehiclesRecord>(
                        future: VehiclesRecord.getDocumentOnce(widget.vehicle!),
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
                          final containerVehiclesRecord = snapshot.data!;
                          return Container(
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.black,
                                  offset: Offset(0.5, 0.5),
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(7, 0, 7, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          color: Colors.black,
                                          offset: Offset(0.5, 0.5),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        containerVehiclesRecord.photo!,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: Container(
                                      width: 220,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            color: Colors.black,
                                            offset: Offset(0.5, 0.5),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 1,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            7, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                containerVehiclesRecord.plate!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1,
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                '${containerVehiclesRecord.make} ${containerVehiclesRecord.model} ${containerVehiclesRecord.year}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 2),
                        child: Text(
                          'Selecciona un servicio',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.black,
                              offset: Offset(0.5, 0.5),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: FlutterFlowChoiceChips(
                                initiallySelected: [
                                  if (choiceChipsValue != null)
                                    choiceChipsValue!
                                ],
                                options: shopServiceShopsRecord.services!
                                    .toList()
                                    .map((label) => ChipData(label))
                                    .toList(),
                                onChanged: (val) => setState(
                                    () => choiceChipsValue = val?.first),
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 2),
                        child: Text(
                          'Selecciona una fecha',
                          style: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Exo 2',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.black,
                              offset: Offset(0.5, 0.5),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 0, 0),
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
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                              FlutterFlowCalendar(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                iconColor: Colors.black,
                                weekFormat: false,
                                weekStartsMonday: true,
                                onChange: (DateTimeRange? newSelectedDate) {
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
