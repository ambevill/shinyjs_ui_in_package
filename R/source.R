ui_function = function()
{
  shiny::tagList(
    shinyjs::useShinyjs(),
    shiny::actionButton('only_button', 'This button should be disabled')
  )
}

ui_static = ui_function()

server = shiny::shinyServer(function(input, output, session) {
  
  shiny::observe({ shinyjs::disable('only_button') })
  
})

#' @export
run_with_ui_function = function()
{
  shiny::runApp(list(ui=ui_function(), server=server))
}

#' @export
run_with_ui_static = function()
{
  shiny::runApp(list(ui=ui_static, server=server))
}
