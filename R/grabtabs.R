#' elementary app for investigating HPRC workspace content
#' @import shiny
#' @importFrom AnVIL avtable avtables
#' @export
grabtabs = function() {
 # primitive
 # using https://stackoverflow.com/questions/19470426/r-shiny-add-tabpanel-to-tabsetpanel-dynamically-with-the-use-of-renderui
 server = function(input, output, session){
     allta = avtables()$table
     output$mytabs = renderUI({
       myTabs = lapply(allta, function(x) tabPanel(x, dataTableOutput(x)))
       do.call(tabsetPanel, myTabs)
     })
     output[[allta[1]]] = renderDataTable( avtable(allta[1]) )  # clumsy!
     output[[allta[2]]] = renderDataTable( avtable(allta[2]) )
     output[[allta[3]]] = renderDataTable( avtable(allta[3]) )
     output[[allta[4]]] = renderDataTable( avtable(allta[4]) )
     output[[allta[5]]] = renderDataTable( avtable(allta[5]) )
     output[[allta[6]]] = renderDataTable( avtable(allta[6]) )
     output[[allta[7]]] = renderDataTable( avtable(allta[7]) )
   }
 ui = fluidPage(
        sidebarLayout(
         sidebarPanel(
          helpText("tables from workspace"),
          width=3
          ),
         mainPanel(
          uiOutput("mytabs")
          )
         )
        )
runApp(list(ui=ui, server=server))
}
 
 
