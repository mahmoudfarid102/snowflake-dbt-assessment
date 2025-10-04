{{ config(
    schema='silver',
    materialized='view'
) }}

WITH orders AS (
    SELECT *
    FROM {{ source('sample_data', 'orders') }}
),
customer AS (
    SELECT
        c_custkey,
        c_name
    FROM {{ source('sample_data', 'customer') }}
)

SELECT
    o.o_orderkey,
    o.o_custkey,
    c.c_name AS customer_name,
    o.o_orderstatus,
    o.o_totalprice AS total_price,
    o.o_orderdate,
    EXTRACT(YEAR FROM o.o_orderdate) AS order_year,
    o.o_orderpriority,
    o.o_clerk,
    o.o_shippriority,
    o.o_comment
FROM orders o
LEFT JOIN customer c
    ON o.o_custkey = c.c_custkey
