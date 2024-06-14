import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'deposit_widget.dart' show DepositWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DepositModel extends FlutterFlowModel<DepositWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DematAccountID widget.
  FocusNode? dematAccountIDFocusNode;
  TextEditingController? dematAccountIDTextController;
  String? Function(BuildContext, String?)?
      dematAccountIDTextControllerValidator;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for Enteramount widget.
  FocusNode? enteramountFocusNode;
  TextEditingController? enteramountTextController;
  String? Function(BuildContext, String?)? enteramountTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    dematAccountIDFocusNode?.dispose();
    dematAccountIDTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    enteramountFocusNode?.dispose();
    enteramountTextController?.dispose();
  }
}
