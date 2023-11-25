
//Dieses File beinhaltet die Filterseite unserer MyFutterApp

//Importieren der relevanten Dart-Files
import 'package:flutter/material.dart';
import 'package:myfutterapp/constant.dart';
import 'package:myfutterapp/Übersichtseite.dart';
import 'package:myfutterapp/Detailansicht.dart';
import 'package:myfutterapp/filterWidget.dart';
import 'package:myfutterapp/zutatDatabaseEditHive.dart';
import 'package:myfutterapp/boxes.dart';
import 'package:myfutterapp/zutat.dart';

class filter extends StatefulWidget {
  filter();

  @override
  _filter createState() => _filter();}


class _filter extends State<filter>{

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: yellowToneLight,

      //Oberfläche zum Scrollen
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column (

              //Gestaltung der Seite
              children: [

                SizedBox(height: 80.00,),
                Text("Wähle mindestens fünf Zutaten:",style: TextStyle(color: darkGrey, fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: 'Rooney',),),
                SizedBox(height: 40.00,),

                //Hier werden die einzelnen Zutatenboxen zum Anklicken erstellt
                //Soviele Zutatenboxen wie passen werden in eine Zeile gepackt

                Wrap(

                  //Boxen mit Abstand anordnen
                  spacing: 5.00,
                  runSpacing: 5.00,
                  //Zentrieren
                  alignment: WrapAlignment.center,

                  //Anzahl der Boxen von Zutatenmenge abhängig
                  children: List.generate (boxZutat.length, (index) =>
                      Container(
                          padding: EdgeInsets.all(10.00),
                          //Da die Boxen responsive sein müssen, gibt es für das Speichern der Zutaten und das Erstellen eine eigene Dart Datei
                          //Siehe: "filterWidget.dart"
                          child: filterWidget(index: index),
                      ),
                  ),
                ),

                //Platzhalter zwischen den Containern
                SizedBox(height: 40.00,),

                // Rezeptsuche-Starten-Knopf
                //Leitet weiter auf die Overview-Seite
                GestureDetector (onTap: () { Navigator.of(context).push (MaterialPageRoute(builder: (context) => OverviewPage()),);},
                  child: Container(

                    //Gestaltung
                    height: 40.00, width: 350.00,
                    decoration: BoxDecoration (color: yellowText, borderRadius: BorderRadius.circular(20)),

                    child:
                      //Zentrieren
                      Center(
                        child:
                        //Text
                          Text ("Rezeptsuche starten", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.00, fontFamily: 'Rooney',),),
                      ),
                    ),
                ),

                // Platzhalter zwischen den Containern
                SizedBox(height: 30.00,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
