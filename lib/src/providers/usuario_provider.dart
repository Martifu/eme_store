import 'dart:convert';

import 'package:http/http.dart' as http;

class UsuarioProvider {

  String _url =  'tienda.192.168.137.1.xip.io';

  Future nuevoUsuario(String name, String email, String password) async {

    final authData = {
      'name'    : name,
      'email'   : email,
      'password': password,
      'confirm_password': password
    };
    print(authData);

    final url =  Uri.http(_url, '/api/register'); 
    final resp = await http.post(url,body: authData); 
    Map<String, dynamic> decodeResp = json.decode(resp.body); 

    print(decodeResp); 

  }



}