# Definition: Datenbank
Eine Datenbank ist ein integrierter, persistenter Datenbestand einschließlich aller relevanten Informationen über die dargestellte Information (Metadaten), der einer Gruppe von Benutzern zur Verfügung steht und durch eine spezielle Software möglichst redundanzfrei verwaltetet wird.

# Definition: Datenbankmanagementsystem (DBMS)
Ein Datenbankmanagementsystem (DBMS) ist die Gesamtheit aller Programme zur Erzeugung, Verwaltung und Manipulation einer Datenbank.

# OnLine Transaction Protocol (OLTP)
- Klassische relationale Datenbank ist für Tagesgeschäft (Einkauf, Verkauf, Lagerbestand) 
- Der aktuelle Zustand der Datenbank ist im Vordergrund und wird bearbeitet (OnLine) 
- Viele Änderungs- und Einfüge-Operationen 
- Granularität: einzelne Objekte wichtig 
- Zugriff durch alle möglichen Mitarbeiter. Zugriff eher auf einzelne Tupel 

# OnLine Analytic Processing (OLAP)
- Einzelne Objekte nicht so interessant 
- Dateninhalte historisch 
- Sicht über die Entwicklung des Unternehmens, also evolutionär und integriert 
- Zugriffe: read only durch komplexe Abfragen auf ganze Tabellen 
- Wenige Nutzer wie z.B. Manager 

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

# Data Warehouse vs. klassisch verteilte Datenbank
TODO

# Mögliche Aufbauten von Data Warehouses
- Star Schema
- Snowflake
- Fact Constellations