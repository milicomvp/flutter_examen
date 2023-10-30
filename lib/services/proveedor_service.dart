import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/proveedores.dart';

class ProveedorService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8000';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> lstObject = [];
  Listado? SelectObject;
  bool isLoading = true;
  bool isEditCreate = true;

  ProveedorService() {
    loadData();
  }
  Future loadData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_list_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final ObjectsMap = Proveedor.fromJson(response.body);
    print(response.body);
    lstObject = ObjectsMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateObject(Listado object, BuildContext context) async {
    isEditCreate = true;
    notifyListeners();
    if (object.provId == 0) {
      await createObject(object, context);
    } else {
      await updateObject(object, context);
    }

    isEditCreate = false;
    notifyListeners();
  }

  Future<String> updateObject(Listado object, BuildContext context) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_edit_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: object.toJson(), headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);

    //actualizamos el listado
    final index =
        lstObject.indexWhere((element) => element.provId == object.provId);
    lstObject[index] = object;

    return '';
  }

  Future createObject(Listado object, BuildContext context) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_add_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: object.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    lstObject.add(object);
    return '';
  }

  Future deleteObject(Listado object, BuildContext context) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_del_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: object.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    lstObject.clear(); //borra todo el listado
    loadData();
    Navigator.of(context).pushNamed('listProveedor');
    return '';
  }
}
