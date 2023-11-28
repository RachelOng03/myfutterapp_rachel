
import 'package:flutter/material.dart';
import 'package:myfutterapp/footer.dart';
import 'package:myfutterapp/constant.dart';
import 'package:myfutterapp/databaseBoxRezepteGefiltert.dart';
import 'package:myfutterapp/databaseBoxRezepte.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfutterapp/boxes.dart';
import 'package:myfutterapp/databaseBoxMapping.dart';
import 'package:myfutterapp/zutat.dart';


//Grundlegendes wieder wie Farbschema

class Detailview extends StatefulWidget {

  //Rezept Index übergeben
  final int index;
  Detailview({required this.index});

  @override
  _DetailviewState createState() => _DetailviewState();
}

class _DetailviewState extends State<Detailview> {

  late Future<String> _titelFuture;
  late Future<String> _zeitFuture;
  late Future<String> _zutatenFuture;
  late Future<String> _zubereitungFuture;

  late String zeit;
  late String titel;
  late String zubereitung;
  late List zutatenListe;
  late List zutatenListeNummern;

  //Informationen, die aus der Datenbank abgerufen werden

  void initState() {
    super.initState();

    _titelFuture = _fetchTitelFromDatabase();
    _zeitFuture = _fetchZeitFromDatabase();
    _zutatenFuture = _fetchZutatenFromDatabase();
    _zubereitungFuture = _fetchZubereitungFromDatabase();

    //Datenbankwerte
    var rezept = boxRezepte.getAt(widget.index);
    titel = rezept.rezepte_titel;
    zeit = rezept.rezepte_zeit;
    zubereitung = rezept.rezepte_anleitung;
    zutatenListe = [];
    zutatenListeNummern = [];

    for (var i = 0; i < boxMapping.length; i++) {
      databaseBoxMapping mapping = boxMapping.getAt(i);
      int mapping_rezept = mapping.mappingRezept_id;
      int mapping_zutat = mapping.mappingZutat_id;

      if (mapping_rezept == widget.index) {
        zutatenListeNummern.add(mapping_zutat);
        print(zutatenListeNummern);
      }
    }

    for (var j = 0; j <  boxZutat.length; j++){

      Zutat zutatName = boxZutat.getAt(j);
      int zutat_id = zutatName.zutat_id;
      String zutat = zutatName.zutat;

      for (var k = 0; k <  zutatenListeNummern.length; k++) {

        int aktZutat = zutatenListeNummern [k];

        if (zutat_id == aktZutat) {
          zutatenListe.add(zutat);
          print(zutatenListe);
        }
      }

    }

  }
  //Vorbereitung für Datebankabruf

  Future<String> _fetchTitelFromDatabase() async {
    await Future.delayed(Duration(seconds: 2));
    return '$titel';
  }

  Future<String> _fetchZeitFromDatabase() async {
    await Future.delayed(Duration(seconds: 2));
    return '$zeit';
  }

  Future<String> _fetchZutatenFromDatabase() async {
    await Future.delayed(Duration(seconds: 2));
    return '$zutatenListe';
  }

  Future<String> _fetchZubereitungFromDatabase() async {
    await Future.delayed(Duration(seconds: 2));
    return '$zubereitung';
  }
  //Funktionen zum Abruf der Daten aus der Datenbank mit einer 2 sekündigen Verzögerung

  void _goToHomePage() {
    Navigator.pop(context);
  }

  void _shareRecipe() {
    print('Eigene Rezepte teilen');
  }

  void _goBack() {
    Navigator.pop(context);
  }
  //Navigationsoptionen für Übergänge (Startseite, Zurück, Eigene Rezepte teilen)

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: yellowToneLight,
        appBar: AppBar(

          //Automatischen Pfeil entfernen
          automaticallyImplyLeading: false,
          toolbarHeight: 150,
          elevation: 0.0,
          backgroundColor: yellowText,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(
                  'assets/images/Brokkoli.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: FutureBuilder<String>(
                    future: _titelFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Text(
                          snapshot.data ?? 'Titel',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CooperBlack',
                          ),
                          softWrap: true,
                          maxLines: 4,
                          textAlign: TextAlign.center,
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(
                  'assets/images/Chili.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),

      //Definiert Eigenschaften der Appbar mit Bildern und Titel (aus der Datenbank abgerufen)
      body: GestureDetector(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 36.0),
                      child: Text(
                        'Zeit:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 36.0),
                      child: FutureBuilder<String>(
                        future: _zeitFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Container(
                              width: 200,
                              child: TextField(
                                controller: TextEditingController(text: snapshot.data),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 36.0),
                      child: Text(
                        'Zutaten:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 36.0),
                      child: FutureBuilder<String>(
                        future: _zutatenFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Container(
                              width: 200,
                              child: TextField(
                                controller: TextEditingController(text: snapshot.data),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child: Text(
                        'Zubereitung:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    FutureBuilder<String>(
                      future: _zubereitungFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Container(
                            width: 320,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: TextEditingController(text: snapshot.data),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 16),
                                //Definiert Textfelder (welche aus der Datenbank befüllt werden) und dazugehörige Titel
                                Center (
                                  child: ElevatedButton(
                                    onPressed: _goBack,
                                    child: Text('Zurück zu allen Suchergebnissen', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.00, fontFamily: 'Rooney',),),
                                    style: ElevatedButton.styleFrom(
                                        primary: yellowText
                                    ),
                                  ),
                                ),
                                //Definiert Funktion und Aussehen des Zurück-Buttons
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),

                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
      //Definition aller Inhalte und Bilder
      bottomNavigationBar: Footer(),
      //Button zum Erstellen eigener Rezepte hin
    );
  }
}
