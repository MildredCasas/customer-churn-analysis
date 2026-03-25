USE AdventureWorks2025;

-- =====================================================
-- PROYECTO 1: Customer Churn Intelligence System
-- Análisis RFM para identificar clientes en riesgo
-- Autor: Mildred Casas | AdventureWorks2025
-- Fecha: 2026-03-24
-- =====================================================

WITH rfm_base AS (
-- CTE 1: Calculamos Recency, Frequency y Monetary por cliente
-- Usamos MAX(OrderDate) del dataset como fecha de referencia
    SELECT
        c.CustomerID,
        DATEDIFF(DAY, MAX(soh.OrderDate), 
            (SELECT MAX(OrderDate) FROM Sales.SalesOrderHeader)) AS recency_days,
        COUNT(DISTINCT soh.SalesOrderID)               AS frequency,
        SUM(soh.TotalDue)                              AS monetary
    FROM Sales.Customer c
    JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
    GROUP BY c.CustomerID
),
rfm_scored AS (
-- CTE 2: Asignamos puntaje 1-5 a cada métrica con NTILE
-- Score 1 = peor rendimiento, Score 5 = mejor rendimiento
    SELECT *,
        NTILE(5) OVER (ORDER BY recency_days DESC)  AS r_score,
        NTILE(5) OVER (ORDER BY frequency ASC)      AS f_score,
        NTILE(5) OVER (ORDER BY monetary ASC)       AS m_score
    FROM rfm_base
),
churn_risk AS (
-- CTE 3: Clasificamos cada cliente según su riesgo de churn
-- HIGH RISK: baja recencia + baja frecuencia = señal fuerte de abandono
    SELECT *,
        (r_score + f_score + m_score)               AS total_score,
        CASE
            WHEN r_score <= 2 AND f_score <= 2 THEN 'HIGH RISK'
            WHEN r_score <= 3 AND f_score <= 3 THEN 'MEDIUM RISK'
            ELSE 'LOYAL'
        END                                          AS churn_segment
    FROM rfm_scored
)
-- RESULTADO FINAL: Vista completa por cliente con métricas avanzadas
SELECT
    CustomerID,
    recency_days,
    frequency,
    ROUND(monetary, 2)                                          AS monetary,
    r_score,
    f_score,
    m_score,
    total_score,
    churn_segment,
    -- Comparación vs cliente anterior ordenado por valor (Window Function LAG)
    ROUND(LAG(monetary, 1) OVER (ORDER BY monetary DESC), 2)   AS prev_customer_monetary,
    -- Acumulado de ingresos (muestra concentración de valor en pocos clientes)
    ROUND(SUM(monetary) OVER (
        ORDER BY monetary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 2)  AS cumulative_revenue
FROM churn_risk
ORDER BY total_score ASC, monetary DESC;