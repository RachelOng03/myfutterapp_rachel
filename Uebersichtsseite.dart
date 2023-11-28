
//Hier können Zutaten zur Datenbank hinzugefügt oder entfernt werden

//zutatDatabaseEditHive.dart
import 'package:flutter/material.dart';
import 'package:myfutterapp/constant.dart';
import 'package:myfutterapp/zutat.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfutterapp/boxes.dart';
import 'package:myfutterapp/databaseBoxFilter.dart';
import 'package:myfutterapp/databaseBoxRezepte.dart';
import 'package:myfutterapp/databaseBoxMapping.dart';
import 'package:myfutterapp/databaseBoxRezepteGefiltert.dart';
import 'package:myfutterapp/footer.dart';
import 'package:myfutterapp/detailview.dart';
import 'package:myfutterapp/Ähnliche Rezepte.dart';
import 'package:myfutterapp/zutatDatabaseEditHive.dart';
import 'package:myfutterapp/databaseBoxAehnlich.dart';
import 'package:myfutterapp/header.dart';

class ausgabe extends StatefulWidget {
  ausgabe();
  @override
  _ausgabe createState() => _ausgabe();}

class _ausgabe extends State<ausgabe>{

  //Hier der Filter für ähnliche Rezepte (alle die mind. eine Zutat der gewünschten enhalten)
  void _aehnlicheRezepte () async {

    await boxAehnlich.clear();

    List<int> items = [];
    List<int> no_duplicates = [];
    bool duplicate = false;

    //Alle Rezepte durchgehen
    for (var i = 0; i < boxRezepte.length; i++) {

      late int mapping_rezept;

      databaseBoxRezepte rezept = boxRezepte.getAt(i);
      int rezept_id = rezept.rezepte_id;

      //Alle Zutaten durchegehen
      for (var j = 0; j < boxFilter.length; j++) {
        databaseBoxFilter filter = boxFilter.getAt(j);
        int filter_id = filter.boxFilter_id;

        //Alle Mapping Items durchgehen
        for (var k = 0; k < boxMapping.length; k++) {
          databaseBoxMapping mapping = boxMapping.getAt(k);
          int mapping_rezept = mapping.mappingRezept_id;
          int mapping_zutat = mapping.mappingZutat_id;

          //Wenn Rezept im Mapping gefunden: Speichern in Liste
          if (mapping_rezept == rezept_id && mapping_zutat == filter_id) {
            items.add(rezept_id);
          }
        }
      }
    }

    if (items.length == 1){
      setState(() {
        print("Passt");
        boxAehnlich.put('key_${boxAehnlich.length}', databaseBoxAehnlich(aehnlich_id: items[0]),);
      });
    }

    if (items.length > 1){
      no_duplicates.add(items[0]);
        for (var l = 1; l < items.length; l++) {
          duplicate = false;
          for (var m = 0; m < no_duplicates.length; m++) {
            if (items[l] == no_duplicates[m]) {
              duplicate = true;
              break;
            }
          }
          if (duplicate == false) {
            no_duplicates.add(items[l]);
            print(no_duplicates);
          }
        }

    for (var n = 0; n < no_duplicates.length; n++) {
      setState(() {
        print("Aehnlich");
        boxAehnlich.put('key_${boxAehnlich.length}', databaseBoxAehnlich(aehnlich_id: no_duplicates[n]),);
      });
    }
    }

    Navigator.of(context).push (MaterialPageRoute(builder: (context) => aenlicheRezepte()),);

  }

  //Der Wert aus dem Textfeld wird später die Zutat
  TextEditingController zutatController = TextEditingController();


  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: yellowToneLight,

      appBar: AppBar(

          //Automatischen Pfeil entfernen
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          elevation: 0.0,
          backgroundColor: yellowText,

          title: header(title: ' MyFutterApp '),
        ),

