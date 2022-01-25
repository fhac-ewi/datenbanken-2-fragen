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
<details><summary><b>HBase im CAP Theorem einordnen</b></summary>
<table><tr><td>


Ähnlich wie HDFS ebenfalls CP. HDFS wird zur Datenreplikation genutzt.

</td></tr></table>
</details>
<details><summary><b>Vor- und Nachteile von HBase</b></summary>
<table><tr><td>


Vorteile:
- Random Read und Writes
- für sehr große Datenmengen

Nachteile:
- HBase-Architektur nur für die Datenverwaltung konzipiert
- Auf andere Technologien angewiesen:
    - HDFS zur Replikation/ Speicherung
    - Zookeeper für Servermanagement und Meta Daten
    - Hive/ Pig für Abfragen
    - Single Point of failure. Nach Ausfall des HMasters vergeht eine gewisse Zeit bis ein neuer HMaster aktiv ist
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
<details><summary><b>OLTP (OnLine Transaction Processing)</b></summary>
<table><tr><td>

Echtzeit Datenverarbeitung fürs Tagesgeschäft
- Viele Änderungsoperationen
- Zugriff auf einzelne Datensätze/Objekte
- Zugriff durch Mitarbeiter (Viele Nutzer)
- Zeitkritisch, immer aktuellste Daten

</td></tr></table>
</details>
<details><summary><b>OLAP (OnLine Analytical Processing)</b></summary>
<table><tr><td>

Komplexe Analysen zur Strategieplanung
- Read only
- Betrachtung der Gesamtheit/Aggregation von Daten
- Erkenntnisse über Entwicklung des Unternehmens -> Strategieplanung
- Zugriff durch Analysten (wenige Nutzer)
- Zeit unkritisch, auch historische Daten akzeptabel


</td></tr></table>
</details>
<details><summary><b>Schwächen von relationalen Datenbanken</b></summary>
<table><tr><td>

- Zentraler Ansatz (Großrechner)
- Begrenzte Skalierbarkeit (Nur Scale up, kein Scale out)
- Konsistenz als zentrales Paradigma
- Folge: Satzsperren -> geringerer Datendurchsatz

Aus VL 3 Folie 144

Versuch der Skalierung von RDBMS
- Master-Slave-Ansatz
  - Alle WRITEs gehen an den Master.
  - Gelesen wird von den Replicas/Slaves.
  - Problem: Replicas nicht direkt aktualisiert. READs könnten veraltete Daten lesen
  - Problem: WRITEs nicht skalierbar.  

</td></tr></table>
</details>
<details><summary><b>Multi-Version Concurrency Control (MVCC)</b></summary>
<table><tr><td>

- Optimistische Nebenläufigkeit
- Ähnlich zu einem Versionskontrollsystem
- Schreibzugriffe erzeugen neue Version der Daten
- WRITEs deshalb ohne Sperren
- UPDATEs (in Place) gibt es nicht -> WRITE mit neuer Versionsnummer
- Folge: Hoher Datendurchsatz aufgrund wenigerer Sperren möglich

Funktionsweise 
- Nutzung von Zeitstempeln für Daten und Transaktionen
- Lese- und Schreibzeitstempel je Version
- Anhand der Zeitstempel Ermittlung der neusten Version; ggf. Abort der Schreiboperation

Aus VL 3 Folie 145ff.

</td></tr></table>
</details>
<details><summary><b>Big Data</b></summary>
<table><tr><td>

- 3Vs
  - Volume - herausfordernde Mengen
  - Variety - Verschiedenartigkeit und nur partiell strukturiert
  - Velocity - dynamischer Eingang von Daten und Ereignissen

Aus VL 3 Folie 159

</td></tr></table>
</details>
<details><summary><b>NoSQL (Not only SQL)</b></summary>
<table><tr><td>

NoSQL sind skalierbare Datenbanken, die das Ziel haben, Datenmengen im Terabyte- oder sogar Peta-Bereich zu persistieren.

Schlüsseleigenschaften
- Nicht Relational
- Schema-Frei
- Verteilt und horizontal skalierbar (Scale out)
- Open Source
- Einfach bei Datenreplikation
- Zumeist einfache Programmierschnittstellen
- Verfolgt BASE (eventuell konsistent)

Aus VL 3 Folie 169ff

</td></tr></table>
</details>
<details><summary><b>ACID vs BASE vs CAP</b></summary>
<table><tr><td>

Konzepte von Datenbanken
- ACID
  - Atomarität (Ganze Transaktion erfolgreich oder gar nicht)
  - Konsistenz (DB wird in valid Zustand hinterlassen)
  - Isolation ()
  - Dauerhaftigkeit (Committed = gespeichert, auch bei Stromausfall)
- BASE    
  - Basic Available (Anwendung funktioniert immer, manchmal mit geringerer Konsistenz)
  - Soft State ()
  - Eventual Consistency  (Irgendwann konsistent..)
