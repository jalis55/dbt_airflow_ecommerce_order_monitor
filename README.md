# Ecommerce Order Monitor with dbt and Airflow

This project implements an automated pipeline for monitoring ecommerce order statuses using Apache Airflow for orchestration and dbt (data build tool) for data transformation.

## Overview

The pipeline extracts order data, transforms it using dbt models to analyze order status, and ensures data freshness through scheduled Airflow DAGs. The main goal is to provide a reliable monitoring system for ecommerce transactions.

## Project Structure

The repository is organized into two main directories:

- **`airflow/`**: Contains the Airflow Directed Acyclic Graphs (DAGs) and related configurations.
  - `dags/order_monitoring_dag.py`: The primary DAG that schedules and triggers the dbt runs.
- **`dbt/`**: Contains the dbt project source code.
  - `dbt_ecommerce_project/`: The main dbt project directory containing models, seeds, and configurations.
  - `dbt_ecommerce_project/models/marts/order_status.sql`: The final data mart model for order status analysis.

## Prerequisites

Before running the project, ensure you have the following installed:

- Python 3.8 or higher
- [Apache Airflow](https://airflow.apache.org/)
- [dbt Core](https://docs.getdbt.com/docs/core/installation)

## Setup

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd ecommer_order_monitor_with_dbt_airflow
    ```

2.  **Install dependencies:**
    It is recommended to use a virtual environment.
    ```bash
    # For Airflow
    pip install -r airflow/requirements.txt

    # For dbt
    pip install -r dbt/dbt_ecommerce_project/requirements.txt
    ```

3.  **Configure dbt:**
    Ensure your `profiles.yml` is correctly finding the target database. The project includes a `profiles.yml` in `dbt/dbt_ecommerce_project/profiles.yml`. You may need to adapt this or configure your `~/.dbt/profiles.yml` to match the profile name `dbt_ecommerce_project`.

4.  **Configure Airflow:**
    Set up your Airflow home and initialize the database if you haven't already. Point your `dags_folder` in `airflow.cfg` to the `airflow/dags` directory of this project.

## Usage

### Running the Pipeline via Airflow

1.  Start the Airflow scheduler and webserver:
    ```bash
    airflow scheduler
    airflow webserver
    ```

2.  Access the Airflow UI (default: http://localhost:8080).

3.  Enable and trigger the `order_monitoring_dag`.
    - This DAG is scheduled to run every 5 minutes by default.
    - It executes the `dbt run` command within the `dbt_ecommerce_project` environment.

### Running dbt Manually

You can also run dbt commands directly for development and testing:

```bash
cd dbt/dbt_ecommerce_project
dbt run
dbt test
```

## Contributing

1.  Fork the repository.
2.  Create a feature branch.
3.  Commit your changes.
4.  Push to the branch.
5.  Open a Pull Request.
