library(shiny)
library(digest)
library(shinyjs)
library(googledrive)

#drive_auth_config(api_key = 'AIzaSyCrZX-K53aXxgETZkEXwwArseQSyHA6vbs')
#drive_auth(reset = TRUE, service_token = 'xb-anonymous-s-4f14bc8cd822.json')
#drive_auth(reset = TRUE, cache = TRUE)
drive_auth(reset = TRUE, 'ttt.rds')

  ui <-  fluidPage(
    useShinyjs(),
    textInput( "stud_id", "Student ID", ""),
    fileInput('memo', 'choose Word file'),
    selectInput("week", "Which week?", c('test', '2', '3')),
    actionButton("submit", "Submit")
  )
  server <- function(input, output, session) {
    # defines how to save the data in the form
    upload <- function() {
m
      upload_name <- paste0(
          #input$week,
          #'/',
          input$stud_id,
          '_',
          as.character(Sys.time())
      )
      
      drive_upload(input$memo$datapath, path = input$week, name = upload_name)
    }
    
    # When the Submit button is clicked, save the form data
    observeEvent(input$submit, {
      upload()
      shinyjs::reset('memo')
    })
    
  }
shinyApp(ui, server)