#' @export
ui_function = function()
{
  shiny::tagList(
    shinyjs::useShinyjs(),
    shiny::actionButton('only_button', 'This button should be disabled')
  )
}

#' @export
ui_static = ui_function()

#' @export
server = shiny::shinyServer(function(input, output, session) {
  
  shiny::observe({ shinyjs::disable('only_button') })
  
})

#' @export
run_with_ui_function = function()
{
  cat("Creating UI and running app...", fill=TRUE)
  shiny::runApp(list(ui=ui_function(), server=server))
}

#' @export
run_with_ui_static = function()
{
  cat("Running app using UI created within the package...", fill=TRUE)
  shiny::runApp(list(ui=ui_static, server=server))
}
