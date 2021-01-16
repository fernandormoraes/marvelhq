import 'package:flutter/material.dart' show AppBar, BorderSide, BuildContext, Colors, Column, Container, EdgeInsets, Form, FormState, GlobalKey, InputDecoration, MaterialPageRoute, MediaQuery, Navigator, Padding, SafeArea, Scaffold, SingleChildScrollView, SizedBox, State, StatefulWidget, TextEditingController, TextFormField, TextInputType, TextStyle, UnderlineInputBorder, Widget;
import 'package:marvelhq/controllers/usuarios.dart';
import 'package:marvelhq/views/componentes/botaoPadrao.dart';
import 'package:marvelhq/models/usuario.dart';
import 'package:marvelhq/views/main/home.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:marvelhq/views/componentes/header.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = '/sign_in';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Header(),
                SizedBox(height: screenHeight * 0.12),
                FormularioLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormularioLogin extends StatefulWidget {
  @override
  _FormularioLoginState createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          children: [
            _cpf(emailController),
            SizedBox(height: screenHeight * 0.03),
            _senha(passController),
            SizedBox(height: screenHeight * 0.05),
            BotaoPadrao(
              screenWidth: screenWidth,
              insideTitle: 'Connect',
              acao: () {
                if (_formKey.currentState.validate()) {
                  fetchUsuario(emailController.text, passController.text)
                      .then((value) {
                        Usuario user = value;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(usuario: user),
                            )
                        );
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _cpf(TextEditingController controller) {
  return TextFormField(
    controller: controller,
    // ignore: missing_return
    validator: (value) {
      if (value.isEmpty) {
        return 'User is empty';
      }
    },
    cursorColor: Colors.black,
    decoration: InputDecoration(
        labelText: 'USER',
        labelStyle: TextStyle(color: Colors.grey),
        focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
  );
}

Widget _senha(TextEditingController controller) {
  return TextFormField(
    controller: controller,
    // ignore: missing_return
    validator: (value) {
      if (value.isEmpty) {
        return 'Password is empty';
      }
    },
    obscureText: true,
    decoration: InputDecoration(
        labelText: 'PASSWORD',
        labelStyle: TextStyle(color: Colors.grey),
        focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
  );
}