      body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [

                SizedBox(height: 15.00,),

                Text('Rezepte:',style: TextStyle(color: darkGrey, fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: 'Rooney',),),

                SizedBox(height: 10.00,),

                Container(

                  //Stylen
                  height: 500.00,
                  width: 370.00,
                  decoration: BoxDecoration (color: yellowToneDark, borderRadius: BorderRadius.circular(20)),

                  child: boxGefilterteRezepte.length != 0?
                      ListView.builder (
                          itemCount: boxGefilterteRezepte.length, itemBuilder: (context, index){
                          databaseBoxRezepteGefiltert gefRezept = boxGefilterteRezepte.getAt(index);
                          int ID = gefRezept.gefilterteRezepte_id;
                          databaseBoxRezepte rezepte = boxRezepte.getAt(ID);
                          String zeit = rezepte.rezepte_zeit;
                          String titel = rezepte.rezepte_titel;


                          return ListTile(

                            title: GestureDetector (
                              onTap: () { Navigator.of(context).push (MaterialPageRoute(builder: (context) => Detailview(index: index),),);},

                              child: Align(
                                alignment: Alignment.bottomCenter,
                                // Übersichtsbox erstellen
                                child: Container (
                                  height: 70.00,
                                  width: 370.00,

                                  decoration: BoxDecoration (color: Colors.white, borderRadius: BorderRadius.circular(20)),

                                  //Inhalt pro Rezeptübersicht (Bild, Titel, Kurzbeschreibung)
                                  child: Row(

                                    children: [

                                      SizedBox (width: 40.00,),
                                      //Platzhalter
                                      Text((index+1) .toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.0, fontFamily: 'CooperBlack',),),

                                      SizedBox (width: 40.00,),
                                      // Rezeptübersicht Inhalt
                                      Column (
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          SizedBox(height: 10.00,),
                                          // Inhalt einer jeweiligen Rezeptübersicht
                                          Text("$titel", style: TextStyle (color: darkGrey, fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Rooney',),),

                                          Text ("Zubereitungszeit: $zeit", style: TextStyle (color: yellowText, fontSize: 10.0, fontFamily: 'Rooney',),),

                                        ],
                                      ),
                                    ],
                                    // Schließen einer Rezeptübersicht
                                  ),
                                ),
                              ),
                            ),
                            );
                            },
                      )

                      : Column(

                              children: [

                                SizedBox(height: 170.00,),

                              Container (
                                height: 50.00,
                                width: 350.00,

                                child: Align (
                                  alignment: Alignment.center,
                                  child: Text("Leider keine passenden", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0, fontFamily: 'CooperBlack',),),
                                ),
                              ),

                                Container (
                                  height: 50.00,
                                  width: 350.00,

                                  child: Align (
                                    alignment: Alignment.center,
                                    child: Text("Rezepte!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0, fontFamily: 'CooperBlack',),),
                                  ),
                                ),


                                Container (
                                  height: 50.00,
                                  width: 350.00,

                                  child: Align (
                                    alignment: Alignment.center,
                                    child: Text("Bitte versuche es mit anderen Zutaten!", style: TextStyle(color: yellowText, fontWeight: FontWeight.bold, fontSize: 15.0, fontFamily: 'Rooney',),),
                                ),
                                ),
                              ],
                            ),
                ),


                SizedBox(height: 10.00,),

                // Ähnliche-Ergebnisse-Knopf
                GestureDetector (onTap: () {

                  _aehnlicheRezepte();},
                  child: Container(

                    //Gestaltung
                    height: 40.00, width: 350.00,
                    decoration: BoxDecoration (color: yellowText, borderRadius: BorderRadius.circular(20)),

                    child:
                    Center(
                      child:
                      Text ("Ähnliche Ergebnisse", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.00, fontFamily: 'Rooney',),),),
                  ),
                ),
              ],
           ),
          ),
       ),
      bottomNavigationBar: Footer(),
    );
  }
}