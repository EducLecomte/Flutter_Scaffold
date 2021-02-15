import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// A l'intérieur de la structure basique, Scaffold, une appBar est intégrée.
// Elle comporte le titre de la page ainsi que le bouton « j'aime ».
// Pour varier un peu, la propriété backgroundColor est modifiée pour afficher
// la couleur rouge.
// Pour le bouton, le choix se porte sur un widget IconButton.
// Il est intégré dans un paramètre nommé actions qui attend une liste de
// widgets. L'IconButton sera vu, peu après, plus en détail. La propriété
// onPressed appelle la méthode _likeThis
// Cette méthode incorpore un appel à setState(). Elle est donc à l'écoute
// de changements. En fonction d'un booléen qui surveille l'état de l'icône,
// ce dernier change pour passer d'un cœur vide à un cœur rempli.

// Le FAB appelle la même méthode _likeThis que le bouton de l'appBar.
// Il incorpore aussi une icône en forme de cœur. Pour harmoniser le tout,
// le fond est coloré en rouge. Suite à l'appui sur le bouton, les deux cœurs
// se remplissent simultanément

// Concernant la BottomAppBar, un Container d'une hauteur de 50 pixels.
// Lui-même comprendra deux IconButton qui pour l'instant ne proposeront pas
// d'action particulière. Cette barre sera rouge pour rester dans la thématique
// proposée. Une propriété supplémentaire est toutefois ajoutée. Il s'agit de
// shape, qui permet de définir une forme. En l'occurrence, l'idée est
// d'entourer le bouton d'action flottant placé précédemment.
// Pour cela, le paramètre shape prend la valeur CircularNotchedRectangle.
// Cette classe ne possède que ce constructeur public et rien d'autre.
// Elle permet d'obtenir un rectangle contenant une encoche circulaire dans
// laquelle le bouton d'action flottant va venir se loger.

// Vous trouverez en commentaire une BottomNavigationBar. Pour la tester,
// commentez le code du FAB, du FABLocation, de la BottomAppBar, et
// décommentez celui de la BottomNavigationBar.

// Vous trouverez en commentaire un Drawer. Pour la tester, décommentez le code
// de ce dernier.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Scaffold'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon _coeur = Icon(
    Icons.favorite_border,
    color: Colors.white,
  );
  bool _likeBool = false;

  void _likeThis() {
    setState(() {
      if (_likeBool) {
        _coeur = Icon(
          Icons.favorite_border,
          color: Colors.white,
        );
        _likeBool = false;
      } else {
        _coeur = Icon(
          Icons.favorite,
          color: Colors.white,
        );
        _likeBool = true;
      }
    });
  }

  int _indexSelectionne = 0;
  String _affichage = "Body";

  void _itemClique(int index) {
    setState(() {
      _indexSelectionne = index;
      switch (_indexSelectionne) {
        case 0:
          {
            _affichage = '$_indexSelectionne: Accueil';
          }
          break;
        case 1:
          {
            _affichage = '$_indexSelectionne: Mon compte';
          }
          break;
        case 2:
          {
            _affichage = '$_indexSelectionne: Statistiques';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: _coeur, onPressed: _likeThis),
        ],
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${_affichage}',
              style: TextStyle(color: Colors.red, fontSize: 40),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _likeThis, backgroundColor: Colors.red, child: _coeur),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add_location,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(
                  Icons.forward,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
      ),

      /*bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
              color: Colors.white,
            ),
            label: 'Mon compte',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assessment,
              color: Colors.white,
            ),
            label: 'Statistiques',
          ),
        ],
        backgroundColor: Colors.red,
        onTap: _itemClique,
        currentIndex: _indexSelectionne,
      ),*/

     /* drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu de navigation',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            Text('Lien 1'),
            Text('Lien 2'),
            Text('Lien 3'),
          ],
        ),
      ),*/
    );
  }
}
