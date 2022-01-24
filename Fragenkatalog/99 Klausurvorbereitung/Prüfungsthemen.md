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

# HDFS
TODO
- Eigenschaften
- Konzept
- HBASE

# Map & Reduce 
TODO
- Besonderheiten 
- Java Signatur aufschreiben
- Welche Parameter würde ein Word Count bekommen? Umschreiben

# Lokalitätsprinzip
TODO

# RDD Konzepte (lazy)
TODO

# Yarn Sheduler (?)
TODO

# SPARK 
TODO

# PIG (Tool)
- Vorteile (Datenflussorientierte Scriptsprache)
TODO

# HIVE (Tool)
- erlaubt SQL Nutzung
TODO

# Cassandra Framework
TODO
- Eigenschaften
- Partitioner
- Wie würde man eine Zeitreihen Datenbank anlegen?

# Hadoop Framework
- Nutzt HDFS und HBase
- Laufzeitumgebung MapReduce mit verschiedenen Tools HIVE, PIG, Zookeeper
- Open Source Variante der Google-Produkte
- ...

# MongoDB
TODO

# Entscheidungsbaum/DB-Scan
TODO

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