library(shinythemes)
library(plotly)
library(shinyjs)


source("global.R")
ui <- fluidPage(
  navbarPage(
    theme = shinytheme("slate"),
    "Mathematician Alexia",
    tabPanel("Book search",
             fluidRow(
               useShinyjs(),
               sidebarLayout(
                 sidebarPanel(
                   radioButtons(inputId = "search_type", label = "Search by:", 
                                choices = c("Book title", "Author"), selected = "Book title"),
                   conditionalPanel(
                     "input.search_type == 'Book title'",
                     selectizeInput(inputId = "title", label = "Enter Book Title", 
                                    choices = NULL, 
                                    selected = NULL
                     )
                   ),
                   conditionalPanel(
                     "input.search_type == 'Author'",
                     selectizeInput(inputId = "author", label = "Select Book Author", 
                                    choices = NULL, 
                                    selected = NULL
                     )
                   ),
                   sliderInput(inputId = "year", label = "Select publication year", 
                               min = 1980, max = 2010, 
                               value = c(1980, 2010)),
                   sliderInput(inputId = "rating", label = "Select minimum rating",
                               min = 0, max = 10, value = 0),
                   actionButton(inputId = "search", label = "Search")
                 ),
                 
                 mainPanel(
                   tableOutput(outputId = "booktable")
                 )
               )
             )
    ),  
    tabPanel("Data Visualization",
             sidebarLayout(
               sidebarPanel(
                 selectizeInput("select_var", label = "Select variable to plot", 
                             choices = c("Book Title", "Book Author")),
                 selectizeInput(inputId = "location_var", label = "Select location", 
                             choices = NULL),
                 sliderInput("rating_slider", label = "Select minimum rating", min = 0, max = 10, value = 0),
                 sliderInput("year_slider", label = "Select year range", min = 1980, max = 2010, value = c(1980, 2010)),
                 actionButton(inputId = "search_plot", label = "Search plot")
               ),
               mainPanel(
                 plotlyOutput("plot"),
                 tags$strong("Description"),
                 ("Greetings from our tab for data visualization! A variety of choices are available in our app for viewing and browsing our book data. Use the Select variable to plot dropdown menu to choose the variable you want to plot. Plotting either the author or the book title is an option. Then, select the desired place from the Select location dropdown option. After that, you can specify the minimum rating for books to be included in the storyline using the Select minimum rating slider. Similarly, you can select a range of years for books to be included in the plot using the Select year range slider. Once your options are in place, all you need to do is click the Search plot button to create a data plot. Using the Plotly visualization package, the plot will be shown on the app's main panel. Our app helps you to acquire deeper insights into the characteristics of the books in our database by offering a variety of alternatives for examining and displaying our book data.")
               )
             )
    
             
   ),
    tabPanel("Statistical Inference",
             sidebarPanel(
               h4("Comparing Average Ratings by Two Groups"),
               selectizeInput(inputId = "group1", label = "Select Author 1",
                           choices = NULL, selected = NULL),
               selectizeInput(inputId = "group2", label = "Select Author 2",
                           choices = NULL, selected = NULL),
               actionButton(inputId = "compare", label = "Compare")
             ),
             mainPanel(
               h4("Test Results"),
               verbatimTextOutput(outputId = "test_result"),
               tags$strong("Description"),
               ("Welcome to our app for book suggestions! Our application is intended to assist you in selecting books to read by applying statistical inference. We specifically examine the mean evaluations of novels produced by various writers using the t-test, a potent statistical inference technique. This app runs a t-test on the average book ratings of the two authors you choose to compare, and it outputs the p-value. This helps you to choose which books to read based on data. You may decide to read works by the author whose rating is greater if, for instance, the t-test reveals a statistically significant difference between the mean ratings of two writers. Alternatively, you can decide to look into the works of both writers if the t-test reveals no significant difference."),
            )
    )
  )
)


