
//In diesem File wird die Box für die gefilterten Rezepte gespeichert

//Importieren der relevanten Dart-Files
import 'package:hive/hive.dart';

part 'databaseBoxRezepteGefiltert.g.dart';

@HiveType(typeId: 4)

//Die Box für die Ergebnisse des Filters
class databaseBoxRezepteGefiltert {

  //Es wird nur die Rezept_id gespeichert
  databaseBoxRezepteGefiltert ({
    required this.gefilterteRezepte_id,
  });

  // Feld der Box
  @HiveField(0)
  int gefilterteRezepte_id;

}