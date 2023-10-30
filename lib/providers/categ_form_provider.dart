import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/categoria.dart';

class CategFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Listado categoria;
  CategFormProvider(this.categoria);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
