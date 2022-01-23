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
<details><summary><b>Mögliche Aufbauten von Data Warehouses</b></summary>
<table><tr><td>

- Star Schema
- Snowflake
- Fact Constellations
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

Fragen aus der Datei [Hadoop](./Fragenkatalog/03%20NoSQL-Datenbanken/Hadoop.md).
<details><summary><b>Was ist Hadoop?</b></summary>
<table><tr><td>


- Hadoop umfasst ein Framework was nach Googles BigTable Vorbild reengineered wurde
- Hadoop hat 2 wesentliche Schichten:
    - Das verteilte File System HDFS und die darauf basierende Spaltenbasierte Datenbank HBase
    - Die Laufzeitumgebung Map Reduce mit den Werkzeugen Pig, Hive...
    
</td></tr></table>
</details>
<details><summary><b>Datenmodell von HDFS</b></summary>
<table><tr><td>


- Write Once, Read Many
- Basis ist die Unterscheidung von NameNodes und DataNodes
  - NameNode ist der Master, der die Metadaten über das Dateisystem speichert (Zugriffsrechte, Data Directory)
  - DataNodes bedienen Rad/ Write Requests der Clients. Die Clients holen sich beim NameNode die Meta Daten und greifen dann direkt auf die DataNodes zu
    - Per Default speichern DataNodes Blöcke von 64 MB und 3 Replikas
    - DataNodes senden einen Blockreport (Info über gespeicherte Blöcke) und einen Hearbeat (noch aktiv Zeichen) an NameNode
        
</td></tr></table>
</details>
<details><summary><b>HDFS im CAP Theorem einordnen</b></summary>
<table><tr><td>


- HDFS kann als CP System eingeordnet werden
- Durch die Repliken ist es gegen ausfälle abgesichert
- Die Konsistenz ist gegeben, weil HDFS eine Schreiboperation erst bestätigt, wenn N Anzahl an Replikas bei anderen DataNodes bestätigt wurden
- Probem ist die Verfügbarkeit:
    - NameNode ist Single Point of Failure. Wenn der NameNode ausfällt können alle Daten verloren gehen
    
</td></tr></table>
</details>
<details><summary><b>Vor- und Nachteile von HDFS</b></summary>
<table><tr><td>


- Vorteile
    - sehr gutes Scale Out: einfach mehr DataNodes hinzufügen
    - Preisgünstig, weil OpenSource und Commodity Hardware nutzbar
    - für große Datenmengen geeignet
    - für Batch Verarbeitung großer Dateien konzipiert
    
- Nachteile
    - NameNode single point of failure
    - NameNode nicht skalierbar. Nicht gut für kleine Daten
    - Daten nicht veränderbar
    - keine Record Lookups
    
</td></tr></table>
</details>
<details><summary><b>Was ist HBase?</b></summary>
<table><tr><td>


- HBase läuft on top von einem Hadoop Cluster
- HBase erweitert Hadoop um die random Read/ Write Funktionalität
- Daten können in vorhandene Datensätze eingefügt werden

</td></tr></table>
</details>
<details><summary><b>Datenmodell von HBase</b></summary>
<table><tr><td>


- HBase ist eine Spaltenorientierte Datenbank die Key/ Value Paare speichert
- Column Families fassen Daten ähnlichen Typs zusammen
- Spalten werden Physisch nah gespeichert
- Dadurch ist die Suche sehr schnell

</td></tr></table>
</details>
<details><summary><b>Architektur</b></summary>
<table><tr><td>


- Region werden eine Menge von Zeilen zur speicherung zugewiesen
    - HBase Tabellen werden z.B. so aufgeteilt, dass alle Spalten einer ColumnFamily in einer Region gespeichert sind
- N Regions sind einem Region Server zugeteilt, der die Reads/ Writes managed
- Der HMaster ist der Master Node, vergleichbar mit dem NameNode in HDFS
    - Weißt Regions den Region Servern zu
    - Update, Create, delete Tabellen
- Zookeeper koordiniert das gesamte verteilte System
    - Jeder HRegionServer erzeugt einen Eintrag beim Zookeeper, mit dessen Hilfe der HMaster die operativen HRegionServer findet. Diese Einträge werden über einen Heartbeat gepflegt und bei Ausbleiben gelöscht
    - Zookeeper sorgt mittels Heartbeat dafür, dass es immer nur einen aktiven HMaster gibt
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
<details><summary><b>Eigenschaften von Big Data</b></summary>
<table><tr><td>


Charakterisiert durch die 3Vs:
- Volume (meint die Datenmenge)
- Variety (Verschiedenartigkeit, also strukturiert vs. Unstrukturiert)
- Velocity (dynamischer Eingang von Daten, z.B. Netzfrequenzüberwachung)


</td></tr></table>
</details>
<details><summary><b>Entwicklung </b></summary>
<table><tr><td>


- Die Menge der Daten wird größer
- 2012 weniger als eine Sekunde braucht Google um ca. 50 Millionen Seiten zur effektive Suche zu indizieren

</td></tr></table>
</details>
<details><summary><b>Warum gibt es immer mehr Daten?</b></summary>
<table><tr><td>


- Durch Soziale Netzwerke, mobile Endgeräte und das IoT gibt es immer mehr Daten

</td></tr></table>
</details>
<details><summary><b>Welche Anforderungen hat BigData an eine Datenbank?</b></summary>
<table><tr><td>


- Die vielfältigen Daten (Variety) müssen gespeichert werden, ohne das wir wissen was wir speichern (Text, Bild, Video, etc.)
- Menge der unstrukturierten Daten nimmt exponentiell zu
- hohe skalierbarkeit (scale out) für wachsendes Datenvolumen und variety

</td></tr></table>
</details>
<details><summary><b>Scale Up vs Scale out</b></summary>
<table><tr><td>

Scale up              
----------------- 
- Hinzufügen von CPU & RAm           
- Upgrade -> Ausfallzeit                    
- Grenzkosten oft hoch               

Scale out
-----------------
- Hinzufügen von weiteren Servern/Knoten
- kontrollierte Nebenläufigkeit    
- Replikation als Basisprinzip 

</td></tr></table>
</details>
<details><summary><b>Skalierung in RDBMS</b></summary>
<table><tr><td>


- nur begrenzt möglich
- Verfolgen einen zentralen Ansatz (Großrechner im Zentrum)
- Sperren vermindern den Durchsatz und damit die Verfügbarkeit
- Deshalb ist BigData bzw. skalierung nur schwer möglich in RDBMS

</td></tr></table>
</details>
<details><summary><b>NoSql</b></summary>
<table><tr><td>

-	Steht für not only SQL
-	Nicht relational
-	Schemafrei
-	Verteilt (Scale out)
-	Open Source
-	Beruht auf dem BASE Prinzip (gegenüber ACID Prinzip der RDBMS):
    - Basic Available
    - Soft State
    - Eventual Consistency

</td></tr></table>
</details>
<details><summary><b>CAP-Theorem</b></summary>
<table><tr><td>


Steht für Consistency, Availability, Partition Tolerance:
- Consistency: Alle Clients können die selben Daten sehen/lesen
- Availability: Jeder Client kann zu jedem Zeitpunkt lesen und schreiben
- Partition Tolerance: Das DBMS funktioniert obwohl einige Knoten nicht verfügbar sind
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



Generiert am Sun Jan 23 13:52:25 UTC 2022
