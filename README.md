# snowflake-dbt-assessment
Snowflake Assessment for Maids.cc AI &amp; Tech

Mahmoud Farid

# my_new_project

A dbt project for building analytics layers on top of Snowflake TPCH sample data.

---

## 🚀 1. Project Overview

This dbt project demonstrates a layered data transformation approach:
- **Bronze layer (sources)** → TPCH sample data from Snowflake.
- **Silver layer** → Cleaned and joined staging models.
- **Gold layer** → Aggregated business metrics ready for analysis.

---

## 🧱 2. Environment Setup

### Prerequisites
- A Snowflake account with access to the **SNOWFLAKE_SAMPLE_DATA** database.
- dbt Cloud account (or local dbt installation).

### For dbt Cloud
1. Create a new dbt Cloud project.
2. Configure your **Snowflake connection**:
   - Account: `<your_account>`
   - Role: `ACCOUNTADMIN` (or another role with create privileges)
   - Warehouse: `<your_warehouse>`
   - Database: `DBT_MFARID`
   - Schema: `DBT_MFARID`
3. Link your repository and open the **IDE**.

### For local setup (optional)
```bash
# Install dbt for Snowflake
pip install dbt-snowflake

# Verify installation
dbt --version

# Initialize profile
dbt debug
