
//Dart-File für die Ergebnis-Übersicht

//Importieren der relevanten Dart-Files
import 'package:flutter/material.dart';
import 'package:myfutterapp/constant.dart';
import 'package:myfutterapp/Detailansicht.dart';
import 'package:myfutterapp/filter.dart';
import 'package:myfutterapp/Ähnliche Rezepte.dart';
import 'package:myfutterapp/zutatDatabaseEditHive.dart';


class OverviewPage extends StatefulWidget {
  OverviewPage();
  @override
  _OverviewPageState createState() => _OverviewPageState();
}


class _OverviewPageState extends State<OverviewPage>{

  //Später dynamisch machen mit echter Anzahl
  int ergebnisAnzahl = 10;

  @override
  Widget build(BuildContext context){

    // Unterteilung:
   // Filterleiste, Body (Einzelne Rezepte zur Übersicht), Button für ähnliche Rezepte erstellen)
    return Scaffold(

      //Hintergrund heller Gelbton
      backgroundColor: yellowToneLight,

      //Body = Gesamte Overviewseite zum Scrollen
      body: SingleChildScrollView(
        child: Container(
          child: Column (

            //Unterteilung in die 3 oben genannten Abschnitte
            children: [

              //1. Child: Filterleiste
              //(Aktuell allerdings genutzt um Zutaten in der Datenbank zu bearbeiten)

              Container(

                //Design
                color: yellowToneDark,
                height: 100.00,

                child:

                //Zugang zur Datenbank Zutaten
                GestureDetector (
                  onTap: () { Navigator.of(context).push (MaterialPageRoute(builder: (context) => zutatDatabaseEditHive()),);},

                  child: Align(
                    alignment: Alignment.bottomCenter,

                    //Filter & Icon
                    child:
                    Row(
                      //Elemente der Reihe gleichmäßig nebeneinander spacen
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [

                          //Erklärtext vom Button & Formatierung
                          Text("Zutaten bearbeiten",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: 'Rooney',),),
                        ]

                    ),
                  ),
                ),
              ),


              Container (height: 20.00, color: yellowToneDark,),

              SizedBox(height: 20.00,),


              // 2. Ergebnisboxen, abhängig von Anzahl
              //(Nach Einbauen der Eingabeseite abhängig von Rezeptanzahl)

              Column (children: List.generate (ergebnisAnzahl, (index) =>

                //Bei Anklicken: Weiterleiten auf die Detailansicht
                GestureDetector (
                  onTap: () { Navigator.of(context).push (MaterialPageRoute(builder: (context) => detailAnsicht()),);},

                  // Übersichtsbox erstellen
                  child: Container (
                    height: 70.00,
                    width: 370.00,

                    decoration: BoxDecoration (color: Colors.white, borderRadius: BorderRadius.circular(20)),

                    //Inhalt pro Rezeptübersicht (Bild, Titel, Kurzbeschreibung)
                    child: Row(

                      //Elemente der Reihe gleichmäßig nebeneinander spacen
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [

                        SizedBox (width: 10.00,),
                        //Platzhalter
                        Text("BILD"),
                        SizedBox (width: 10.00,),

                        // Rezeptübersicht Inhalt
                        Column (

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

              // Ähnliche-Ergebnisse-Knopf
              GestureDetector (onTap: () { Navigator.of(context).push (MaterialPageRoute(builder: (context) => aenlicheRezepte()),);},
                child: Container(

                  //Gestaltung
                  height: 40.00, width: 350.00,
                  decoration: BoxDecoration (color: yellowToneDark, borderRadius: BorderRadius.circular(20)),

                  child:
                  Center(
                    child:
                    Text ("Das könnte dir auch gefallen", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.00, fontFamily: 'Rooney',),),),
                ),),

              SizedBox(height: 30.00,),

            ],
          ),
        ),
      ),
    );
  }
}