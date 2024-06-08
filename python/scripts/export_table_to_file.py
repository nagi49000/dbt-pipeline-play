import duckdb


def export_table_to_parquet(db_filename: str, tablename: str, output_filename: str):
    with duckdb.connect(str(db_filename)) as con:
        con.sql(f"COPY {tablename} TO '{output_filename}' (FORMAT 'parquet');")