- CAP
  - Consistency
  - Availability
  - Partition Tolerance
    
Aus VL 3 Folie 17x ff.

</td></tr></table>
</details>
<details><summary><b>Überblick Populäre NoSQL Datenbanken</b></summary>
<table><tr><td>

- Key/Value Speicher
  - Amazon DynamoDB (*)
  - Redis  
- Datei orientiert
  - MongoDB (*)
- Spalten orientiert
  - Google Big Table
  - Cassandra
  - HBase
    
Aus VL 3 Folie 193

</td></tr></table>
</details>
<details><summary><b>Key-Value-Speicher</b></summary>
<table><tr><td>

Aufbau wie eine Hashmap

Funktion
- Speicherung eines Wertes zu einem Schlüssel
- Key meist gehasht
- Schnittstellen: PUT, GET, DELETE
- Scale Out möglich, da Key-Value-Paare auch verschiedenen Rechnern gespeichert werden können.

Ansätze
- Master-Directory
  - Mehrere Nodes speichern die Key-Value-Paare.
  - Master weiß, auf welchem Node welches Paar gespeichert ist.  
  - Zugriff als Recursive Query (Master liefert Value) oder Iterative Query (Master liefert Namen des Nodes)
- Fehlertoleranz
  - Daten werden auf mehreren Nodes gespeichert
- Load Balancing
  - Master überwacht Auslastung und wählt infolgedessen den perfekten Node zum Einfügen



</td></tr></table>
</details>
<details><summary><b>Chord-Ring</b></summary>
<table><tr><td>

- Alternative eines Key-Value-Speichers
- Ermöglicht das Auffinden von Daten in einem verteilten Speicher (Auch bei Hinzunahme/Ausfall einzelner Knoten)

Eigenschaften
- Einfaches Konzept (beweisbare Korrektheit und kalkulierbare Performance)
- Jeder Chord-Knoten benötigt nur Informationen über einen Teil der anderen Knoten
- Lookups werden über Nachrichten mit anderen Knoten gelöst.

Aus VL 4 Folie 230ff.

TODO
- Erklärung
- Übungsaufgabe 


</td></tr></table>
</details>
<details><summary><b>DynamoDB</b></summary>
<table><tr><td>

- Key-Value-Speicher mit PUT & GET
- Verfolgt das Chord-Prinzip zum Auffinden der Knoten
- Replikation zur Verbesserung der Ausfallsicherheit  
- Virtual Nodes zur gleichmäßigeren Bestückung des Chord Rings -> Leistungsfähiger

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
<details><summary><b>HDFS (Dateisystem)</b></summary>
<table><tr><td>

- Open Source Variante des Google File Systems
- Cluster besteht aus aus
  - Namenode: Master eines Namespace im Dateisystem & Zugriffskontrolle
  - Datanode: Bedienen Anfragen (READ, WRITE) auf Basis der Anweisungen des Namenode
- Zentraler Verzeichnisbaum, verteilte Daten  

Aus VL6 Folie 323ff.



TODO
- Eigenschaften
- Konzept

</td></tr></table>
</details>
<details><summary><b>Map & Reduce</b></summary>
<table><tr><td>

- Scaling-out-Ansatz (mehrere Computer bearbeiten Teil der Anfrage)
- Parallele Verarbeitung
- Input Key-Value-Paare & Output Key-ValuePaare
- Signaturen
  - Mapper: `(K1, V1) -> list(K2, V2)`
  - Reducer: `(K2, list(V2)) -> list(K3, V3)`
  - Java Signatur: `void map(K1 key, V1 value, Mapper.Context context) throws IOException, InterruptedException`

TODO
- Besonderheiten 

