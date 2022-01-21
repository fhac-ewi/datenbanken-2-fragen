#Fragenkatalog
## Data Warehousing
Fragen aus der Datei [Vorlesungsinhalt-VL1](./Fragenkatalog/01%20Data%20Warehousing/Vorlesungsinhalt-VL1.md).
<details><summary><b>Definition: Datenbank</b></summary>
<table><tr><td>

Eine Datenbank ist ein integrierter, persistenter Datenbestand einschließlich aller relevanten Informationen über die dargestellte Information (Metadaten), der einer Gruppe von Benutzern zur Verfügung steht und durch eine spezielle Software möglichst redundanzfrei verwaltetet wird.

</td></tr></table>
</details>
<details><summary><b>Definition: Datenbankmanagementsystem (DBMS)</b></summary>
<table><tr><td>

Ein Datenbankmanagementsystem (DBMS) ist die Gesamtheit aller Programme zur Erzeugung, Verwaltung und Manipulation einer Datenbank.

</td></tr></table>
</details>
<details><summary><b>OnLine Transaction Protocol (OLTP)</b></summary>
<table><tr><td>

- Klassische relationale Datenbank ist für Tagesgeschäft (Einkauf, Verkauf, Lagerbestand) 
- Der aktuelle Zustand der Datenbank ist im Vordergrund und wird bearbeitet (OnLine) 
- Viele Änderungs- und Einfüge-Operationen 
- Granularität: einzelne Objekte wichtig 
- Zugriff durch alle möglichen Mitarbeiter. Zugriff eher auf einzelne Tupel 

</td></tr></table>
</details>
<details><summary><b>OnLine Analytic Processing (OLAP)</b></summary>
<table><tr><td>

- Einzelne Objekte nicht so interessant 
- Dateninhalte historisch 
- Sicht über die Entwicklung des Unternehmens, also evolutionär und integriert 
- Zugriffe: read only durch komplexe Abfragen auf ganze Tabellen 
- Wenige Nutzer wie z.B. Manager 

</td></tr></table>
</details>
<details><summary><b>Data Warehouse</b></summary>
<table><tr><td>

- Eine übergreifende, Zentrale Datenbasis 
- Optimiert für Einfüge- und Lese-Operationen, nicht für Transaktionen 
- Extract, Transform, Load (ETL) Tools 
- eine entscheidungsunterstützende Datenbank die zusätzlich und separat von den Datenbanken des Unternehmens gepflegt wird 
- Alle relevanten Unternehmensdaten werden gesammelt und verdichtet 
- Diese gilt es zu strukturieren (Data-Mining, Data-Analysis) 
- Bietet eine globale Perspektive unter Verwendung historischer Daten 
- Schafft durch OLAP Werkzeuge die Basis für Business Intelligence 
- Data Warehouses können aus kleineren Einheiten, sogenannten Data Marts gebildet werden 
- Data Marts sind kleine Einheiten des Unternehmens wie z.B. Marketing, Verkauf etc. 
- Dies kann Integrationsprobleme auf höheren Ebenen verursachen 

</td></tr></table>
</details>
<details><summary><b>Data Warehouse vs. klassisch verteilte Datenbank</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>Mögliche Aufbauten von Data Warehourses</b></summary>
<table><tr><td>

TODO
</td></tr></table>
</details>

## Semantic Web
Fragen aus der Datei [Vorlesungsinhalt](./Fragenkatalog/02%20Semantic%20Web/Vorlesungsinhalt.md).
<details><summary><b>Nothing here</b></summary>
<table><tr><td>

TODO
</td></tr></table>
</details>

## NoSQL-Datenbanken
Fragen aus der Datei [Cassandra](./Fragenkatalog/03%20NoSQL-Datenbanken/Cassandra.md).
<details><summary><b>Cassandra</b></summary>
<table><tr><td>


</td></tr></table>
</details>
<details><summary><b>was ist Cassandra ?</b></summary>
<table><tr><td>

Eine NoSql-Datenbank die auf der AP Seite einzuordnen ist

</td></tr></table>
</details>
<details><summary><b>Eigenschaften</b></summary>
<table><tr><td>


- elastisch (wegen Chord-Ring Hinzuhame von weiteren Rechnern möglich, fast linear sklaierbar)
- verteilt (Peer-to-Peer Chord Ring, kein fixer Einstiegspunkt)
- skalierbar
- spaltenorientiert
- Fehlertolerant (Kein Master und Ausfallsicherheit durch Replikation)
- einstellbare Konsistenz (dennoch bleibt es AP)
- kann auch mit kleinen Clustern (1,3,5) Knoten betrieben werden

</td></tr></table>
</details>
<details><summary><b>Motivation</b></summary>
<table><tr><td>


HBase hat sehr viele Server (zookeeper, HDFS, Data Nodes, etc.) und unter 7 Knoten macht es wenig Sinn. Dazu kommt das es einen Master-Slave Ansatz verfolgt der zum Single-Point-of Failure führen kann (!). Mit dem Chord-Ring, den wir schon in Dynamo-DB kennengelernt haben können wird Cassandra seinen verteilten Ansatz umsetzen.


