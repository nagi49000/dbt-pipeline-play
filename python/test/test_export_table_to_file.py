import duckdb
import pyarrow.parquet
from scripts.populate_db import create_or_insert_into_duckdb
from scripts.export_table_to_file import export_table_to_parquet


def test_export_table_to_arrow(tmp_path):
    db_filename = tmp_path / "duck.db"
    create_or_insert_into_duckdb(7, db_filename)
    parquet_filename = tmp_path / "dump.parquet"
    export_table_to_parquet(db_filename, "raw_random_user", parquet_filename)
    table = pyarrow.parquet.read_table(parquet_filename)
    assert table.num_rows == 7
    assert table.num_columns == 34
