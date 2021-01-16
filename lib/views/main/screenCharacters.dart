import 'package:flutter/material.dart';
import 'package:marvelhq/constants.dart';
import 'package:marvelhq/controllers/characters.dart';
import 'package:marvelhq/models/character.dart';
import 'package:marvelhq/models/usuario.dart';

class ScreenCharacters extends StatefulWidget {
  static String routeName = '/screenCharacters';
  static List listCharacters;

  final Usuario usuario;

  const ScreenCharacters({Key key, @required this.usuario}) : super(key: key);

  @override
  _ScreenCharactersState createState() => _ScreenCharactersState();
}

class _ScreenCharactersState extends State<ScreenCharacters> {
  @override
  void initState(){
    fetchCharacters('2d08c338cd539b38c8deb94bf4cb56ddbe7ec905', '892844cca6563f962d4212b66bfd070c')
        .then((value) async{
      ScreenCharacters.listCharacters = value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Characters"), backgroundColor: kPrimaryColor),
      body: new ListView.builder(
        itemCount: ScreenCharacters.listCharacters == null ? 0 : ScreenCharacters.listCharacters.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // if you need this
              side: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: InkWell(
              splashColor: Colors.red.withAlpha(30),
              onTap: () {
                //TODO
              },
              child: Container(
                padding: EdgeInsets.all(20.0),
                width: 200,
                height: 150,
                child: Column(
                  children: <Widget>[
                    Text(
                      ScreenCharacters.listCharacters[index].nome,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ScreenCharacters.listCharacters[index].descricao == null ? '' :
                      ScreenCharacters.listCharacters[index].descricao.length > 150 ? 'Descrição: ' +
                          ScreenCharacters.listCharacters[index].descricao.substring(0, 150) + '...' : '',
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildComics() {
    return Container(
      width: double.infinity,
      height: 70,
      //color: Colors.red,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ]),
            height: 60,
            width: 60,
            child: Icon(
              Icons.arrow_downward,
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Progresso',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '20',
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
            height: 60,
            width: 250,
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
          Text('Olá,',
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

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

