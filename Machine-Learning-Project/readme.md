<div style="width:1200px;">

<div style="font-size: 200%;">
Bern Winter School on Machine Leanring, Mürren January 2020
</div>

<div style="font-size:300%; color: DarkBlue; margin-top:1em;">
Oracle Metrics Association Mining
</div>

<div style="font-size: 200%;">
Machine Learning Projekt von Marco Bassi<br/>
16.März 2020
</div>

<div style="margin-top:3em;" />


> ## Das Projekt
>
> Im Anschluss an die <em>Bern Winter School on Machine Learning</em> im Januar 2020 musste noch
> ein Projekt zum Thema durchgeführt und präsentiert werden. Das Thema dieses Projekts ist
> *Association Mining*, angewendet auf die Metriken einer Oracle Datenbank (Oracle RDBMS 11.2
> Enterprise Edition (RAC)).


# Ablage der Daten- und Projektfiles

## Basisverzeichnis

<span style="font-family: Courier; color: DarkBlue;">Machine-Learning-Project</span>


## Datenfiles

Die Datenfiles befinden sich im Unterverzeichnis <span style="font-family: Courier; color: DarkBlue;">
project.1/metriken.2020-03-14/data/prod.dba_hist_sysmetric_summary.2020-02-12-bis-2020-03-14</span>:

- **sysmetrics-summary.dsv**: Werte der Metriken (Zeitreihen); SQL-Statement siehe sysmetrics-summary.sql
- **metrics-meta.dsv**: Metadaten zu den Metriken; SQL-Statement siehe metrics-meta.sql


### sysmetrics-summary.dsv

Die Daten wurden aus der Oracle Systemview DBA_HIST_SYSMETRIC_SUMMARY genommen; siehe Oracle-Dokumentation
https://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4060.htm#I1023452. 
Diese View historisiert zu jeder vollen Stunde die aggregierte Werte (*Snapshot*)der Echtzeit-Messungen.

* SNAP_ID: Identfiziert den Snapshot über allen Datenbankcluster-Instanzen.
* INSTANCE_NUMBER: Identifiziert eine Instanz des Datenbankclusters
* BEGIN_TIME, END_TIME: Beginn und Ende eines Snapshot-Intervals
* INTSIZE: Die Intervalllänge der Metrikmessungen (*nicht der Snapshots*)
* METRIC_ID, GROUP_ID: Identifiziert die Metrik (siehe bei metrics-meta.dsv)
* NUM_INTERVAL: Anzahl Messungen der Metrik im Snapshotintervall
* MINVAL, AVERAGE, MAXVAL, STANDARD_DEVIATION: Minimum, Mittelwert, Maximum und Streuung der Messwerte während des Snapshotintervalls


### metrics-meta.dsv

Diese Datei enthält Metadaten zu den Metriken in sysmetrics-summary.dsv. Die Daten kommen aus den Oracle
Systemviews DBA_HIST_METRIC_NAME und V$METRICGROUP; siehe Oracle-Dokumentation
https://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4011.htm#I1023422 und
https://docs.oracle.com/cd/E11882_01/server.112/e40402/dynviews_2064.htm#I1030335.

* METRIC_ID: Identifiziert zusammen mit der GROUP_ID eine Metrik 
* METRIC_NAME: Der Name der Metrik
* METRIC_UNIT: Die physikalische Einheit der Metrik
* GROUP_ID: Identifiziert zusammen mit der METRIC_ID eine Metrik
* GROUP_NAME: Der Name der Metrikgruppe
* INTERVAL_SIZE: Die Länge eines Messintervalls der Metrik (in hundertstel Sekunden)
* MAX_INTERVAL: Maximale Anzahl Intervalle für die Aggregierung.

Unter dem Verzeichnis <span style="font-family: Courier; color: DarkBlue;">
project.1/metriken.2020-03-14/data</span> befinden sich weitere Verzeichnisse mit Daten. Diese wurden
aber nicht im Rahmen dieses Projekts ausgewertet.


## Analyse

