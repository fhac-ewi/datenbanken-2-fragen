# Data Warehouse
TODO
- Eigenschaften
- Welche Daten kommen da rein?
- Besonderheit dieser Daten?
- Wie kann das Schema aufgebaut sein?
- Welche Operation führt man da durch?

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
TODO

# CAP Theorem
TODO

# HDFS (Dateisystem)
- Open Source Variante des Google File Systems
- Cluster besteht aus aus
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

# RDD Konzepte (lazy)
TODO

# Yarn Sheduler (Yet Another Resource Negotiator)
- Framework zur Verwaltung von Map-Reduce Tasks im Cluser
- Komponenten
  - Global Resource Manager (RM): Übernahme des Scheduling
  - Per-server Node Manager (NM): Überwachung und Anbindung eines einzelnen Nodes
  - Per-application (job) Application Master (AM): Container zur Kapselung der Kommunikation zwischen RM und NM

Aus VL8 Folie 416

# SPARK 
TODO

# PIG (Abfragesprache)
- Vorteile (Datenflussorientierte Scriptsprache)
- Für Programmierer (zum Abruf einzelner Tupel)
TODO

# HIVE (Abfragesprache)
- erlaubt SQL Nutzung
- Für Data Analysts
TODO

# HBase (Datenbank)
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
- Spaltenbasiert
- Nutzt Chord-Ring

TODO
- Eigenschaften
- Partitioner
- Wie würde man eine Zeitreihen Datenbank anlegen?


# MongoDB 
TODO
- Dokumente im JSON Format (Je Dokument Key/Value Speicher)


# Entscheidungsbaum/DB-Scan
TODO
- Ist damit der Merkle-Tree gemeint? VL4 Folie 279

# Clustering
TODO

# Sloppy Quorum
- Nicht alle Replicas eines Datensatzes müssen bei Schreibvorgängen aktualisiert werden. Es ist "schlampig"
- Konfiguration über Tupel (N, R, W)
- In Summe gibt es N Knoten (bzw. Replicas, die eine Kopie der Datei gespeichert haben).
- Bei lesendem Zugriff müssen R Knoten antworten, damit Wert als gelesen gilt.
- Bei schreibendem Zugriff müssen W Knoten den Schreibvorgang bestätigen.
- Wenn R+W > N ist Konsistenz erfüllt.
- Vorteil: Einzelne Knoten können temporär ausfallen.

TODO VL4 Folie 270ff.