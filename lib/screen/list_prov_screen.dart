import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/proveedores.dart';
import 'package:flutter_application_1/screen/screen.dart';
import 'package:flutter_application_1/services/proveedor_service.dart';
import 'package:provider/provider.dart';

class ListProvScreen extends StatelessWidget {
  const ListProvScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final proveedorService = Provider.of<ProveedorService>(context);

    if (proveedorService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Proveedores'),
      ),
      body: ListView.builder(
        itemCount: proveedorService.lstObject.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            proveedorService.SelectObject =
                proveedorService.lstObject[index].copy();
            Navigator.pushNamed(context, 'editProveedor');
          },
          child: ListTile(
            title: Text(proveedorService.lstObject[index].provName),
            subtitle: Text(proveedorService.lstObject[index].provLastname),
            leading: const Icon(Icons.contact_mail_outlined),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          proveedorService.SelectObject = Listado(
              provId: 0,
              provName: '',
              provLastname: '',
              provtState: '',
              provMail: '');
          Navigator.pushNamed(context, 'editProveedor');
        },
      ),
    );
  }
}
