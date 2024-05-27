
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/scroller)](https://CRAN.R-project.org/package=scroller)
[![R-CMD-check](https://github.com/lgnbhl/scroller/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/lgnbhl/scroller/actions/workflows/R-CMD-check.yaml)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Follow-E4405F?style=social&logo=linkedin)](https://www.linkedin.com/in/FelixLuginbuhl)
<!-- badges: end -->

# scroller <img src="man/figures/logo.png" align="right" height="138" />

> Scroll to any object in your Shiny apps

**scroller** allows to scroll to any element on the page in Shiny thanks
to [Arbitrary anchor JS](https://gsgd.co.uk/sandbox/jquery/easing/).

## Installation

Install the package from Github.

``` r
# install.packages("remotes")
remotes::install_github("lgnbhl/scroller")
```

### Shiny

In order to use scroller, you must first call `use_scroller()` in the
apps’ UI.

Then you can add a CSS selector after the hash (#) and it will
automatically be scrolled to. If the selector returns more than 1
element, the first element found will be scrolled to. More information
[here](https://github.com/briangonzalez/jquery.arbitrary-anchor.js#usage).

``` r
library(shiny)
library(tidyverse)
library(ggrepel)
library(scroller)

shinyApp(
  ui = fluidPage(
      align = "center",
      scroller::use_scroller(animationLength = 2000), # add use_scroller() in the UI
      h1("Shiny with scroller"),
      shiny::actionButton(inputId = NULL, label = "Scroll to plot", class = "btn-success") %>%
        shiny::a() %>%
        shiny::tagAppendAttributes(href = "##plot"), # add scroller id CSS 
      shiny::actionButton(inputId = NULL, label = "No scroll to plot", class = "btn-primary") %>%
        shiny::a() %>%
        shiny::tagAppendAttributes(href = "#plot"), # add id CSS 
      HTML(rep("<br/><br/><br/>&darr;<br/>", 20)),
      plotOutput("plot"),
      shiny::actionButton(inputId = NULL, label = "Scroll to top", class = "btn-success") %>%
            shiny::a() %>%
            shiny::tagAppendAttributes(href = "#.btn") # add scroller class reference
    ),
  
  server = function(input, output, session){
    output$plot <- renderPlot({
      ggplot(starwars, aes(mass, height)) + 
        geom_point(aes(color = gender)) +
        geom_label_repel(aes(label = name), size = 3) +
        labs(title = "Star Wars Characters Body Mass Index")
    })
  }
)
```

### Customize it

You can change the animation lenght, the easing function (see
[jquery-easing](https://gsgd.co.uk/sandbox/jquery/easing/) for all
options availables) and the scroll off set.

``` r
scroller::use_scroller(
  animationLength = 1500, 
  easingFunction = "easeOutCirc",
  scrollOffset = 30
  )
```
