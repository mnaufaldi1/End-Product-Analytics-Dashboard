# Product Analytics Dashboard
An end-to-end product analytics project that transforms raw sales and product data using PostgreSQL, and visualizes key business insights in an interactive Power BI dashboard to support data-driven decision making.

---
## 🎯 Business Objective
Analyze product sales performance across regions, customer segments, and discount strategies to support pricing, sales, and product decisions.

---

## 🗂 Dataset Description
**Main data includes:**
- Product sales
- Product description
- Product discounts

---

## 🛠 Tools
- **SQL (PostgreSQL)** — data cleaning, transformation, and analysis  
- **Power BI** — interactive dashboards & KPI visualization  
- **GitHub** — version control & documentation  

---

## 🔄 Workflow (End-to-End)
1. **Data Preparation (SQL)**
   - Aggregations & KPIs
   - String cleaning and normalization
   - Joins
   - Common Table Expressions (CTE)

```sql
-- Joining product and sales tables using a CTE
WITH cte AS (
    SELECT 
        p.product, 
        p.category, 
        p.brand, 
        p.description,
        p.sale_price, 
        p.cost_price, 
        p.image_url,
        p.sale_price * s.units_sold AS revenue,
        p.cost_price * s.units_sold AS total_cost,
        s.date, 
        s.customer_type, 
        s.discount_band, 
        s.units_sold,
        TRIM(TO_CHAR(s.date, 'Month')) AS month,
        TO_CHAR(s.date, 'YYYY') AS year
    FROM products p
    JOIN sales s
        ON p.product_id = s.product
)

-- Calculating discounted revenue and joining with discount reference table
SELECT 
    *,
    (1 - (discount / 100)) * revenue AS discount_revenue
FROM cte c
JOIN discounts d
    ON LOWER(TRIM(c.discount_band)) = LOWER(TRIM(d.discount_band))
    AND TRIM(c.month) = TRIM(d.month);
```

2. **Visualization (Power BI)**
   - KPI cards
   - Table breakdowns
   - Trend analysis
   - Interactive filters & slicers

---

## 📊 Dashboard Highlights
This interactive dashboard provides insights into:
- Revenue and profit trends (YoY)
- Product performance over time
- Revenue distribution by country and customer type
- Impact of discount bands on revenue
- Units sold and profitability at the product level
![product_analytics_dashboard_page-0001](https://github.com/user-attachments/assets/e36a3125-2ae2-454c-bb2d-9d84a589b8c4)


---

## 🔍 Key Insights
- Government is the largest customer segment across all products
- Sales peak consistently in June and October
- High discount band generates the highest revenue
- Canada contributes the most overall revenue
- MV7 leads year-over-year profit growth, while Audiobox USB 96 Studio delivers the highest absolute profit

--- 

## ✅ Recommendations
- Focus sales and account strategies on government customers
- Leverage seasonal demand by strengthening campaigns and inventory planning around June and October.
- Optimize discount strategies by prioritizing high-performing discount bands
- Prioritize high-profit products (e.g. MV7, Audiobox USB 96 Studio) for pricing optimization and promotion, while review low-performing products for repositioning.
- Deepen market penetration in Canada through targeted campaigns, while exploring growth potential in secondary markets with stable demand.

## 👤 About the Author
**Muhammad Naufaldi**  
Physics graduate with interest in technology, innovation, and data analysis.

### 🌐 Contact
- **LinkedIn:** https://www.linkedin.com/in/muhammad-naufaldi-608517246/
- **Portfolio:** https://linktr.ee/PortofolioNaufaldi

  
