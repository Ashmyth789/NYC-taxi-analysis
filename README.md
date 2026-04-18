# NYC Yellow Taxi Trip Analysis

An end-to-end Data Analytics project on 3.7M+ real NYC taxi records (January 2026).

## Tools Used
- **Python** — pandas, seaborn, matplotlib (EDA & cleaning)
- **SQL** — SQLite with 7 analytical queries
- **Machine Learning** — Linear Regression + Random Forest (fare prediction)
- **Power BI** — Interactive dashboard with KPIs and slicers

## Key Results
| Model | MAE | R² |
|---|---|---|
| Linear Regression | ~$2.5 | ~0.89 |
| Random Forest | ~$1.8 | ~0.93 |

## Key Findings
- Peak demand is between 6–8 PM on weekdays
- Trip distance is the strongest predictor of fare amount
- Credit card users tip significantly more than cash users

## Project Structure
nyc-taxi-analysis/
├── data/              # Raw parquet file (not uploaded — too large)
├── sql/               # All SQL queries
├── notebooks/         # Jupyter notebook: EDA + ML
├── outputs/
│   ├── charts/        # 7 saved visualizations
│   └── sql_results/   # 7 SQL query result CSVs
├── powerbi/           # Dashboard screenshot
└── README.md

## How to Run
1. Download January 2026 Yellow Taxi data from [TLC Trip Records](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page)
2. Place the `.parquet` file in the `data/` folder
3. Run `notebooks/eda_and_ml.ipynb` top to bottom
4. SQL queries in `sql/analysis_queries.sql` can be run via SQLite

## Dataset
- Source: NYC Taxi & Limousine Commission (TLC)
- Period: January 2026
- Size: 3,724,889 rows × 20 columns