> Die Analyse wird in zwei Schritten vorgenommen. In einem ersten Schritt erfolgt die Datenaufbereitung;
> das Resultat dieses Schritts wird in einem R-Workspace (alle Daten und Variablen) gespeichert. Der
> eigentliche Machine Learning Vorgang (das Association Mining) erfolgt in einem zweiten Schritt, in
> welchem als erstes der gespeicherte R-Workspace importiert wird.

Die Dateien für die Analyse befinden sich im Unterverzeichnis
<span style="font-family: Courier; color: DarkBlue;">
project.1/metriken.2020-03-14/analysis/prod.dba_hist_sysmetric_summary.2020-02-12-bis-2020-03-14/
</span>

* **R.Gui/preparation.sysmetric-summary.RScript**: R-Skript für die Datenaufbereitung, ohne Output
* **R.Gui/preparation.sysmetric-summary.Session.RScript**: Wie oben, aber mit Output
* **R.Gui/association-mining.RScript**: R-Skript für das Association Mining, ohne Output
* **R.Gui/association-mining.Session.RScript**: Wie oben, aber mit Output
* **R.workspaces/sysmetrics-summary.category.RData**: R-Workspace mit dem Resultat (Daten, Variablen) der Datenaufbereitung
* **Report/bassi_oracle_metrics_association_mining.odp**: OpenOffice v4.0 OpenDocument Präsentation der Resultate
* **Report/bassi_oracle_metrics_association_mining.pdf**: PDF-Export des obigen Dokuments

Im Unterverzeichnis **plots** befinden sich diverse Graphiken, die für die Präsentation erstellt wurden.



## Ausführungsumgebung
R version 3.4.4 (2018-03-15) -- "Someone to Lean On"
Copyright (C) 2018 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)


## Directory Tree

<pre style="color: DarkGreen; font-size: 110%; font-weight:500;">
Machine-Learning-Project/
├── deliveries
│   ├── Bassi_oracle_metrics_association_mining.analysis.Session.RScript
│   ├── Bassi_oracle_metrics_association_mining.data_preparation.Session.RScript
│   └── Bassi_oracle_metrics_association_mining.presentation.pdf
├── project.1
│   └── metriken.2020-03-14
│       ├── analysis
│       │   └── prod.dba_hist_sysmetric_summary.2020-02-12-bis-2020-03-14
│       │       ├── plots
│       │       │   ├── image-sampled-plot-H.labeled.png
│       │       │   ├── image-sampled-plot-H.labeled.xcf
│       │       │   ├── image-sampled-plot-H.png
│       │       │   ├── item-frequency-plot-H.png
│       │       │   └── table-scan-H.arules-viz.png
│       │       ├── R.Gui
│       │       │   ├── association-mining.RScript
│       │       │   ├── association-mining.Session.RScript
│       │       │   ├── preparation.sysmetric-summary.RScript
│       │       │   └── preparation.sysmetric-summary.Session.RScript
│       │       ├── R.workspaces
│       │       │   └── sysmetrics-summary.category.RData
│       │       └── Report
│       │           ├── bassi_oracle_metrics_association_mining.odp
│       │           └── bassi_oracle_metrics_association_mining.pdf
│       └── data
│           ├── inte.2020-03-04T0000-bis-2020-03-12T0000
│           │   ├── metrics-frequency.dsv
│           │   ├── metrics-frequency.sql
│           │   ├── metrics-meta.dsv
│           │   ├── metrics-meta.sql
│           │   ├── metrics-values.dsv
│           │   └── metrics-values.sql
│           ├── prod.2020-02-12T0000-bis-2020-03-13T0000
│           │   ├── metrics-frequency.dsv
│           │   ├── metrics-frequency.sql
│           │   ├── metrics-meta.dsv
│           │   ├── metrics-meta.sql
│           │   ├── metrics-values.dsv
│           │   └── metrics-values.sql
│           └── prod.dba_hist_sysmetric_summary.2020-02-12-bis-2020-03-14
│               ├── metrics-meta.dsv
│               ├── metrics-meta.sql
│               ├── sysmetrics-summary.dsv
│               └── sysmetrics-summary.sql
├── readme.md
</pre>
</div>
