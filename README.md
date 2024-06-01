# dbt-pipeline-play
Play area for DBT (data build tool)

### set up Python environment

Can create this via conda
```bash
conda env create -f python/environment.yml
conda activate dbt-env
```

### set up duck DB database

Load in some data from https://randomuser.me/ into a duck db database
```bash
python python/scripts/populate_db.py
```

### Initialise DBT

There should already be a defined profile in the `./dbt/` directory. Any dependencies can be installed via
```bash
# in ./deps/
dbt deps
```