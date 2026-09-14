## bslib UI prototype ---------------------------------------------------------
## A side-by-side comparison shell for appGH.R. This file deliberately contains
## NO analysis logic: it sources appGH.R to reuse its data preparation and its
## server() function verbatim, then swaps in a Bootstrap 5 UI. Behaviour,
## filtering, plots, map and tooltips are therefore identical to the original.
##
## Run it with:
##   shiny::runApp(shiny::shinyAppFile("app_bslib.R"))
## or open this file in RStudio and use the Run App button.
##
## Compare against the original with:
##   shiny::runApp(shiny::shinyAppFile("appGH.R"))

library(shiny)
library(bslib)

# Sourcing appGH.R defines the data objects, strata_axis(), ui and server().
# Its trailing shinyApp() call only builds an object, it does not launch a server.
# The production file is named app.R in the repository (Shiny's runApp() requires
# that name) and appGH.R in this working folder, so accept whichever is present.
source("appGH.R")

# ---- UI (the only thing this prototype changes) -----------------------------
ui <- page_sidebar(
  title = "Stressor linkages in the Skagerrak, Kattegat, Baltic and North Seas",

  # The map and the alluvial plot are tall fixed-height outputs, so let the page
  # scroll in normal document flow instead of fitting cards to the viewport
  # (fillable = TRUE would clip the plot and create nested scrollbars).
  fillable = FALSE,

  theme = bs_theme(
    version = 5,
    preset  = "shiny",
    primary = "#2166AC"
  ),

  sidebar = sidebar(
    width = 340,
    p(class = "text-muted small mb-0",
      "A non-exhaustive Web of Science literature review of stressor
       relationships acting in the Skagerrak, Kattegat, Baltic and North Seas. For questions and comments please contact griffin.hill@niva.no."),
    selectInput("stressor", "Stressor", stressor.names),
    selectInput("endpoint", "Endpoint", endpoint.names),
    selectInput("mode",     "Plot type", mode.names),
    hr(),
    div(class = "fw-semibold", textOutput("count")),
    hr()
  ),

  card(
    card_header("Study locations"),
    full_screen = TRUE,
    leafletOutput("leaf", height = 460),
    card_footer(class = "text-muted small", "Click a marker for study metadata.")
  ),

  card(
    card_header("Stressor pathways"),
    
    card_body(class = "text-muted medium",
              "Direction of a stressor's action represents whether it it positively or negatively affects the endpoint via the given mechanism. \nFor example, a negative pathway flowing from Eutrophication to Herring via Reproduction/Recruitment signifies a paper that found eutrophication was negatively impacting reproduction and/or recruitment in herring.",
              p(class = "fst-italic",
                "Hover a column node or a flowing pathway for its label and count. Use the expand icon (bottom right) for a fullscreen view.")
    ),
  card_body(full_screen = TRUE,
    # position: relative anchors the absolutely-positioned hover tooltip to the
    # plot's top-left corner, so hover$coords_css needs no layout offsets.
    div(style = "position: relative;",
        plotOutput("plot", height = "700px", hover = hoverOpts(id = "plot_hover")),
        htmlOutput("tooltip")
    )
)
))
shinyApp(ui, server)
