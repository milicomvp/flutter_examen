import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/proveedores.dart';

class ProveFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Listado proveedor;
  ProveFormProvider(this.proveedor);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
