import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/categ_form_provider.dart';
import 'package:flutter_application_1/services/categoria_service.dart';
import 'package:provider/provider.dart';

import '../ui/input_decorations.dart';

class EditCategScreen extends StatelessWidget {
  const EditCategScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final categService = Provider.of<CategoriaService>(context);
    return ChangeNotifierProvider(
        create: (_) => CategFormProvider(categService.SelectObject!),
        child: _CategScreenBody(
          categService: categService,
        ));
  }
}

class _CategScreenBody extends StatelessWidget {
  const _CategScreenBody({
    Key? key,
    required this.categService,
  }) : super(key: key);

  final CategoriaService categService;
  @override
  Widget build(BuildContext context) {
    final categForm = Provider.of<CategFormProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Categoria')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          _CategForm(),
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              if (!categForm.isValidForm()) return;
              await categService.deleteObject(categForm.categoria, context);
            },
            heroTag: null,
            child: const Icon(Icons.delete_forever),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () async {
              if (!categForm.isValidForm()) return;
              await categService.editOrCreateObject(
                  categForm.categoria, context);
            },
            heroTag: null,
            child: const Icon(Icons.save_alt_outlined),
          ),
        ],
      ),
    );
  }
}

class _CategForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categForm = Provider.of<CategFormProvider>(context);
    final categoria = categForm.categoria;

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
                initialValue: categoria.catName,
                onChanged: (value) => categoria.catName = value,
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
                initialValue: categoria.catState,
                onChanged: (value) => categoria.catState = value,
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
              color: Colors.black,
              offset: Offset(0, 5),
              blurRadius: 15,
            )
          ]);
}
