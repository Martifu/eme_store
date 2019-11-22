
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:eme_store/src/models/producto_model.dart';

class ProductosProvider {

  final String _url = 'https://sleepy-tor-83141.herokuapp.com';

  Future<bool> crearProducto(ProductoModel producto) async {

    final url = '$_url/api/store';

    final resp = await http.post(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYWRjMWEwNjE2OTU1NjAyOWZhNGMwYzkzYzEyNDY4NzhiNjk4NjU3NDNiMzgyNzE2ZjcyNzdmODliYWMwMWQwY2VkYmQ4M2ZmZDNjNjQ0MjIiLCJpYXQiOjE1NzQxMDIyMTQsIm5iZiI6MTU3NDEwMjIxNCwiZXhwIjoxNjA1NzI0NjE0LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.Kj2Z39QR9-X_sJOR1AHjQkxHIN2dcKefhDVzj7Vd4vn_vJDmlIa4Z7e2GdZ-nqFugI7ev6icd7-kQM2DCEH_D57KdN60R4mqDmHO96D8glvaD6Tw6I9mpC9cZJzT4su_WP5lkfE8o9t-S81WGP3w-nEbt28llUwldZv9L8G4hh6AGC_CUAnAMza4eHPSwrUXGpbGf5klk2pvvZp-6Yu1hKHhmKzBZnz0ObQ5Xoy8yTLNDzCGjHyzEu_l77zw_qpJF-vmyusYxLz_4uzuwiGaI4LIvlorQwclmjC_sN_-VQRINu_ywoGiMkP2o1uEDifJxbrj5aGnOPoeax3-zuacxayEdajq4iT89rHo1FFNcB9o2Gokj92MTeTX-XxybtoWjEjJiMf2GUIVTSLHw5pv3PpfvjZ5LfwUXM9tudgQTlP2r3bh3SJ3dPxa6CEoMzEQqovWEVSm7sdFdUfsTSHJGiseUYqr1R-W0mV5JryTM22bjwcAR22nuBRVJUtB6m8ku0uAfDEYsh8-anv0mjJWUzksAq0vZm5gy7nWlphSj03cvjx8q7NeWJxCI60YhArVxM9zfZ-GGTHSlHwuizfqtU2lG5uOsRQ-UXJPLEzF4rQq_UgK8Hn1iJLQ1NRijOsmlXartmbpKvgGuXKHQD_UFe5gkMcsbcQaYYkh1joewSA'
    }, body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;

  }

  Future<List<ProductoModel>> cargarProductos() async {

      final url = '$_url/api/productos';
      //final url = Uri.http(_url, '/api/productos');
      final resp = await http.post(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzMSIsImp0aSI6Ijg4M2Y3ZTg3YTVkYzBkMWIyZDFhMmQyNGM3NThlMDk0MmExNWY5YTVjZGE5MGI2Y2ZkZjlmMWY5MTdhZDcyODg1OGE3NDAxMmFiM2RiZTEyIiwiaWF0IjoxNTc0MTE4NjMxLCJuYmYiOjE1NzQxMTg2MzEsImV4cCI6MTYwNTc0MTAzMSwic3ViIjoiMyIsInNjb3BlcyI6W119.ngmd8ejasUNzgXhduFZc7bhttzSt1z8aEtPiZJ0g5jT4psBLpdi0UI1VmTWrOQ2T5IsT4_K04Y8AHfWGwLJ08VpqR-kJ_U8pBDXViaMo6BivbVyePm5Tkfpex_PAutpXH_RKQR8w0sxI0p2RrDh4ykAkVIffXYZY8tALYXfmBKsxJX0fQnwFi9xCplpzgbfZjgiToj1gF649xaLdD0ER-meHA9QY2hKsmIftw1GYDd41QvjWcuejMO3UiXxjjmbI7SRQhBJqXIt-91KygN9z8wDXUcFMcdEtoJOqlfZYtp04Ba4IZ2GTDT3dhgwfiQAeA-tVuM-5sBD1i63XmWMperJPt60_bx4p6yzdxWHKJIDO4PKHET3-42fGCkfXmVQXwbW044FrY2rehacNoFVO979MXSdq4Sh2CJ6aaclCZY7_jiX26WCRNLPgkAyTHo-oIjXRrK9Cob6Pmdo31BYJ1W0J_WtSXh1_ZFrXTbgSMd6K35F1D0OFUkBZIhqE-oc47qU4OZ57dJtSt2p4dj5QtM3wtaad1slf64ddBRniTIFRoBRzRZeOFoFklIfUCxal7-hUTt92FaD3WSNP_FIGjq3KQjjLLaWfRoRiF5vU5fY7qFULliXqkfi0gbjt25sfg4g7oDpnD_-V6bz_ghzsAtkXxuV_w3X9vExORTQW_yA'
    });

      final List<dynamic> decodedData = json.decode(resp.body);
      final List<ProductoModel> productos = new List();

      if ( decodedData == null) return [];

      decodedData.forEach((prod){
        final prodTemp = ProductoModel.fromJson(prod);
        productos.add(prodTemp);
      }); 

      print(productos[0].id);
      return productos;
  }
}