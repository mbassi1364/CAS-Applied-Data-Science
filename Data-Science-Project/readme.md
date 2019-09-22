<div style="width:1200px;">

# Organisation of File Storage

## Main Folder

All project files are placed in a subdirectory of
<span style="font-family: Courier; color: DarkBlue;">
project.1/statistiken.2019-08-22T0000-bis-2019-08-28T1000</span>.


## Subfolders

### about.data

Metadata

### analysis

* Jupyter notebooks and plots
* R workspace image with the cleansed data data.table object, to be imported by
  subsequent analyses.
* An R script, to be used in an RGui environment


### data

Data files

### poster

Poster presentated at the poster session on September 13, 2019.

### report

The conceptual design report for the data science project.

### resources

Data models and data flow diagram for the conceptual design report, produced
with Apache Open Office Draw, OpenOffice version 4.1.5


## Directory Tree

<pre style="color: DarkGreen; font-size: 110%; font-weight:500;">
└── project.1
    └── statistiken.2019-08-22T0000-bis-2019-08-28T1000
        ├── about.data
        │   └── metadata.readme.md
        ├── analysis
        │   ├── notebooks
        │   │   ├── database-load.ipynb
        │   │   ├── data-cleansing.ipynb
        │   │   ├── globalcache-load.ipynb
        │   ├── plots
        │   │   ├── sysstat.cluster_waiting_times.png
        │   │   ├── sysstat.data_block_changes.png
        │   │   ├── sysstat.enqueue_request.png
        │   │   ├── sysstat.execute_count.png
        │   │   ├── sysstat.gc_cr_block_flush_time.png
        │   │   ├── sysstat.gc_cr_block_receive_time.png
        │   │   ├── sysstat.gc_cr_blocks_received.png
        │   │   ├── sysstat.gc_current_block_flush_time.png
        │   │   ├── sysstat.gc_current_block_receive_time.png
        │   │   ├── sysstat.gc_current_blocks_received.png
        │   │   ├── sysstat.gc_local_grants.png
        │   │   ├── sysstat.gc_read_wait_time.png
        │   │   ├── sysstat.gc_read_waits.png
        │   │   ├── sysstat.gc_remote_grants.png
        │   │   ├── sysstat.gcs_messages_sent.png
        │   │   ├── sysstat.glob_enq_gets_sync_async.png
        │   │   ├── sysstat.global_enqueue_get_time.png
        │   │   ├── sysstat.parse_count_total.png
        │   │   └── sysstat.user_calls.png
        │   ├── R.workspaces
        │   │   └── cleansed-data.RData
        │   └── RGui
        │       ├── dba_hist_syssstat-diff.Rscript
        ├── data
        │   ├── dba_hist_sysstat.inte.dsv
        │   └── dba_hist_sysstat.prod.dsv
        ├── poster
        │   ├── poster.odg
        │   ├── poster.pdf
        ├── report
        │   ├── CDR.docx
        │   └── CDR.pdf
        └── resources
            ├── dataflow-diagram.odg
            ├── dataflow-diagram.png
            ├── datamodel-conceptual.odg
            ├── datamodel-conceptual.png
            ├── datamodel-logical.odg
            └── datamodel-logical.png
</pre>



</div>
