
//Importieren der relevanten Dart-Files
import 'package:flutter/material.dart';
import 'package:myfutterapp/constant.dart';
import 'package:myfutterapp/filterWidget.dart';
import 'package:myfutterapp/zutatDatabaseEditHive.dart';
import 'package:myfutterapp/boxes.dart';
import 'package:myfutterapp/zutat.dart';
import 'package:myfutterapp/footer.dart';
import 'package:myfutterapp/databaseBoxMapping.dart';
import 'package:myfutterapp/databaseBoxRezepteGefiltert.dart';
import 'package:myfutterapp/databaseBoxRezepte.dart';
import 'package:myfutterapp/databaseBoxFilter.dart';
import 'package:myfutterapp/filterErgebnisse.dart';
import 'package:myfutterapp/Uebersichtsseite.dart';



class filterErgebnisse extends StatefulWidget {
  filterErgebnisse();
  @override
  _filterErgebnisse createState() => _filterErgebnisse();}


class _filterErgebnisse extends State<filterErgebnisse> {

  void _ergebnisseRezepte () async {

    await boxGefilterteRezepte.clear();

    //Alle Rezepte durchgehen
    for (var i = 0; i < boxRezepte.length; i++) {
      List<int> items = [];
      int counter = 0;
      int mapping_rezept = 1200000;

      databaseBoxRezepte rezept = boxRezepte.getAt(i);
      int rezept_id = rezept.rezepte_id;

      //Alle Zutaten durchegehen
      for (var j = 0; j < boxFilter.length; j++) {
        databaseBoxFilter filter = boxFilter.getAt(j);
        int filter_id = filter.boxFilter_id;

        for (var k = 0; k < boxMapping.length; k++) {
          databaseBoxMapping mapping = boxMapping.getAt(k);
          int mapping_rezept = mapping.mappingRezept_id;
          int mapping_zutat = mapping.mappingZutat_id;

          if (mapping_rezept == rezept_id && mapping_zutat == filter_id) {
            items.add(mapping_rezept);
            print(items);
          }
        }
      }

      for (var k = 0; k < boxMapping.length; k++) {
        databaseBoxMapping mapping = boxMapping.getAt(k);
        int mapping_rezept = mapping.mappingRezept_id;

        if (mapping_rezept == rezept_id) {
          counter = counter + 1;
        }
        print(counter);
      }

      if (counter == items.length) {
        setState(() {
          print("Filterungpasst");
          boxGefilterteRezepte.put('key_${boxGefilterteRezepte.length}', databaseBoxRezepteGefiltert(gefilterteRezepte_id: i),);
        });
      }
    }

    Navigator.of(context).push (MaterialPageRoute(builder: (context) => ausgabe()),);
}

    @override
    Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Padding(
          padding: EdgeInsets.all(20.00),
          child: Wrap(
          //Boxen mit Abstand anordnen
          spacing: 15.00,
          runSpacing: 5.00,
          //Zentrieren
          alignment: WrapAlignment.center,

          //Anzahl der Boxen von Zutatenmenge abhängig
          children: List.generate (boxZutat.length, (index) => Container(
          //Da die Boxen responsive sein müssen, gibt es für das Speichern der Zutaten und das Erstellen eine eigene Dart Datei
          child: filterWidget(index: index),
          ),
          ),
          ),
          ),

        //Platzhalter zwischen den Containern
        SizedBox(height: 10.00,),
        // Rezeptsuche-Starten-Knopf
           GestureDetector (onTap: () {
             _ergebnisseRezepte();},
             //Zur Übersichtsseite
              child: Container(
              //Gestaltung
              height: 40.00, width: 350.00,
              decoration: BoxDecoration (color: yellowText, borderRadius: BorderRadius.circular(20)),
              child:
                 Center(
                   child:
                  //Text
                  Text ("Rezeptsuche starten", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.00, fontFamily: 'Rooney',),),
                ),
             ),
            ),
            // Platzhalter zwischen den Containern
            SizedBox(height: 20.00,),

        ],
      ),
    );
  }
}
