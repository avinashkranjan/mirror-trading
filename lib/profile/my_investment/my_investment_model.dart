import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'my_investment_widget.dart' show MyInvestmentWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyInvestmentModel extends FlutterFlowModel<MyInvestmentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Enteramount widget.
  FocusNode? enteramountFocusNode;
  TextEditingController? enteramountTextController;
  String? Function(BuildContext, String?)? enteramountTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    enteramountFocusNode?.dispose();
    enteramountTextController?.dispose();
  }
}
