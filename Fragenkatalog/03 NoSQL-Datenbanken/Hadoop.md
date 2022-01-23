# Was ist Hadoop?

- Hadoop umfasst ein Framework was nach Googles BigTable Vorbild reengineered wurde
- Hadoop hat 2 wesentliche Schichten:
    - Das verteilte File System HDFS und die darauf basierende Spaltenbasierte Datenbank HBase
    - Die Laufzeitumgebung Map Reduce mit den Werkzeugen Pig, Hive...
    
# Datenmodell von HDFS

- Write Once, Read Many
- Basis ist die Unterscheidung von NameNodes und DataNodes
  - NameNode ist der Master, der die Metadaten über das Dateisystem speichert (Zugriffsrechte, Data Directory)
  - DataNodes bedienen Rad/ Write Requests der Clients. Die Clients holen sich beim NameNode die Meta Daten und greifen dann direkt auf die DataNodes zu
    - Per Default speichern DataNodes Blöcke von 64 MB und 3 Replikas
    - DataNodes senden einen Blockreport (Info über gespeicherte Blöcke) und einen Hearbeat (noch aktiv Zeichen) an NameNode
        
# HDFS im CAP Theorem einordnen

- HDFS kann als CP System eingeordnet werden
- Durch die Repliken ist es gegen ausfälle abgesichert
- Die Konsistenz ist gegeben, weil HDFS eine Schreiboperation erst bestätigt, wenn N Anzahl an Replikas bei anderen DataNodes bestätigt wurden
- Probem ist die Verfügbarkeit:
    - NameNode ist Single Point of Failure. Wenn der NameNode ausfällt können alle Daten verloren gehen
    
# Vor- und Nachteile von HDFS

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
    
# Was ist HBase?

- HBase läuft on top von einem Hadoop Cluster
- HBase erweitert Hadoop um die random Read/ Write Funktionalität
- Daten können in vorhandene Datensätze eingefügt werden

# Datenmodell von HBase

- HBase ist eine Spaltenorientierte Datenbank die Key/ Value Paare speichert
- Column Families fassen Daten ähnlichen Typs zusammen
- Spalten werden Physisch nah gespeichert
- Dadurch ist die Suche sehr schnell

# Architektur

- Region werden eine Menge von Zeilen zur speicherung zugewiesen
    - HBase Tabellen werden z.B. so aufgeteilt, dass alle Spalten einer ColumnFamily in einer Region gespeichert sind
- N Regions sind einem Region Server zugeteilt, der die Reads/ Writes managed
- Der HMaster ist der Master Node, vergleichbar mit dem NameNode in HDFS
    - Weißt Regions den Region Servern zu
    - Update, Create, delete Tabellen
- Zookeeper koordiniert das gesamte verteilte System
    - Jeder HRegionServer erzeugt einen Eintrag beim Zookeeper, mit dessen Hilfe der HMaster die operativen HRegionServer findet. Diese Einträge werden über einen Heartbeat gepflegt und bei Ausbleiben gelöscht
    - Zookeeper sorgt mittels Heartbeat dafür, dass es immer nur einen aktiven HMaster gibt

# HBase im CAP Theorem einordnen

Ähnlich wie HDFS ebenfalls CP. HDFS wird zur Datenreplikation genutzt.

# Vor- und Nachteile von HBase

Vorteile:
- Random Read und Writes
- für sehr große Datenmengen

Nachteile:
- HBase-Architektur nur für die Datenverwaltung konzipiert
- Auf andere Technologien angewiesen:
    - HDFS zur Replikation/ Speicherung
    - Zookeeper für Servermanagement und Meta Daten
    - Hive/ Pig für Abfragen
