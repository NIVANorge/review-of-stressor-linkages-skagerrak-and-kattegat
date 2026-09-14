# Review of Stressor Linkages: Skagerrak and Kattegat

A Shiny app summarising a Web of Science structured literature review of stressor relationships
acting in the Skagerrak, Kattegat, Baltic, and North Seas. It renders alluvial
stressor -> effect -> endpoint pathways divided into adverse and beneficial impacts alongside an interactive map of study locations.

Live app: https://gghill.shinyapps.io/Review_Stressors_SkagerrakKattegat/

## Layout

- `app/app_bslib.R` - entry point, the Bootstrap 5 (bslib) UI; sources `appGH.R`
- `app/appGH.R` - data preparation, server logic, and the original fluidPage UI
- `app/review_results_all_030826.csv` - the review dataset
- `dependencies.R` - R packages installed into the Docker image

## Run locally

With R:

```r
CMD ["R", "-e", "shiny::runApp(shiny::shinyAppFile('/app/app_bslib.R'), host = '0.0.0.0', port = 3838)"]
```

With Docker:

```bash
docker compose up --build   # then open http://localhost:3838
```

Questions: please open an issue on this repository.
