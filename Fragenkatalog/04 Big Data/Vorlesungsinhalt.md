# Eigenschaften von Big Data

Charakterisiert durch die 3Vs:
- Volume (meint die Datenmenge)
- Variety (Verschiedenartigkeit, also strukturiert vs. Unstrukturiert)
- Velocity (dynamischer Eingang von Daten, z.B. Netzfrequenzüberwachung)


# Entwicklung 

- Die Menge der Daten wird größer
- 2012 weniger als eine Sekunde braucht Google um ca. 50 Millionen Seiten zur effektive Suche zu indizieren

# Warum gibt es immer mehr Daten?

- Durch Soziale Netzwerke, mobile Endgeräte und das IoT gibt es immer mehr Daten

# Welche Anforderungen hat BigData an eine Datenbank?

- Die vielfältigen Daten (Variety) müssen gespeichert werden, ohne das wir wissen was wir speichern (Text, Bild, Video, etc.)
- Menge der unstrukturierten Daten nimmt exponentiell zu
- hohe skalierbarkeit (scale out) für wachsendes Datenvolumen und variety

# Scale Up vs Scale out
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

# Skalierung in RDBMS

- nur begrenzt möglich
- Verfolgen einen zentralen Ansatz (Großrechner im Zentrum)
- Sperren vermindern den Durchsatz und damit die Verfügbarkeit
- Deshalb ist BigData bzw. skalierung nur schwer möglich in RDBMS

# NoSql
-	Steht für not only SQL
-	Nicht relational
-	Schemafrei
-	Verteilt (Scale out)
-	Open Source
-	Beruht auf dem BASE Prinzip (gegenüber ACID Prinzip der RDBMS):
    - Basic Available
    - Soft State
    - Eventual Consistency

# CAP-Theorem

Steht für Consistency, Availability, Partition Tolerance:
- Consistency: Alle Clients können die selben Daten sehen/lesen
- Availability: Jeder Client kann zu jedem Zeitpunkt lesen und schreiben
- Partition Tolerance: Das DBMS funktioniert obwohl einige Knoten nicht verfügbar sind
