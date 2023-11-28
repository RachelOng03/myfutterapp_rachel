
//In diesem File wird die Box für die aenlichen Rezepte gespeichert

//Importieren der relevanten Dart-Files
import 'package:hive/hive.dart';

part 'databaseBoxAehnlich.g.dart';

@HiveType(typeId: 6)

//Die Box für die Ergebnisse des Filters
class databaseBoxAehnlich {

  //Es wird nur die Rezept_id gespeichert
  databaseBoxAehnlich ({
    required this.aehnlich_id,
  });

  // Feld der Box
  @HiveField(0)
  int aehnlich_id;

}