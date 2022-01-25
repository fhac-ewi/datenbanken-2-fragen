# Definition: Datenbank
Eine Datenbank ist ein integrierter, persistenter Datenbestand einschließlich aller relevanten Informationen über die dargestellte Information (Metadaten), der einer Gruppe von Benutzern zur Verfügung steht und durch eine spezielle Software möglichst redundanzfrei verwaltetet wird.

# Definition: Datenbankmanagementsystem (DBMS)
Ein Datenbankmanagementsystem (DBMS) ist die Gesamtheit aller Programme zur Erzeugung, Verwaltung und Manipulation einer Datenbank.

# Data Warehouse
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

Aufbau
- Star Schema
- Snowflake
- Fact Constellations

Welche Daten kommen da rein?

Besonderheit dieser Daten?

Wie kann das Schema aufgebaut sein?

Welche Operation führt man da durch?

Aus VL1


# OLTP (OnLine Transaction Processing)
Echtzeit Datenverarbeitung fürs Tagesgeschäft
- Viele Änderungsoperationen
- Zugriff auf einzelne Datensätze/Objekte
- Zugriff durch Mitarbeiter (Viele Nutzer)
- Zeitkritisch, immer aktuellste Daten

# OLAP (OnLine Analytical Processing)
Komplexe Analysen zur Strategieplanung
- Read only
- Betrachtung der Gesamtheit/Aggregation von Daten
- Erkenntnisse über Entwicklung des Unternehmens -> Strategieplanung
- Zugriff durch Analysten (wenige Nutzer)
- Zeit unkritisch, auch historische Daten akzeptabel


# Schwächen von relationalen Datenbanken
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

# Multi-Version Concurrency Control (MVCC)
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

# Big Data
- 3Vs
  - Volume - herausfordernde Mengen
  - Variety - Verschiedenartigkeit und nur partiell strukturiert
  - Velocity - dynamischer Eingang von Daten und Ereignissen

Aus VL 3 Folie 159

# NoSQL (Not only SQL)
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

# ACID vs BASE vs CAP
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

# Überblick Populäre NoSQL Datenbanken
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

# Key-Value-Speicher
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



# Chord-Ring
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


# DynamoDB
- Key-Value-Speicher mit PUT & GET
- Verfolgt das Chord-Prinzip zum Auffinden der Knoten
- Replikation zur Verbesserung der Ausfallsicherheit  
- Virtual Nodes zur gleichmäßigeren Bestückung des Chord Rings -> Leistungsfähiger

# Spaltenbasierten bzw. Wide Column Databases (Zusammensetzung der KEy Value Speicher)
- Zu einem Key (Row-Number) mehrere Werte stehen.
- 2 Dimensionen (quasi doppelte HashMap)

# CAP Theorem
TODO

# HDFS (Dateisystem)
- Open Source Variante des Google File Systems
- Cluster besteht aus
  - Namenode: Master eines Namespace im Dateisystem & Zugriffskontrolle
  - Datanode: Bedienen Anfragen (READ, WRITE) auf Basis der Anweisungen des Namenode
- Zentraler Verzeichnisbaum, verteilte Daten  

Aus VL6 Folie 323ff.



TODO
- Eigenschaften
- Konzept

# Map & Reduce
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

# Lokalitätsprinzip
- Zeitliche Lokalität - Was zuletzt gelesen wurde, wird mit hoher Wahrscheinlichkeit erneut benutzt.
- Räumliche Lokalität - Benachbarte Adressbereiche werden angesprochen.


# Yarn Sheduler (Yet Another Resource Negotiator)
- Framework zur Verwaltung von Map-Reduce Tasks im Cluser
- Komponenten
  - Global Resource Manager (RM): Übernahme des Scheduling
  - Per-server Node Manager (NM): Überwachung und Anbindung eines einzelnen Nodes
  - Per-application (job) Application Master (AM): Container zur Kapselung der Kommunikation zwischen RM und NM

Aus VL8 Folie 416


# RDD (Resilient Distributed Dataset) Konzepte (lazy)
- robuster verteilter Datensatz
- RDD-Objekte liegen im Arbeitsspeicher
- RDD-Objekte sind nach Erzeugung unveränderlich

# SPARK 
- Gedacht für Analysen! (Lesender Zugriff)
- Für Batch und Interaktive Anwendungen gedacht
- In Echtzeit Daten als Stream
- Hohe Geschwindigkeit -> Dank Arbeitsspeicher
- Keine persistente Datenspeicherung -> Alles geschieht im Arbeitsspeicher

