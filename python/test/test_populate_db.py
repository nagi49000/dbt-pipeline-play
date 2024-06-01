import duckdb
from scripts.populate_db import get_randomuser_records, create_or_insert_into_duckdb


def test_get_randomuser_records():
    records = list(get_randomuser_records(4))
    assert len(records) == 4
    for record in records:
        assert len(record) == 34


def test_create_or_insert_into_duckdb(tmp_path):
    db_filename = tmp_path / "duck.db"
    create_or_insert_into_duckdb(7, db_filename)
    create_or_insert_into_duckdb(3, db_filename)
    with duckdb.connect(str(db_filename)) as con:
        assert con.sql("SHOW TABLES").df()["name"].values == ["raw_random_user"]
        assert con.sql("SELECT COUNT(*) AS n_row FROM raw_random_user").df()["n_row"].values == [10]
