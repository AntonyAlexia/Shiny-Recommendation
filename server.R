server <- function(input, output) {
  
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
        distinct(Book.Title, Book.Author, .keep_all = TRUE)
    }
  })
  
  output$booktable <- renderTable({
    filtered_books()%>%
      select(Book.Title, Book.Author, Year.Of.Publication, Book.Rating) 
  })
  
  observeEvent(input$search_plot, {
    filtered_data <- books_data %>% 
      filter(`Location` == input$location_var) %>% 
      filter(`Book.Rating` >= input$rating_slider) %>% 
      filter(`Year.Of.Publication` >= input$year_slider[1] & `Year.Of.Publication` <= input$year_slider[2])
    
    if (input$select_var == "Book Title") {
      title_data <- filtered_data %>% 
        group_by(`Book.Title`) %>% 
        summarize(mean_rating = mean(`Book.Rating`))
      
      plot <- plot_ly(data = title_data, x = ~`Book.Title`, y = ~mean_rating, type = "bar") %>%
        layout(xaxis = list(title = "Book Title"), yaxis = list(title = "Mean Rating"))
      
      output$plot <- plotly::renderPlotly(plot)
      
    } else if (input$select_var == "Book Author") {
      author_data <- filtered_data %>% 
        group_by(`Book.Author`) %>% 
        summarize(mean_rating = mean(`Book.Rating`))
      
      plot <- plot_ly(data = author_data, x = ~`Book.Author`, y = ~mean_rating, type = "bar") %>%
        layout(xaxis = list(title = "Book Author"), yaxis = list(title = "Mean Rating"))
      
      output$plot <- plotly::renderPlotly(plot)
    }
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
