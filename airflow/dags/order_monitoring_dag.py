from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

with DAG(
    dag_id='order_monitoring_dag',
    schedule=timedelta(minutes=5),
    start_date=datetime(2026, 1, 1),
    catchup=False,
) as dag:

    dbt_run = BashOperator(
        task_id='run_dbt_models',
        bash_command='source "/home/jalis/Desktop/dbt/.venv/bin/activate" && cd "/home/jalis/Desktop/dbt/dbt_ecommerce_project" && dbt run'
    )