Aus VL12

# PIG (Abfragesprache für Hadoop)
- Datenflussorientierte Scriptsprache
- Für Programmierer (zum Abruf einzelner Tupel)
- Client für Hadoop
- Alternative zu Map/Reduce
- Ermöglicht Joins
- Operationen
  - LOAD - Laden von Daten
  - FOREACH - Projektion
  - GROUP - Gruppierung
  - DUMP - Ausgabe
  - AVG/MIN/MAX/.. - Aggregationen
  
Aus VL 9 Folie 450ff.

# HIVE (Abfragesprache für Hadoop)
- erlaubt SQL Nutzung
- Für Data Analysts
- Client für Hadoop
- Ermöglicht Abfragen, wie von relationalen Datenbanken bekannt
- Hive Query Language ähnlich zu SQL
- Im Prinzip ein Data Warehouse
  
Aus VL 9 Folie 465ff.

# HBase (Datenbank)
- Idee CP (Consistency & Partition Tolerance)
- Basiert auf HDFS & adressiert dessen Nachteile
- Sinnvoll für Random Read/Write
- Versuch einer spaltenorientierten Datenbank
- HBase besteht aus
  - Region Server: Stellt Datenregionen bereit 
  - HBase-Master: Koordinierung der Region Server
  
TODO

# Hadoop Framework
- Nutzt HDFS und HBase
- Laufzeitumgebung MapReduce mit verschiedenen Tools HIVE, PIG, Zookeeper
- Open Source Variante der Google-Produkte
- ...


# Cassandra Datenbank
- Idee AP (Availability & Partition Tolerance)
- Spaltenbasiert
- Nutzt Chord-Ring
- Kein Master, sondern gleichberechtigte Knoten  
- Deshalb: Skalierbare & fehlertolerante Datenbank
- Consistency für WRITE und READ getrennt einstellbar (Definition, wie viele Replicas abgefragt werden.)
- WRITE often, READ less

TODO
- Eigenschaften

Partitioner:
- Random Partitioner: Die Schlüssel werden gleichmäßig über die Nodes verteilt (wie bei DynamoDB und default in Cassandra)
- Order Perserving Partitioner: berücksichtigt die Ordnung der Schlüssel (gut für Bereichabfragen, kann Lastverteilung unterlaufen)

Replikation:
- Simple Strategy: Replikas im Uhrzeigersinn (wie bei DynamoDB)
- Networkt Topology Strategy: Replikas werden auf anderen Racks oder Datenzentren verteilt 

- Wie würde man eine Zeitreihen Datenbank anlegen?


# MongoDB 
- Positioniert sich zwischen Key-Value-Speichern und RDBMS
- Dokumente im JSON Format (Je Dokument Key/Value Speicher)
- Schemafrei, Skalierbar
- Open Source

Fazit
- Ansatz passt zu REST
- Serialisierte Objekte entsprechen dem Modell der Programmiersprache  
- Nachteil: Hoher Grad an Denormalisierung.
- Folge: Informationen mehrfach gespeichert.

Aus VL12 Folie 735ff.

# Entscheidungsbaum/DB-Scan
TODO

# Clustering
TODO

# Quorum und sloppy Quorum
- Nicht alle Replicas eines Datensatzes müssen bei Schreibvorgängen aktualisiert werden. Es ist "schlampig"
- Konfiguration über Tupel (N, R, W)
- In Summe gibt es N Knoten (bzw. Replicas, die eine Kopie der Datei gespeichert haben).
- Bei lesendem Zugriff müssen R Knoten antworten, damit Wert als gelesen gilt.
- Bei schreibendem Zugriff müssen W Knoten den Schreibvorgang bestätigen.
- Wenn R+W > N ist Konsistenz erfüllt.
- Vorteil: Die Performance steigt

- Problem1: wenn es zu bestimmten Partitionen kommt kann es dazu komme das keine Write/Read Quoren erreicht werden können
- Ausfall von einzelen Knoten kann zum Problem werden. 

Eine Lösung: Sloppy Quorum
- Beim Ausfall von Knoten, können andere ihre Aufgabe übernehmen
- Quorum-Bedingung wird erfüllt, aber wir erlauben Knoten die nicht im besitzt der richtige Information sind
- Hinted Handoff wir angewandt: Kommt der Knoten wieder zurück und bekommt eine Hint vom Vertreter das er wieder seine Rolle als Replika wahrnehmen soll.
- Vorteil: Einzelne Knoten können temporär ausfallen.

TODO VL4 Folie 270ff.