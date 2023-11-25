
//In dieser Box werden die Informationen über die einzelnen Rezepte gespeichert

//Importieren der relevanten Dart-Files
import 'package:hive/hive.dart';

part 'databaseBoxRezepte.g.dart';

@HiveType(typeId: 5)

// Die Box für die Rezepte
class databaseBoxRezepte {

  //Alle benötigten Daten
  databaseBoxRezepte ({
    required this.rezepte_id,
    required this.rezepte_titel,
    required this.rezepte_zeit,
    required this.rezepte_kurzbeschreibung,
    required this.rezepte_anleitung,
    required this.rezepte_art,
    required this.rezepte_bild,
  });

  // Felder der Box:

  @HiveField(0)
  int rezepte_id;

  @HiveField(1)
  int rezepte_titel;

  @HiveField(2)
  int rezepte_zeit;

  @HiveField(3)
  int rezepte_kurzbeschreibung;

  @HiveField(4)
  int rezepte_anleitung;

  @HiveField(5)
  int rezepte_art;

  @HiveField(6)
  int rezepte_bild;

}