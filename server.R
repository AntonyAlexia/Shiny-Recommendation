server <- function(input, output, session) {
  
  filtered_books <- eventReactive(input$search, {
    if (input$search_type == "Book title") {
      books_data %>%
        filter(str_detect(Book.Title, input$title),
               Year.Of.Publication >= input$year[1] & Year.Of.Publication <= input$year[2],
               Book.Rating >= input$rating) %>%
        distinct(Book.Title, Book.Author, .keep_all = TRUE)
    } else {
      books_data %>%
        filter(Book.Author == input$author,
               Year.Of.Publication >= input$year[1] & Year.Of.Publication <= input$year[2],
               Book.Rating >= input$rating) %>%
        distinct(Book.Rating, Book.Author, .keep_all = TRUE)
    }
  })
  
  updateSelectizeInput(session = session, inputId ="title", choices=unique(books_data$Book.Title), selected=unique(books_data$Book.Title), server = TRUE)
  
  onclick("title", {
    updateSelectizeInput(session, "title", selected = "")
  })
  
  updateSelectizeInput(session = session, inputId ="author",choices=unique(books_data$Book.Author),selected=unique(books_data$Book.Author), server = TRUE)
  
  onclick("author", {
    updateSelectizeInput(session, "author", selected = "")
  })
  
  output$booktable <- renderTable({
    filtered_books() %>%
      select(Book.Title, Book.Author, Year.Of.Publication, Book.Rating) 
  })
  
  updateSelectizeInput(session = session, inputId ="location_var", choices=unique(books_data$Location),  server = TRUE)
  
  
  
  observeEvent(input$search_plot, {
    filtered_data <- books_data %>% 
      filter(`Location` == input$location_var) %>% 
      filter(`Book.Rating` >= input$rating_slider) %>% 
      filter(`Year.Of.Publication` >= input$year_slider[1] & `Year.Of.Publication` <= input$year_slider[2])
    
    if (input$select_var == "Book Title") {
      title_data <- filtered_data %>% 
        group_by(`Book.Title`) %>% 
        summarize(mean_rating = mean(`Book.Rating`))
      df2 <- title_data %>% slice(1:10)
     

      plot <- plot_ly(data = df2, x = ~mean_rating, y = ~`Book.Title`, type = "bar") %>%
        layout(xaxis = list(title = "Book Title"), yaxis = list(title = "Mean Rating"))
      
      output$plot <- plotly::renderPlotly(plot)
      
    } else if (input$select_var == "Book Author") {
      author_data <- filtered_data %>% 
        group_by(`Book.Author`) %>% 
        summarize(mean_rating = mean(`Book.Rating`))
      df2 <- author_data %>% slice(1,5)
      plot <- plot_ly(data = df2, x = ~mean_rating, y = ~`Book.Author`, type = "bar") %>%
        layout(xaxis = list(title = "Book Author"), yaxis = list(title = "Mean Rating"))
      
      output$plot <- plotly::renderPlotly(plot)
    }
  })
  
  updateSelectizeInput(session = session, inputId ="group1", choices=unique(books_data$Book.Author), selected=unique(books_data$Book.Author), server = TRUE)
  
  onclick("group1", {
    updateSelectizeInput(session, "group1", selected = "")
  })
  
  updateSelectizeInput(session = session, inputId ="group2",choices=unique(books_data$Book.Author),selected=unique(books_data$Book.Author), server = TRUE)
  
  onclick("group2", {
    updateSelectizeInput(session, "group2", selected = "")
  })
  output$test_result <- renderPrint({
    req(input$compare)

    
    group1_data <- books_data %>% filter(Book.Author == input$group1)
    group2_data <- books_data %>% filter(Book.Author == input$group2)
    
    t_test_result <- t.test(group1_data$Book.Rating, group2_data$Book.Rating)
    paste("The p-value of the t-test is", t_test_result$p.value)
})

  }

shinyApp(ui, server)

