import 'package:flutter/material.dart';
import 'package:marvelhq/models/comic.dart';
import 'package:marvelhq/views/detail/detailComics.dart';

class Search extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context){
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
    );
  }

  String selectedResult;
  @override
  Widget buildResults(BuildContext context){
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<Comic> listExample;
  List<Comic> recentList = [];
  Search(this.listExample);

  @override
  Widget buildSuggestions(BuildContext context){
    List<Comic> suggestionList = [];
    query.isEmpty
      ? suggestionList = recentList
      : suggestionList.addAll(listExample.where(
        (element) => element.titulo.contains(query),
    ));

    return ListView.builder(
      itemCount: suggestionList == null ? 0 : suggestionList.length,
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
                    builder: (context) => DetailComics(id: suggestionList[index].id.toString(),
                                                       titulo: suggestionList[index].titulo),
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
                            suggestionList[index].thumb == null ? '' :
                            suggestionList[index].thumb  + '/portrait_xlarge.jpg',
                            width: 100,
                            height: 200,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            suggestionList[index].titulo,
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
                          suggestionList[index].descricao == null ? '' :
                          'Description: ' + suggestionList[index].descricao,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          suggestionList[index].serie == null ? '' :
                          'Series Name: ' + suggestionList[index].serie,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }


}