Beispiel Word Count [see](https://github.com/V3lop5/Hadoop-WordCount/blob/master/src/main/java/MapClass.java)
```java
/**
 * Mapper
 * 
 * Konvertiert die Key-Value-Paare aus den Dateien in eine Liste von Key-Value-Paaren.
 * 
 * Erstellt aus Input (key: long, value: text)
 *      (42, "Hallo Welt")
 *      (43, "Hallo Peter")
 * den Output [(key: text, value: int)]
 *      [("Hallo", 1), ("Welt", 1)]
 *      [("Hallo", 1), ("Peter", 1)]
 */
public class MapClass extends Mapper<LongWritable, Text, Text, IntWritable> {
    
  private final static IntWritable one = new IntWritable(1);
  private Text word = new Text();
  
  public void map( LongWritable key, Text value, Context context) throws IOException, InterruptedException {
    String line = value.toString();
    StringTokenizer itr = new StringTokenizer(line.toLowerCase(Locale.ROOT).replace('.', ' '));
    while (itr.hasMoreTokens()) {
      word.set(itr.nextToken());
      context.write(word, one);
    }
  }
}

/**
 * Reducer
 * 
 * Nimmt Ergebnis des Mappers entgegen. 
 * Zu jedem Key werden alle Values als Liste hinzugefügt.
 * 
 * Erstellt aus der Ausgabe des Mappers/Input (key: text, value: List[int])
 *      ("Hallo", [1, 1])
 *      ("Welt", [1])
 *      ("Peter", [1])
 *      
 * den Output (key: text, value: int)
 *      ("Hallo", 2)
 *      ("Welt", 1)
 *      ("Peter", 1)
 */
public class ReduceClass extends
        Reducer<Text, IntWritable, Text, IntWritable> {
  private IntWritable count = new IntWritable();
  @Override
  protected void reduce(Text key, Iterable<IntWritable> values,
                        Context context) throws IOException, InterruptedException {
    int sum = 0;
    for (IntWritable value : values) {
      sum += value.get();
    }
    count.set(sum);
    context.write(key, count);
  }
}
```

</td></tr></table>
</details>
<details><summary><b>Lokalitätsprinzip</b></summary>
<table><tr><td>

- Zeitliche Lokalität - Was zuletzt gelesen wurde, wird mit hoher Wahrscheinlichkeit erneut benutzt.
- Räumliche Lokalität - Benachbarte Adressbereiche werden angesprochen.

</td></tr></table>
</details>
<details><summary><b>RDD Konzepte (lazy)</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>Yarn Sheduler (Yet Another Resource Negotiator)</b></summary>
<table><tr><td>

- Framework zur Verwaltung von Map-Reduce Tasks im Cluser
- Komponenten
  - Global Resource Manager (RM): Übernahme des Scheduling
  - Per-server Node Manager (NM): Überwachung und Anbindung eines einzelnen Nodes
  - Per-application (job) Application Master (AM): Container zur Kapselung der Kommunikation zwischen RM und NM

Aus VL8 Folie 416

</td></tr></table>
</details>
<details><summary><b>SPARK </b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>PIG (Abfragesprache)</b></summary>
<table><tr><td>

- Vorteile (Datenflussorientierte Scriptsprache)
- Für Programmierer (zum Abruf einzelner Tupel)
TODO

</td></tr></table>
</details>
<details><summary><b>HIVE (Abfragesprache)</b></summary>
<table><tr><td>

- erlaubt SQL Nutzung
- Für Data Analysts
TODO

</td></tr></table>
</details>
<details><summary><b>HBase (Datenbank)</b></summary>
<table><tr><td>

- Basiert auf HDFS & adressiert dessen Nachteile
- Sinnvoll für Random Read/Write
- Versuch einer spaltenorientierten Datenbank
- HBase besteht aus
  - Region Server: Stellt Datenregionen bereit 
  - HBase-Master: Koordinierung der Region Server
  
TODO

</td></tr></table>
</details>
<details><summary><b>Hadoop Framework</b></summary>
<table><tr><td>

- Nutzt HDFS und HBase
- Laufzeitumgebung MapReduce mit verschiedenen Tools HIVE, PIG, Zookeeper
- Open Source Variante der Google-Produkte
- ...


</td></tr></table>
</details>
<details><summary><b>Cassandra Datenbank</b></summary>
<table><tr><td>

- Spaltenbasiert
- Nutzt Chord-Ring

TODO
- Eigenschaften
- Partitioner
- Wie würde man eine Zeitreihen Datenbank anlegen?


</td></tr></table>
</details>
<details><summary><b>MongoDB </b></summary>
<table><tr><td>

TODO
- Dokumente im JSON Format (Je Dokument Key/Value Speicher)


</td></tr></table>
</details>
<details><summary><b>Entscheidungsbaum/DB-Scan</b></summary>
<table><tr><td>

TODO
- Ist damit der Merkle-Tree gemeint? VL4 Folie 279

</td></tr></table>
</details>
<details><summary><b>Clustering</b></summary>
<table><tr><td>

TODO

</td></tr></table>
</details>
<details><summary><b>Sloppy Quorum</b></summary>
<table><tr><td>

- Nicht alle Replicas eines Datensatzes müssen bei Schreibvorgängen aktualisiert werden. Es ist "schlampig"
- Konfiguration über Tupel (N, R, W)
- In Summe gibt es N Knoten (bzw. Replicas, die eine Kopie der Datei gespeichert haben).
- Bei lesendem Zugriff müssen R Knoten antworten, damit Wert als gelesen gilt.
- Bei schreibendem Zugriff müssen W Knoten den Schreibvorgang bestätigen.
- Wenn R+W > N ist Konsistenz erfüllt.
- Vorteil: Einzelne Knoten können temporär ausfallen.

TODO VL4 Folie 270ff.
</td></tr></table>
</details>



Generiert am Tue Jan 25 10:37:13 UTC 2022
