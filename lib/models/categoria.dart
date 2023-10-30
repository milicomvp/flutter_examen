import 'dart:convert';

class Categoria {
  Categoria({
    required this.listado,
  });

  List<Listado> listado;

  factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        listado: List<Listado>.from(
            json["Listado Categorias"].map((x) => Listado.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Listado Categorias": List<dynamic>.from(listado.map((x) => x.toMap())),
      };
}

class Listado {
  Listado({
    required this.catId,
    required this.catName,
    required this.catState,
  });

  int catId;
  String catName;
  String catState;

  factory Listado.fromJson(String str) => Listado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Listado.fromMap(Map<String, dynamic> json) => Listado(
        catId: json["category_id"],
        catName: json["category_name"],
        catState: json["category_state"],
      );

  Map<String, dynamic> toMap() => {
        "category_id": catId,
        "category_name": catName,
        "category_state": catState,
      };

  Listado copy() => Listado(catId: catId, catName: catName, catState: catState);
}
