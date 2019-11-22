import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
    int id;
    String titulo;
    double valor;
    String disponible;
    String fotoUrl;

    ProductoModel({
        this.id,
        this.titulo = '',
        this.valor = 0.0,
        this.disponible = 'Sí',
        this.fotoUrl = 'http://no-image.ocom',
    });

    factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        id        : json["id"],
        titulo        : json["titulo"],
        valor         : json["valor"],
        disponible    : json["disponible"], 
        fotoUrl       : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
      "id"          :id,
        "titulo"    : titulo,
        "valor"     : valor,
        "disponible": disponible,
        "fotoUrl"   : fotoUrl,
    };
}
