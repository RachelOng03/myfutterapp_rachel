

//GEBAUT ABER NICHT VERWENDET!!!

//Importieren der Konstanten (Farben, etc.) und main
import 'package:flutter/material.dart';
import 'package:myfutterapp/constant.dart';
import 'package:myfutterapp/Übersichtseite.dart';
import 'package:myfutterapp/Filter.dart';


class detailAnsicht extends StatefulWidget {
  detailAnsicht();

  @override
  _detailAnsichtState createState() => _detailAnsichtState();}


class _detailAnsichtState extends State<detailAnsicht>{

  //Notwendige Variablen definieren
  //(Datenbank einfügen)
  String rezeptart = "Hauptgericht";
  String rezeptTitel = "Hähnchen mit Reis & Gemüse";
  String zubereitungszeit = "10min";
  int anzahlZutaten = 15;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: yellowToneLight,

      //Body = Gesamte Seite zum Scrollen
      body: SingleChildScrollView(
        child: Container(

          child: Center(
            child: Column (

              children: [

                SizedBox(height: 60.00,),

                Container (
                  //Gestaltung
                  height: 80.00, width: 350.00,
                  decoration: BoxDecoration (color: yellowToneDark, borderRadius: BorderRadius.circular(32)),

                  //Überschrift
                  child: Column(

                    //Elemente gleichmäßig untereinander spacen
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [

                      SizedBox (height: 10.00,),

                      //Gericht-Art kommt hier hin (Variable)
                      Text (rezeptart, style:
                      TextStyle(color: darkGrey, fontWeight: FontWeight.bold, fontSize: 15.0, fontFamily: 'Rooney',),),
                      Text (rezeptTitel, style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23.00, fontFamily: 'Rooney',),),

                      SizedBox (height: 10.00,),
                    ],),),

                SizedBox(height: 15.00,),


                // Bild des Essens
                Container(
                  height: 250.00,
                  width: 350.00,
                  decoration: BoxDecoration (color: Colors.white, borderRadius: BorderRadius.circular(20)),),

                SizedBox(height: 15.00,),

                // Zutatenliste
                Container(
                  height: anzahlZutaten * 25,
                  width: 350.00,
                  decoration: BoxDecoration (color: yellowText, borderRadius: BorderRadius.circular(20)),

                  child: Column(
                    //Elemente gleichmäßig untereinander spacen
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: List.generate (anzahlZutaten, (index) =>
                        Container(
                          height: 20.00,
                          width: 330.00,
                          color: Colors.black,

                        ),
                    ),


                  ),

                ),

                SizedBox(height: 15.00,),


                // Knöpfe am Ende der Seite
                Row(

                  //Gleichmäßig anordnen
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    // Zurück-zur-Übersichtsseite Knopf
                    GestureDetector (onTap: () { Navigator.of(context).push (MaterialPageRoute(builder: (context) => OverviewPage()),);},
                      child: Container(

                        //Gestaltung
                        height: 40.00, width: 160.00,
                        decoration: BoxDecoration (color: yellowToneDark, borderRadius: BorderRadius.circular(20)),

                        //Anklick Option
                        child:

                        //Zentrieren
                        Center(
                          child:
                          //Text
                          Text ("Back", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.00, fontFamily: 'Rooney',),),),

                      ),),

                    // Zurück-zum-Filter Knopf
                    GestureDetector (onTap: () { Navigator.of(context).push (MaterialPageRoute(builder: (context) => filter()),);},
                      child: Container(

                        //Gestaltung
                        height: 40.00, width: 160.00,
                        decoration: BoxDecoration (color: yellowToneDark, borderRadius: BorderRadius.circular(20)),

                        //Anklick Option
                        child:

                        //Zentrieren
                        Center(
                          child:
                          //Text
                          Text ("Zurück zum Filter", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.00, fontFamily: 'Rooney',),),),

                      ),),

                  ],),

                SizedBox(height: 15.00,),


              ],),),),


      ),);
  }
}