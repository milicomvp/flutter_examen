import 'dart:convert';

class Proveedor {
  Proveedor({
    required this.listado,
  });

  List<Listado> listado;

  factory Proveedor.fromJson(String str) => Proveedor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Proveedor.fromMap(Map<String, dynamic> json) => Proveedor(
        listado: List<Listado>.from(
            json["Proveedores Listado"].map((x) => Listado.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Proveedores Listado":
            List<dynamic>.from(listado.map((x) => x.toMap())),
      };
}

class Listado {
  Listado({
    required this.provId,
    required this.provName,
    required this.provLastname,
    required this.provMail,
    required this.provtState,
  });

  int provId;
  String provName;
  String provLastname;
  String provMail;
  String provtState;

  factory Listado.fromJson(String str) => Listado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Listado.fromMap(Map<String, dynamic> json) => Listado(
        provId: json["providerid"],
        provName: json["provider_name"],
        provLastname: json["provider_last_name"],
        provMail: json["provider_mail"],
        provtState: json["provider_state"],
      );

  Map<String, dynamic> toMap() => {
        "providerid": provId,
        "provider_name": provName,
        "provider_last_name": provLastname,
        "provider_mail": provMail,
        "provider_state": provtState,
      };

  Listado copy() => Listado(
      provId: provId,
      provName: provName,
      provLastname: provLastname,
      provMail: provMail,
      provtState: provtState);
}
