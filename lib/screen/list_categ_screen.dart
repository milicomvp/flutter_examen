import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/models/categoria.dart';
import 'package:flutter_application_1/services/categoria_service.dart';

class ListCategScreen extends StatelessWidget {
  const ListCategScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final categoriaService = Provider.of<CategoriaService>(context);

    if (categoriaService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Categorias'),
      ),
      body: ListView.builder(
        itemCount: categoriaService.lstObject.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            categoriaService.SelectObject =
                categoriaService.lstObject[index].copy();
            Navigator.pushNamed(context, 'editCategoria');
          },
          // child: ProductCard(product: categoriaService.products[index]),
          child: ListTile(
            title: Text(categoriaService.lstObject[index].catName),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          categoriaService.SelectObject =
              Listado(catId: 0, catName: '', catState: '');
          Navigator.pushNamed(context, 'editCategoria');
        },
      ),
    );
  }
}
