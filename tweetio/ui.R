library(shiny)

options(shiny.maxRequestSize = 300 * 1024^2)

shinyUI(fluidPage(
    titlePanel("{tweetio}"),

    sidebarLayout(
        sidebarPanel(
            fileInput(inputId = "file1", label = "Upload File",
                      multiple = FALSE,
                      accept = c(".json", ".jsonl", ".gz", ".zip"))
            ,
            downloadButton(outputId = "dl_file1", 
                           label = "Download")
        )
        ,
        mainPanel(
            useShinyjs(),
            verbatimTextOutput("text")
        )
    )
))
