import 'package:flutter/material.dart';
import 'package:marvelhq/constants.dart';
import 'package:marvelhq/controllers/usuarios.dart';
import 'package:marvelhq/favorites/favorites.dart';
import 'package:marvelhq/models/usuario.dart';
import 'package:marvelhq/views/main/screenComics.dart';
import 'package:marvelhq/views/main/screenCharacters.dart';
import 'package:marvelhq/views/main/screenCreators.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';
  static Usuario user;

  final Usuario usuario;

  const HomePage({Key key, @required this.usuario}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    fetchUsuario('usuario', 'senha').then((value) => HomePage.user = value);

    Favorites fav = new Favorites();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('')
      ),
      drawer: buildAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              buildContainerHeader(),
              buildUserCard(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildUserCard() {
    return Container(
      width: double.infinity,
      height: 70,
      //color: Colors.red,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'User Panel',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0),
                  )
                ]),
            height: 400,
            width: 390,
          ),
        ],
      ),
    );
  }

  Container buildContainerHeader() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Welcome,',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          Text(widget.usuario.fantasia,
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ],
      ),
      width: double.infinity,
    );
  }

  Drawer buildAppBar(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 88.0,
            child: DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
            ),
          ),
          ListTile(
            title: Text('Comics'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenComics(),
                  )
              );
            },
          ),
          ListTile(
            title: Text('Characters'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenCharacters(usuario: HomePage.user),
                  )
              );
            },
          ),
          ListTile(
            title: Text('Creators'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenCreators(usuario: HomePage.user),
                  )
              );
            },
          ),
          Divider(
            height: 1,
            color: Colors.black,
          ),
          ListTile(
            title: Text('Sign out'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}