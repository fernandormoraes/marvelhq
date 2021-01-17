import 'package:flutter/material.dart';
import 'package:marvelhq/constants.dart';
import 'package:marvelhq/controllers/comics.dart';
import 'package:marvelhq/views/componentes/searchComic.dart';
import 'package:marvelhq/views/detail/detailComics.dart';

class ScreenComics extends StatefulWidget {
  static String routeName = '/screenComics';
  static List listComics;
  final List<String> list = List.generate(10, (index) => "Texto $index");

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
      appBar: new AppBar(
          title: new Text("Comics"),
          backgroundColor: kPrimaryColor,
          actions: <Widget>[
            IconButton(
              onPressed: (){
                showSearch(context: context, delegate: Search(ScreenComics.listComics));
              },
              icon: Icon(Icons.search),
            )
          ]
      ),
      body: listViewComics()
    );
  }

  Widget listViewComics(){
    return Container(
       child: FutureBuilder<List>(
         future: fetchComic('2d08c338cd539b38c8deb94bf4cb56ddbe7ec905',
             '892844cca6563f962d4212b66bfd070c'),
           // ignore: missing_return
        builder: (context, snapshot) {
           if(snapshot.hasData){
             return ListView.builder(
              itemCount: ScreenComics.listComics == null ? 0 : ScreenComics.listComics.length,
              itemBuilder: (BuildContext context, int index){
                return new Card(
                  margin: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: InkWell(
                    splashColor: Colors.red.withAlpha(30),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailComics(id: ScreenComics.listComics[index].id.toString(),
                                                               titulo: ScreenComics.listComics[index].titulo),
                          )
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      width: 200,
                      height: 500,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      ScreenComics.listComics[index].thumb == null ? '' :
                                                        ScreenComics.listComics[index].thumb  + '/portrait_xlarge.jpg',
                                      width: 100,
                                      height: 200,
                                    ),
                                  ),
                                Flexible(
                                  child: Text(
                                    ScreenComics.listComics[index].titulo,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        Flexible(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  ScreenComics.listComics[index].descricao == null ? '' :
                                  'Description: ' + ScreenComics.listComics[index].descricao,
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  ScreenComics.listComics[index].serie == null ? '' :
                                  'Series Name: ' + ScreenComics.listComics[index].serie,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            );
        }else if(snapshot.hasError){
             return Center(
               child: Text(
                 'Fail'
               ),
             );
        }else{
           return Center(
             child: CircularProgressIndicator(),
           );
        }
      }
    )
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

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

