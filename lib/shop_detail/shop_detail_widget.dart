import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_static_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/lat_lng.dart';
import '../vehicle_list/vehicle_list_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';

class ShopDetailWidget extends StatefulWidget {
  const ShopDetailWidget({
    Key? key,
    this.shopParameter,
  }) : super(key: key);

  final DocumentReference? shopParameter;

  @override
  _ShopDetailWidgetState createState() => _ShopDetailWidgetState();
}

class _ShopDetailWidgetState extends State<ShopDetailWidget> {
  String? choiceChipsValue;
  String? shopMapLink;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ShopsRecord>(
      future: ShopsRecord.getDocumentOnce(widget.shopParameter!),
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
        final shopDetailShopsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
            automaticallyImplyLeading: true,
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(85, 0, 0, 0),
              child: Text(
                shopDetailShopsRecord.name!,
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Exo 2',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
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
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 300),
                    reverseDuration: Duration(milliseconds: 300),
                    child: VehicleListWidget(
                      shop: shopDetailShopsRecord.reference,
                    ),
                  ),
                );
              },
              text: 'Agendar',
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: FlutterFlowTheme.of(context).secondaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Exo 2',
                      color: Colors.white,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              color: FlutterFlowTheme.of(context).customColor4,
                              offset: Offset(0.5, 0.5),
                            )
                          ],
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).white,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 3,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
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
                                              .white,
                                          width: 1,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          shopDetailShopsRecord.banner!,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.9, 0.9),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              offset: Offset(0.5, 0.5),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            width: 2,
                                          ),
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            shopDetailShopsRecord.logo!,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 12, 16, 7),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Color(0x806F6B6B),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      offset: Offset(0.5, 0.5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).white,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: Text(
                                    shopDetailShopsRecord.description!,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                          child: FlutterFlowChoiceChips(
                            initiallySelected: [
                              if (choiceChipsValue != null) choiceChipsValue!
                            ],
                            options: shopDetailShopsRecord.services!
                                .toList()
                                .map((label) => ChipData(label))
                                .toList(),
                            onChanged: (val) =>
                                setState(() => choiceChipsValue = val?.first),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).grayIcon,
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
                              backgroundColor:
                                  FlutterFlowTheme.of(context).grayIcon,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Exo 2',
                                    color: Colors.white,
                                  ),
                              iconColor: Colors.white,
                              iconSize: 18,
                              elevation: 4,
                            ),
                            chipSpacing: 20,
                            multiselect: false,
                            alignment: WrapAlignment.start,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Text(
                        'Direccion',
                        style: FlutterFlowTheme.of(context).subtitle1.override(
                              fontFamily: 'Exo 2',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 430,
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
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                              child: Container(
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
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    shopMapLink = await actions.createURL(
                                      'https://www.google.com/maps/place/',
                                      shopDetailShopsRecord.address,
                                    );
                                    await launchURL(shopMapLink!);

                                    setState(() {});
                                  },
                                  child: FlutterFlowStaticMap(
                                    location: shopDetailShopsRecord.address!,
                                    apiKey:
                                        'pk.eyJ1IjoicmNyZXNwbzgwOCIsImEiOiJjbDFxbGcxNGwxcGNrM2JzOTN0bGQ1a2c5In0.2-W0Fg9tbLMN5axs6MsTMA',
                                    style: MapBoxStyle.Streets,
                                    width: 300,
                                    height: 300,
                                    fit: BoxFit.cover,
                                    borderRadius: BorderRadius.circular(15),
                                    markerColor: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    zoom: 14,
                                    tilt: 0,
                                    rotation: 0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).grayIcon,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 12),
                                  child: AutoSizeText(
                                    shopDetailShopsRecord.addressText!,
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
                                          fontFamily: 'Exo 2',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                ),
                              ),
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