</td></tr></table>
</details>
<details><summary><b>Konzepte</b></summary>
<table><tr><td>


- Consisten Hashin
- Vektoruhren
- Gossip Protocol
- Hinted Handoff
- etc 

Sind aus dem Dynamo Paper entnommen

</td></tr></table>
</details>
<details><summary><b>Datenmodell</b></summary>
<table><tr><td>


- 3 dimensionale "Hast-Table"
- Ein Keyspace beinhaltet Column Families und regelt deren Repilkationsart
- Jede Zeile besitzt einen Key und besteht aus Spalten (Namen müssen nicht vorher festgelegt sein)
- Jede Spalte hat einen Namen und einen value Wert + Timestamp
- optinal: Time to Live (TTL)



</td></tr></table>
</details>
<details><summary><b>Eselsbrücke</b></summary>
<table><tr><td>

Wenn Dynamo-DB und BigTable's ein Kind hätten, dann wäre es Cassandra ;)

</td></tr></table>
</details>

Fragen aus der Datei [MongoDB](./Fragenkatalog/03%20NoSQL-Datenbanken/MongoDB.md).


<details><summary><b>MongoDb</b></summary>
<table><tr><td>


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

</td></tr></table>
</details>
<details><summary><b>Datenmodell</b></summary>
<table><tr><td>


- JSON -> geordnete Menge an Keys mit entsprechenden Values
- Indexe sind zentral -> Map/Reduce Ansätze
- auto Sharding
- intern binär (BSON)


Fazit:

- passt gut zu AJAX und REST 
- embedded documents liefern eine Umgehungstatbestand zu dem Fehlen von Joints
- serialisierte Objekte entsprechen dem Modell der Programmiersprache 

-> leider hoher Grad an Denormalisierung -> Information wird mehrfach gespeichert 




</td></tr></table>
</details>

Fragen aus der Datei [Vorlesungsinhalt](./Fragenkatalog/03%20NoSQL-Datenbanken/Vorlesungsinhalt.md).
<details><summary><b>Nothing here</b></summary>
<table><tr><td>

TODO
</td></tr></table>
</details>

## Big Data
Fragen aus der Datei [Vorlesungsinhalt](./Fragenkatalog/04%20Big%20Data/Vorlesungsinhalt.md).
<details><summary><b>Nothing here</b></summary>
<table><tr><td>

TODO
</td></tr></table>
</details>

## Data Mining
Fragen aus der Datei [Vorlesungsinhalt](./Fragenkatalog/05%20Data%20Mining/Vorlesungsinhalt.md).
<details><summary><b>Nothing here</b></summary>
<table><tr><td>

TODO
</td></tr></table>
</details>

## Klausurvorbereitung
Fragen aus der Datei [Prüfungsthemen](./Fragenkatalog/99%20Klausurvorbereitung/Prüfungsthemen.md).
<details><summary><b>Data Warehouse</b></summary>
<table><tr><td>

TODO
- Eigenschaften
- Welche Daten kommen da rein?
- Besonderheit dieser Daten?
- Wie kann das Schema aufgebaut sein?
- Welche Operation führt man da durch?

</td></tr></table>
</details>
<details><summary><b>OLAP</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>OLTP</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>Schwächen von relationalen Datenbanken</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>Multicurrency / Optimistische Nebenläufigkeit</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>Kategorien NoSQL</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>Key/Value Speicher </b></summary>
<table><tr><td>

TODO
- Aufbau
- Funktion

</td></tr></table>
</details>
<details><summary><b>Konzepte DynamoDB</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>CordRing</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>Spaltenbasierten bzw. Wide Column Databases (Zusammensetzung der KEy Value Speicher)</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>CAP Theorem</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>HDFS</b></summary>
<table><tr><td>

TODO
- Eigenschaften
- Konzept
- HBASE

</td></tr></table>
</details>
<details><summary><b>Map & Reduce </b></summary>
<table><tr><td>

TODO
- Besonderheiten 
- Java Signatur aufschreiben
- Welche Parameter würde ein Word Count bekommen? Umschreiben

</td></tr></table>
</details>
<details><summary><b>Lokalitätsprinzip</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>RDD Konzepte (lazy)</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>Yarn Sheduler (?)</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>SPARK </b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>PIG Vorteile (Datenflussorientierte Scriptsprache)</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>HIVE erlaubt SQL Nutzung</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>Kassandra</b></summary>
<table><tr><td>

TODO
- Eigenschaften
- Partitioner
- Wie würde man eine Zeitreihen Datenbank anlegen?

</td></tr></table>
</details>
<details><summary><b>MongoDB</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>Entscheidungsbaum/DB-Scan</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>Clustering</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>Sloppy Quorum</b></summary>
<table><tr><td>

TODO 
</td></tr></table>
</details>



Generiert am Fri Jan 21 14:03:47 UTC 2022
