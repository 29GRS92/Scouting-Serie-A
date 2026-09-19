# Scouting Serie A. Sistema di similarità tra giocatori

Progetto personale di analisi dati applicata allo scouting calcistico: raccolta di statistiche pubbliche (Sofascore, Serie A, stagione 2025/2026), costruzione di un sistema che calcola, per qualsiasi giocatore, i profili statistici più simili.

Metodo interamente riproducibile su qualsiasi altro campionato, o sui dati interni di un club.

## Contesto

Sono uno studente francese in Business Intelligence, specializzato nell'analisi dati applicata allo sport. Ho sviluppato questo progetto in completa autonomia per dimostrare una competenza concreta, utile allo scouting. Ho scelto la Serie A come dimostrazione, non avendo accesso a dati di campionati più piccoli, ma il metodo si applica esattamente allo stesso modo a qualsiasi altro dataset di giocatori.

## Cosa fa il progetto

1. Raccolta automatizzata delle statistiche di tutti i giocatori che hanno disputato la stagione 2025/2026 di Serie A (339 giocatori selezionati, almeno 900 minuti giocati).
2. Conversione delle statistiche in tassi "per 90 minuti", per confrontare il ritmo di rendimento piuttosto che i totali stagionali.
3. Raggruppamento dei giocatori per ruolo (Attaccante, Centrocampista, Difensore, Portiere), ciascuno con i propri criteri di confronto pertinenti.
4. Calcolo di un punteggio di similarità statistica tra giocatori dello stesso ruolo (similarità coseno), convertito in percentuale di somiglianza.
5. Esportazione verso un database MySQL, consultabile tramite viste SQL pronte all'uso.

## Esempio di risultato

Ricerca dei giocatori più simili a Lautaro Martínez (Inter):

| Giocatore | Squadra | Somiglianza |
|---|---|---|
| Marcus Thuram | Inter | 97,7 % |
| Nikola Krstović | Cagliari | 92,9 % |
| Rafael Leão | AC Milan | 91,6 % |

*(vedi `screenshots/` per altri esempi, per ogni ruolo)*

## Stack tecnico

- **Python** (pandas, scikit-learn, rapidfuzz): raccolta, pulizia, calcolo di similarità
- **cloudscraper**: aggiramento delle protezioni anti-bot per la raccolta di dati pubblici
- **MySQL / phpMyAdmin**: archiviazione e consultazione dei risultati
- **SQL**: viste dedicate per ruolo, join, ordinamento

## Contenuto del repository

- `Scouting_propre.ipynb`: notebook completo, dalla raccolta dei dati fino all'esportazione, commentato riga per riga
- `vues_sql.sql`: query SQL delle viste di consultazione (una per ruolo)
- `screenshots/`: screenshot di risultati concreti in phpMyAdmin

## Limiti attuali e possibili miglioramenti

- La suddivisione per ruolo resta ampia (4 categorie); un terzino offensivo, ad esempio, può risultare classificato tra i centrocampisti a seconda della categorizzazione della fonte dati.
- Il sistema non distingue ancora in modo fine gli stili di gioco all'interno di uno stesso ruolo (es. un'ala tecnica e una prima punta fisica condividono statistiche di volume simili).
- Attualmente limitato alla Serie A; estendibile a qualsiasi campionato o ai dati propri di un club.

## Nota linguistica

Il notebook e i commenti al codice sono scritti in francese, la mia lingua madre. Sono disponibile a tradurli in italiano o in inglese su richiesta.

*Una versione in francese di questo README è disponibile nel file `README_fr.md`.*

## Contatti

[Nome / LinkedIn / email da completare]
