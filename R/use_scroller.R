#' Use Scroller
#'
#' @param animationLength integrer. Lenght of the animation
#' @param easingFunction string. An effect from \href{https://gsgd.co.uk/sandbox/jquery/easing/}{jquery-easing}.
#' @param scrollOffset integrer. scrollOffset
#' @param use_cdn use CDN (by default) or use locally stored files.
#' 
#' @importFrom jsonlite toJSON
#' @importFrom htmltools tags tagList
#' 
#' @examples 
#' 
#' use_scroller()
#' 
#' @export
use_scroller <- function(animationLength = 750, easingFunction = "linear", scrollOffset = 0, use_cdn = TRUE){

  options <- paste0("$(document).ready(function(){
                      AA_CONFIG = {animationLength: ", animationLength,", easingFunction: '", easingFunction,"', scrollOffset:", scrollOffset,"};
                    });")
  
  class(options) <- "json"
  
  tagList(
    html_dependencies_scroller(use_cdn = use_cdn),
    htmltools::tags$script(options)
  )
}

#' scroller dependencies
#' 
#' Get scroller html dependencies.
#' 
#' @param use_cdn use CDN (by default) or use locally stored files.
#' 
#' @importFrom htmltools tagList htmlDependency
#' 
#' @rdname scroller-dependencies
#' 
#' @export

html_dependencies_scroller <- function(use_cdn = TRUE) {
  
  # jquery.arbitrary-anchor.js
  jqueryarbitraryanchor <- htmltools::htmlDependency(
    name = "jqueryarbitraryanchor",
    version = "2.0.0",
    src = "",
    script = "assets/jquery.arbitrary-anchor.js",
    package = "scroller"
  )
  
  # jquery.easing.min.js 1.4.1
  if(use_cdn)
    jqueryeasing <- htmltools::htmlDependency(
      name = "jqueryeasing",
      version = "1.4.1",
      src = c(href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/"),
      stylesheet = "jquery.easing.min.js"
    )
  else 
    jqueryeasing <- htmltools::htmlDependency(
      "jqueryeasing",
      "1.4.1",
      src = "",
      stylesheet = "assets/jquery.easing.min.js",
      package = "scroller"
    )
  
  htmltools::tagList(jqueryeasing, jqueryarbitraryanchor)
}
