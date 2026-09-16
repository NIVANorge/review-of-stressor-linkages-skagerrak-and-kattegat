# Review of Stressor Linkages: Skagerrak and Kattegat

A Shiny app summarizing a Web of Science structured literature review of stressor relationships
acting in the Skagerrak, Kattegat, Baltic, and North Seas. It renders alluvial
stressor -> effect -> endpoint pathways divided into adverse and beneficial impacts alongside an interactive map of study locations.

Live app: https://gghill.shinyapps.io/Review_Stressors_SkagerrakKattegat/

Coming soon as sk-link hosted by [NIVA](niva.no)

## Layout

- `app/app.R` - entry point, the Bootstrap 5 (bslib) UI; sources `appGH.R`
- `app/appGH.R` - data preparation, server logic, and the original fluidPage UI
- `app/review_results_all_030826.csv` - the review dataset
- `dependencies.R` - R packages installed into the Docker image

## Run locally

Install the dependencies once:

```r
install.packages(c(
  "shiny", "bslib", "dplyr", "stringr", "leaflet",
  "fontawesome", "ggplot2", "ggalluvial", "htmltools", "sp"
))
```

Then launch the app straight from GitHub:

```r
shiny::runGitHub(
  repo     = "Review-of-Stressor-Linkages-Skagerrak-and-Kattegat",
  username = "gghill",
  subdir   = "app"
)
```

To run a specific released version, add `ref = "v1.0.0"`.

Or from a local clone:

```r
shiny::runApp("app")
```

With Docker:

```bash
docker compose up --build   # then open http://localhost:3838
```

Questions: please open an issue on this repository.
