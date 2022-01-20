# Cassandra

# was ist Cassandra ?
Eine NoSql-Datenbank die auf der AP Seite einzuordnen ist

# Eigenschaften

- elastisch (wegen Chord-Ring Hinzuhame von weiteren Rechnern möglich, fast linear sklaierbar)
- verteilt (Peer-to-Peer Chord Ring, kein fixer Einstiegspunkt)
- skalierbar
- spaltenorientiert
- Fehlertolerant (Kein Master und Ausfallsicherheit durch Replikation)
- einstellbare Konsistenz (dennoch bleibt es AP)
- kann auch mit kleinen Clustern (1,3,5) Knoten betrieben werden

# Motivation

HBase hat sehr viele Server (zookeeper, HDFS, Data Nodes, etc.) und unter 7 Knoten macht es wenig Sinn. Dazu kommt das es einen Master-Slave Ansatz verfolgt der zum Single-Point-of Failure führen kann (!). Mit dem Chord-Ring, den wir schon in Dynamo-DB kennengelernt haben können wird Cassandra seinen verteilten Ansatz umsetzen.


# Konzepte

- Consisten Hashin
- Vektoruhren
- Gossip Protocol
- Hinted Handoff
- etc 

Sind aus dem Dynamo Paper entnommen

# Datenmodell

- 3 dimensionale "Hast-Table"
- Ein Keyspace beinhaltet Column Families und regelt deren Repilkationsart
- Jede Zeile besitzt einen Key und besteht aus Spalten (Namen müssen nicht vorher festgelegt sein)
- Jede Spalte hat einen Namen und einen value Wert + Timestamp
- optinal: Time to Live (TTL)



# Eselsbrücke
Wenn Dynamo-DB und BigTable's ein Kind hätten, dann wäre es Cassandra ;)

