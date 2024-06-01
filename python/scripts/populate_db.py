import requests
import duckdb
from typing import Generator
from pandas import json_normalize, DataFrame


def get_randomuser_records(n_record: int = 3) -> Generator[dict, None, None]:
    url = "https://randomuser.me/api/"
    for _ in range(n_record):
        resp = requests.get(url)
        if resp.status_code != 200:
            raise RuntimeError(f"GET on {url} with code {resp.status_code}")
        nested_record = resp.json()["results"][0]
        # via a pandas dataframe, flatten the json with subsections marked with a "."
        flat_record = json_normalize(nested_record).to_dict()
        # undo the fact that every value looks like {"0": actual_value}
        flat_record = {k: v[0] for k, v in flat_record.items()}
        yield flat_record


def create_or_insert_into_duckdb(n_record: int, filename: str, tablename="random_user"):
    df = DataFrame.from_dict(get_randomuser_records(n_record))
    with duckdb.connect(str(filename)) as con:
        is_table_existing = "random_user" in con.sql("SHOW TABLES").df()["name"].values
        if is_table_existing:
            con.sql(f"INSERT INTO {tablename} SELECT * FROM df")
        else:
            con.sql(f"CREATE TABLE {tablename} AS SELECT * FROM df")


if __name__ == "__main__":
    print("hola")
