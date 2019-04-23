library(shiny)
library(shinyjs)

ui_function = function()
{
  tagList(
    useShinyjs(),
    actionButton('only_button', 'This button should be disabled')
  )
}

ui_static = ui_function()

server = shinyServer(function(input, output, session) {
  
  observe({ disable('only_button') })
  
})

#' @export
run_with_ui_function = function()
{
  runApp(list(ui=ui_function(), server=server))
}

#' @export
run_with_ui_static = function()
{
  runApp(list(ui=ui_static, server=server))
}
