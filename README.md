# Template Fragenkatalog für Prüfungen

[Link zum Fragenkatalog](./Fragenkatalog.md)

## How to use
1. [Fragen](./Fragenkatalog.md) durchlesen
2. Antwort überlegen
3. Lösung durch Klick auf den Pfeil anzeigen

Falls dir ein Fehler auffällt, kannst du einen Kommentar hinterlassen oder einen Korrekturvorschlag einreichen. (Siehe "How to contribute")

## How to contribute
- In der [Ordnerstruktur](./Fragenkatalog) das jeweilige Thema finden. (Oder per Klick auf die Datei im [Fragenkatalog](./Fragenkatalog.md))
- Entweder in einer bestehenden Markdown-Datei (.md) Fragen ergänzen oder eine neue Markdown-Datei hinzufügen.
- Folgende Syntax für Fragen einhalten:
```markdown
# Was ist 1+1?
Die Antwort ist 2.

# Was sind typische Restriktionen eines Kraftwerks oder Speicher?
Kraftwerk
- Zustände (Aus, An)
- Benötigte Zeit für Zustandswechsel
- Minimal- bzw. Maximalleistung
- Bestimmte Anzahl von Starts

Speicher zusätzlich
- Geschwindigkeit Einspeicherung/Ausspeicherung (minimale/maximale Pumpleistung)
- Rüstzeiten (Umbau von Einspeicherung (Pumpbetrieb) zu Ausspeicherung (Turbinenbetrieb))
```

Der [Fragenkatalog](./Fragenkatalog.md) wird durch das Script [generate.sh](./generate.sh) generiert. Dank der Github Actions passiert das automatisch, sobald Änderungen gepusht werden.
