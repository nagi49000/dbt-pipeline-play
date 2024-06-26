# dbt-pipeline-play
Play area for DBT (data build tool)

### Set up Python environment

Can create this via conda
```bash
conda env create -f python/environment.yml
conda activate dbt-env
```

### Set up duck DB database

Load in some data from https://randomuser.me/ into a duck db database
```bash
mkdir -p ./dbt/data
python python/scripts/populate_db.py
```

### Initialise DBT

[What is DBT?](https://docs.getdbt.com/docs/introduction)

There should already be a defined profile in the `./dbt/` directory. Any dependencies can be installed via
```bash
# in ./dbt/
dbt deps
```

### Run DBT

The table builds and tests can be run via
```bash
# in ./dbt/
dbt build
```

The table builds only can be run `dbt run`, and the tests only with `dbt test`.

### Viewing docs

Docs can be auto-generated and viewd in a browser by running
```bash
# in ./dbt/
dbt docs generate
dbt docs serve
```
