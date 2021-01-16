import 'package:flutter/material.dart';
import 'package:marvelhq/constants.dart';
import 'package:marvelhq/controllers/comics.dart';
import 'package:marvelhq/models/usuario.dart';

class ScreenComics extends StatefulWidget {
  static String routeName = '/screenComics';
  static List listComics;

  final Usuario usuario;

  const ScreenComics({Key key, @required this.usuario}) : super(key: key);

  @override
  _ScreenComicsState createState() => _ScreenComicsState();
}

class _ScreenComicsState extends State<ScreenComics> {
  @override
  void initState(){
    fetchComic('2d08c338cd539b38c8deb94bf4cb56ddbe7ec905', '892844cca6563f962d4212b66bfd070c')
        .then((value) async{
          ScreenComics.listComics = value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Comics"), backgroundColor: kPrimaryColor),
      body: new ListView.builder(
        itemCount: ScreenComics.listComics == null ? 0 : ScreenComics.listComics.length,
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
                      ScreenComics.listComics[index].titulo,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                    Text(
                        ScreenComics.listComics[index].descricao == null ? '' :
                        ScreenComics.listComics[index].descricao.length > 150 ? 'Descrição: ' +
                            ScreenComics.listComics[index].descricao.substring(0, 150) + '...' : '',
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

