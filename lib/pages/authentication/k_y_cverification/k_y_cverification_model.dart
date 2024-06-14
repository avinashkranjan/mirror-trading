import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'k_y_cverification_widget.dart' show KYCverificationWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KYCverificationModel extends FlutterFlowModel<KYCverificationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for FullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  // State field(s) for DateofBirth widget.
  FocusNode? dateofBirthFocusNode;
  TextEditingController? dateofBirthTextController;
  String? Function(BuildContext, String?)? dateofBirthTextControllerValidator;
  // State field(s) for Mobileno widget.
  FocusNode? mobilenoFocusNode;
  TextEditingController? mobilenoTextController;
  String? Function(BuildContext, String?)? mobilenoTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for Aadharcardno widget.
  FocusNode? aadharcardnoFocusNode;
  TextEditingController? aadharcardnoTextController;
  String? Function(BuildContext, String?)? aadharcardnoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    dateofBirthFocusNode?.dispose();
    dateofBirthTextController?.dispose();

    mobilenoFocusNode?.dispose();
    mobilenoTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    aadharcardnoFocusNode?.dispose();
    aadharcardnoTextController?.dispose();
  }
}
