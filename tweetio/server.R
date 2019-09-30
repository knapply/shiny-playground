library(shiny)

shinyServer(function(input, output) {

    output$dl_file1 <- downloadHandler(
        filename = function() {
            if (!is.null(input$file1)) {
                paste0("tweet-data-", Sys.time(), ".rds")
            }
        }
        ,
        content = function(file) {
            if (!is.null(input$file1)) {
                withCallingHandlers({
                    shinyjs::html("text", "")
                    
                    message("Parsing Tweets...")
                    out1 <- tweetio::read_tweets(input$file1$datapath,
                                                 type = "nested_doc")
                    message("Done!")
                    
                    message(
                    "\nTo Use in R...\n\n\n\nPATH_TO_DOWNLOADED_FILE <- 'PUT FILE PATH HERE'\n\ntweet_data <- readRDS(PATH_TO_DOWNLOADED_FILE)")
                },
                message = function(m) {
                    shinyjs::html(id = "text", html = m$message, add = TRUE)
                })
                
                readr::write_rds(x = out1, path = file, compress = "gz")
            }
        }
    )
})
