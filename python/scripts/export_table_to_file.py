import duckdb
import pyarrow.parquet


def export_table_to_parquet(db_filename: str, tablename: str, output_filename: str):
    with duckdb.connect(str(db_filename)) as con:
        table = con.sql(f"SELECT * FROM {tablename}").arrow()
        pyarrow.parquet.write_table(table, str(output_filename))
