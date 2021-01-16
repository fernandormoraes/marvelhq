import 'dart:convert';
import 'package:marvelhq/models/usuario.dart';

Future<Usuario> fetchUsuario(String usuario, senha)  async {
  if(usuario == 'user' && senha == 'pass') {
    return Usuario.fromJson();
  }else{
    return null;
  }
}
