import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassWidget extends StatefulWidget {
  const ForgotPassWidget({Key key}) : super(key: key);

  @override
  _ForgotPassWidgetState createState() => _ForgotPassWidgetState();
}

class _ForgotPassWidgetState extends State<ForgotPassWidget> {
  TextEditingController emailAddressController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: FlutterFlowIconButton(
                        borderColor:
                            FlutterFlowTheme.of(context).secondaryColor,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 50,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                      child: Text(
                        'Atras',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Exo 2',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(1, 40, 0, 0),
            child: Text(
              'Recupera tu Password',
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Exo 2',
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    fontSize: 32,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'ingrese el correo electrónico asociado, para que le  enviemos un enlace para restablecer su contraseña.',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Exo 2',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x4D101213),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(1, 1, 1, 1),
                child: TextFormField(
                  controller: emailAddressController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Tu direccion de correo...',
                    labelStyle: FlutterFlowTheme.of(context).bodyText2,
                    hintText: 'Ingresa tu email...',
                    hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF57636C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Exo 2',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                if (emailAddressController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Email required!',
                      ),
                    ),
                  );
                  return;
                }
                await resetPassword(
                  email: emailAddressController.text,
                  context: context,
                );
              },
              text: 'Recuperar Password',
              options: FFButtonOptions(
                width: 270,
                height: 50,
                color: FlutterFlowTheme.of(context).secondaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Exo 2',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                elevation: 3,
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
    );
  }
}
