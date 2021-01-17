import 'package:flutter/material.dart';
import 'package:marvelhq/constants.dart';
import 'package:marvelhq/controllers/creators.dart';
import 'package:marvelhq/models/usuario.dart';

class ScreenCreators extends StatefulWidget {
  static String routeName = '/screenCreators';
  static List listCreators;

  final Usuario usuario;

  const ScreenCreators({Key key, @required this.usuario}) : super(key: key);

  @override
  _ScreenCreatorsState createState() => _ScreenCreatorsState();
}

class _ScreenCreatorsState extends State<ScreenCreators> {
  @override
  void initState(){
    fetchCreators('2d08c338cd539b38c8deb94bf4cb56ddbe7ec905', '892844cca6563f962d4212b66bfd070c')
        .then((value) async{
      ScreenCreators.listCreators = value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Creators"), backgroundColor: kPrimaryColor),
      body: buildCreators(),
    );
  }

  Container buildCreators() {
    return Container(
      child: FutureBuilder<List>(
        future: fetchCreators('2d08c338cd539b38c8deb94bf4cb56ddbe7ec905',
          '892844cca6563f962d4212b66bfd070c'),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: ScreenCreators.listCreators == null
                  ? 0
                  : ScreenCreators
                  .listCreators.length,
              itemBuilder: (BuildContext context, int index) {
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
                      height: 80,
                      child: Column(
                        children: <Widget>[
                          Text(
                            ScreenCreators.listCreators[index].nome,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
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

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

