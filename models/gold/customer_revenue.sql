{{ config(
    materialized='table'
) }}

WITH orders AS (
    SELECT o_orderkey, o_custkey
    FROM {{ source('sample_data', 'orders') }}
),
lineitem AS (
    SELECT l_orderkey, l_extendedprice, l_discount
    FROM {{ source('sample_data', 'lineitem') }}
),
customer AS (
    SELECT c_custkey, c_name
    FROM {{ source('sample_data', 'customer') }}
),
order_revenue AS (
    SELECT
        o.o_custkey,
        SUM(li.l_extendedprice * (1 - li.l_discount)) AS revenue
    FROM orders o
    JOIN lineitem li
        ON li.l_orderkey = o.o_orderkey
    GROUP BY o.o_custkey
)

SELECT
    c.c_custkey AS c_custkey,      
    c.c_name AS customer_name,
    orv.revenue AS total_revenue
FROM order_revenue orv
JOIN customer c
    ON c.c_custkey = orv.o_custkey
