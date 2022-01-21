

# MongoDb

- Abgleitet aus Humongous 
- NoSQl
- Dokumentorientiert (JSON Dokumente)
- Schmemfrei
- skalierbar
- open source
- high performance

Daraus folgt:

- Keine Zeilen
- Keine Transaktionen 
- keine Joins
- keine refrentielle Integrität

# Datenmodell

- JSON -> geordnete Menge an Keys mit entsprechenden Values
- Indexe sind zentral -> Map/Reduce Ansätze
- auto Sharding
- intern binär (BSON)


Fazit:

- passt gut zu AJAX und REST 
- embedded documents liefern eine Umgehungstatbestand zu dem Fehlen von Joints
- serialisierte Objekte entsprechen dem Modell der Programmiersprache 

-> leider hoher Grad an Denormalisierung -> Information wird mehrfach gespeichert 




