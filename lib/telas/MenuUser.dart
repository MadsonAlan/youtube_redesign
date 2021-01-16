import 'package:flutter/material.dart';

class MenuUser extends StatefulWidget {
  final Function onTap;

  const MenuUser({Key key, this.onTap}) : super(key: key);
  @override
  _MenuUserState createState() => _MenuUserState();
}

class _MenuUserState extends State<MenuUser> {
  int itemSelect = 0;
  //String _nome = "", _email = "", _letra = " ";
  //bool _verificado = false;

//Cria uma listview com os itens do menu
  Widget _listMenu() {
    return ListView(
      children: <Widget>[
        _avatar(),
        _tiles("Perfil", Icons.person, 0, () {}),
        _tiles("Marcados Como Gostei", Icons.thumb_up, 1, () {}),
        _tiles("Assistir Mais Tarde", Icons.access_time, 2, () {}),
        _tiles("Histórico", Icons.history, 2, () {}),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Divider(
            color: Colors.red,
          ),
        ),
        _tiles("YouTube Premium", Icons.play_circle_filled, 3, () {}),
        _tiles("YouTube Filmes", Icons.local_movies, 4, () {}),
        _tiles("YouTube Gaming", Icons.gamepad, 4, () {}),
        _tiles("Live", Icons.live_tv, 4, () {}),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Divider(
            color: Colors.red,
          ),
        ),
        _tiles("Configurações", Icons.settings, 3, () {}),
        _tiles("Controle de Histórico", Icons.flag, 4, () {}),
        _tiles("Ajuda", Icons.help, 4, () {}),
        _tiles("Dar Feedback", Icons.feedback, 4, () {}),
      ],
    );
  }

  Widget _tiles(String text, IconData icon, int item, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
        color: Colors.grey,
      ),
      onTap: () => {},
      selected: item == itemSelect,
      title: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _avatar() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.brown.shade800,
            child: Text("MA"),
          ),
          Container(
            height: 12.0,
          ),
          Text(
            "Madson Alan",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          Text("contato.madsonalan@gmail.com",
              style: TextStyle(color: Colors.black87, fontSize: 10)),
        ],
      ),
    );
  }

  /*void _atualizarDados() {
    String _primeiroNome, _sobrenome;
    if (_verificado == false) {
      getValuesCash('name').then((value) {
        _primeiroNome = value.split(" ").getRange(0, 1).toSet().join();
        _sobrenome = value.split(" ").getRange(1, 2).toSet().join();
        setState(() {
          _letra = _primeiroNome.split("").getRange(0, 1).toSet().join() +
              _sobrenome.split("").getRange(0, 1).toSet().join();
          _nome = _primeiroNome + " " + _sobrenome;
        });
      });
      getValuesCash('email').then((value) => _email = value);

      _verificado = true;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    //_atualizarDados();
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[200],
        child: _listMenu(),
      ),
    );
  }
}
