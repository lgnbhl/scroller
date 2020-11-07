#' Use Scroller
#'
#' @param animationLength integrer. Lenght of the animation
#' @param easingFunction string. An effect from \href{http://gsgd.co.uk/sandbox/jquery/easing/}{jquery-easing}.
#' @param scrollOffset integrer. scrollOffset
#' 
#' @importFrom jsonlite toJSON
#' @importFrom htmltools tags tagList
#' 
#' @examples 
#' 
#' use_scroller()
#' 
#' @export
use_scroller <- function(animationLength = 750, easingFunction = 'linear', scrollOffset = 0){

  options <- paste0("AA_CONFIG = {animationLength: ", animationLength,", easingFunction: '", easingFunction,"', scrollOffset:", scrollOffset,"};")
  class(options) <- "json"
  
  tagList(
    html_dependencies_scroller(),
    htmltools::tags$script(options)
  )
}

html_dependencies_scroller <- function() {
  list(
    htmltools::htmlDependency(
      name = "jquery.arbitrary-anchor",
      version = "1.0",
      package = "scroller",
      src = c(
        file = "",
        url = ""
      ),
    script = "htmlwidgets/jquery.arbitrary-anchor.js-1.0/jquery.arbitrary-anchor.js"
    ),
    htmltools::htmlDependency(
      name = "jquery.easing",
      version = "1.4.1",
      package = "scroller",
      src = c(
        file = "",
        url = ""
      ),
      script = "htmlwidgets/jquery.easing-1.4.1/jquery.easing.min.js"
    )
  )
}
