import 'package:flutter/material.dart';
import 'package:youtube_redesign/CustomSearchDelegate.dart';
import 'package:youtube_redesign/telas/Biblioteca.dart';
import 'package:youtube_redesign/telas/EmAlta.dart';
import 'package:youtube_redesign/telas/Inicio.dart';
import 'package:youtube_redesign/telas/Inscricao.dart';

class Home extends StatefulWidget {
  final Function onTap;
  const Home({Key key, this.onTap}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(
            Icons.short_text,
            color: Colors.black87,
          ),
          onPressed: widget.onTap,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/youtube.png",
              width: 98,
              height: 22,
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black87,
            ),
            onPressed: () async {
              String res = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
              print("resultado: digitado " + res);
            },
          ),

          /*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
              print("acao: videocam");
            },
          ),

          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("acao: conta");
            },
          )
          */
        ],
      ),
      body: Container(
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(),
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
                //backgroundColor: Colors.orange,
                title: Text("Início"),
                icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                //backgroundColor: Colors.red,
                title: Text("Em alta"),
                icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                //backgroundColor: Colors.blue,
                title: Text("Inscrições"),
                icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                //backgroundColor: Colors.green,
                title: Text("Biblioteca"),
                icon: Icon(Icons.folder)),
          ]),
    );
  }
}
