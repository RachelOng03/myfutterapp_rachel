
//Importieren der relevanten Dart-Files
import 'package:flutter/material.dart';
import 'package:myfutterapp/constant.dart';
import 'package:myfutterapp/Detailansicht.dart';
import 'package:myfutterapp/filter.dart';
import 'package:myfutterapp/Übersichtseite.dart';

class aenlicheRezepte extends StatefulWidget {
  aenlicheRezepte();
  @override
  _aenlicheRezepte createState() => _aenlicheRezepte();
}


class _aenlicheRezepte extends State<aenlicheRezepte>{

  //Später dynamisch machen mit echter Anzahl
  int ergebnisAnzahlaenlich = 10;

  @override
  Widget build(BuildContext context){

    // Scaffold Widget zur Unterteilung
    return Scaffold(

      //Hintergrund heller
      backgroundColor: yellowToneLight,

      //Body = Gesamte Seite zum Scrollen
      body: SingleChildScrollView(
        child: Container(

          /* Folgende drei Abschnitte werden untereinander angeordnete mit Column:
         Zurück-Knopf, gefilterte Rezepte, neu Filtern*/

          child: Column (

            //Unterteilung in die 3 oben genannten Abschnitte
            children: [

              // 1. Zurück-Knopf

              Container(

                //Design
                color: yellowToneDark,
                height: 100.00,

                child:

                // Verweis zurück zur Übersicht
                GestureDetector (
                  onTap: () { Navigator.of(context).push (MaterialPageRoute(builder: (context) => OverviewPage()),);},

                  child: Align(
                    alignment: Alignment.bottomCenter,

                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("ZURÜCK ZUR ÜBERSICHT",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: 'Rooney',),),
                        ]
                    ),
                  ),
                ),
              ),


              Container (height: 20.00, color: yellowToneDark,),

              SizedBox(height: 20.00,),

              // Ergebnisboxen, abhängig von Anzahl
              Column (children: List.generate (ergebnisAnzahlaenlich, (index) =>

                //Bei Anklicken: Weiterleiten auf die Detailansicht
                GestureDetector (
                    onTap: () { Navigator.of(context).push (MaterialPageRoute(builder: (context) => detailAnsicht()),);},

                    // Übersichtsbox erstellen
                    child: Container (
                      height: 70.00,
                      width: 370.00,

                      decoration: BoxDecoration (color: Colors.white, borderRadius: BorderRadius.circular(20)),

                      //Inhalt pro Rezeptübersicht (Bild, Titel, Kurzbeschriebung)
                          child: Row(

                            //Elemente der Reihe gleichmäßig nebeneinander spacen
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [

                              SizedBox (width: 10.00,),

                              //Essensbild
                              //Platzhalter -> später echtes Bild
                              Text("BILD"),
                              SizedBox (width: 10.00,),

                              // Rezeptübersicht Inhalt
                              Column (

                                //Elemente linksbündig anordnen
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children:[

                                  SizedBox(height: 5.00,),

                                  // Inhalt einer jeweiligen Rezeptübersicht
                                  Text("Titel", style: TextStyle (color: darkGrey, fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Rooney',),),
                                  Row(
                                    children: [
                                    Text ("Zubereitungszeit: X Minuten", style: TextStyle (color: lightGrey, fontSize: 10.0, fontFamily: 'Rooney',),),
                                    SizedBox (height: 5.00,),
                                    Text ("  |  ", style: TextStyle (color: lightGrey, fontSize: 10.0, fontFamily: 'Rooney',),),
                                    SizedBox (height: 5.00,),
                                    Text ("Rezeptart", style: TextStyle (color: lightGrey, fontSize: 10.0, fontFamily: 'Rooney',),),
                                    ],
                                  ),
                                  Text ("Ich bin ein Satz Kurzbeschreibung.", style: TextStyle (color: yellowText, fontSize: 10.0, fontFamily: 'Rooney',),),
                                ],
                              ),

                              SizedBox (width: 5.00,),],

                            // Schließen einer Rezeptübersicht
                          ),

                      //Abstand zwischen den einzelnen Boxen herstellen
                      margin: EdgeInsets.only(bottom: 12.00),
                    ),
                ),
              ),
              ),

              SizedBox(height: 5.00,),

              // Neu-Filtern-Knopf
              GestureDetector (onTap: () { Navigator.of(context).push (MaterialPageRoute(builder: (context) => filter()),);},
                child: Container(

                  //Gestaltung
                  height: 40.00, width: 350.00,
                  decoration: BoxDecoration (color: yellowToneDark, borderRadius: BorderRadius.circular(20)),

                  //Anklick Option
                  child:
                  //Zentrieren
                  Center(
                    child:
                    //Text
                    Text ("Neu Filtern", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.00, fontFamily: 'Rooney',),),),
                ),),

              SizedBox(height: 30.00,),

            ],
          ),
        ),
      ),
    );
  }
}