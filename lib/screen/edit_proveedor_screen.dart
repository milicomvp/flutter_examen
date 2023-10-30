import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/prove_form_provider.dart';
import 'package:flutter_application_1/services/proveedor_service.dart';
import 'package:provider/provider.dart';

import '../ui/input_decorations.dart';

class EditProveedorScreen extends StatelessWidget {
  const EditProveedorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final proveService = Provider.of<ProveedorService>(context);
    return ChangeNotifierProvider(
        create: (_) => ProveFormProvider(proveService.SelectObject!),
        child: _ProveScreenBody(
          proveService: proveService,
        ));
  }
}

class _ProveScreenBody extends StatelessWidget {
  const _ProveScreenBody({
    Key? key,
    required this.proveService,
  }) : super(key: key);

  final ProveedorService proveService;
  @override
  Widget build(BuildContext context) {
    final proveForm = Provider.of<ProveFormProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Proveedor')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          _ProvForm(),
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              if (!proveForm.isValidForm()) return;
              await proveService.deleteObject(proveForm.proveedor, context);
            },
            heroTag: null,
            child: const Icon(Icons.delete_forever),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () async {
              if (!proveForm.isValidForm()) return;
              await proveService.editOrCreateObject(
                  proveForm.proveedor, context);
            },
            heroTag: null,
            child: const Icon(Icons.save_alt_outlined),
          ),
        ],
      ),
    );
  }
}

class _ProvForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categForm = Provider.of<ProveFormProvider>(context);
    final categoria = categForm.proveedor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: categForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: categoria.provName,
                onChanged: (value) => categoria.provName = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'el nombre es obligatorio';
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Nombre de la categoría',
                  labelText: 'Nombre',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: categoria.provLastname,
                onChanged: (value) => categoria.provLastname = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'el apellido es obligatorio';
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Apellido del Proveedor',
                  labelText: 'Apellido',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: categoria.provMail,
                onChanged: (value) => categoria.provMail = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'el mail es obligatorio';
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Mail del Proveedor',
                  labelText: 'Mail',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: categoria.provtState,
                onChanged: (value) => categoria.provtState = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'el estado es obligatorio';
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Estado de la categoría',
                  labelText: 'Estado',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _createDecoration() => const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              offset: Offset(0, 5),
              blurRadius: 15,
            )
          ]);
}
