
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN
status](https://www.r-pkg.org/badges/version/scroller)](https://CRAN.R-project.org/package=aniview)
[![pipeline
status](https://gitlab.com/lgnbhl/scroller/badges/master/pipeline.svg)](https://gitlab.com/lgnbhl/scroller/pipelines)

# scroller <img src="man/figures/logo.png" align="right" />

> Scroll effect to any object in your Shiny apps

The package `scroller` allows to scroll to any element on the page in
Shiny thanks to [Arbitrary anchor
JS](http://arbitrary-anchor.briangonzalez.org/).

## Installation

Install the package from Github.

``` r
# install.packages("remotes")
remotes::install_github("lgnbhl/scroller")
```

### Shiny

In order to use scroller, you must first call `use_scroller()` in the
apps’ UI.

Then you can add a CSS selector after the hash (\#) and it will
automatically be scrolled to. If the selector returns more than 1
element, the first element found will be scrolled to. More information
[here](https://github.com/briangonzalez/jquery.arbitrary-anchor.js#usage).

``` r
library(shiny)
library(ggplot2)
library(scroller)

ui <- function(){
  fluidPage(
    align = "center",
    scroller::use_scroller(), # add use_scroller() in the UI
    h1("Shiny with scroller"),
    a("Direct to plot", type = "button", class = "btn btn-info", href = "#plot"), #plot
    a("Scroll to plot", type = "button", class = "btn btn-danger", href = "##plot"), ##plot
    HTML(rep("<br/><br/><br/>&darr;<br/>", 10)),
    plotOutput("plot"),
    a("Scroll to top", type = "button", class = "btn btn-danger", href = "#.btn") #.btn
  )
}

server <- function(input, output, session){
  output$plot <- renderPlot({
    ggplot(mpg, aes(displ, hwy, colour = class)) + 
      geom_point()
  })
}

shinyApp(ui, server)
```

### Customize it

You can change the animation lenght, the easing function (see
[jquery-easing](http://gsgd.co.uk/sandbox/jquery/easing/) for all
options availables) and the scroll off set.

``` r
scroller::use_scroller(
  animationLength = 1500, 
  easingFunction = "easeOutCirc",
  scrollOffset = 30
  )
```
