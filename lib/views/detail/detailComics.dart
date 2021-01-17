import 'package:flutter/material.dart';
import 'package:marvelhq/constants.dart';
import 'package:marvelhq/controllers/comics.dart';
import 'package:marvelhq/models/comic.dart';
import 'package:marvelhq/favorites/favorites.dart';

class DetailComics extends StatefulWidget {
  static String routeName = '/detailComics';
  static Comic comic;
  final String id;
  final String titulo;
  static Favorites fav = new Favorites();

  const DetailComics({Key key, @required this.id, @required this.titulo}) : super(key: key);

  @override
  _DetailComicsState createState() => _DetailComicsState();
}

class _DetailComicsState extends State<DetailComics> {
  @override
  void initState(){
    fetchComicById('2d08c338cd539b38c8deb94bf4cb56ddbe7ec905', '892844cca6563f962d4212b66bfd070c', widget.id)
        .then((value) async{
      DetailComics.comic = value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(widget.titulo)
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              buildContainerHeader(),
              buildDetailCard(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDetailCard() {
    return Container(
      child: FutureBuilder<Comic> (
          future: fetchComicById('2d08c338cd539b38c8deb94bf4cb56ddbe7ec905',
            '892844cca6563f962d4212b66bfd070c', widget.id),
          builder: (context, snapshot){
            if(snapshot.hasData) {
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.network(
                        DetailComics.comic.thumb == null ? '' :
                        DetailComics.comic.thumb + '/portrait_incredible.jpg',
                        width: 200,
                        height: 400,
                      ),
                    ),
                    TextButton(
                      child: const Text('ADD TO BOOKMARK'),
                      onPressed: () {
                        DetailComics.fav.addFavorite(DetailComics.comic);
                      },
                    ),
                    ListTile(
                      title: Text(DetailComics.comic.titulo),
                      subtitle: Text(DetailComics.comic.descricao),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
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

  Container buildContainerHeader() {
    return Container(
      padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('',
              style: TextStyle(
                  color: Colors.grey,
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

