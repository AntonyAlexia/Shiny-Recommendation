# Shiny-Recommendation
This recommendation app  allow the user to search books and Data visualization then this app show the statistical interference to compare two groups using t-test.

ABSTRACT:
The purpose of the app is to allow users to search and filter a dataset of books based on various criteria such as book title, author, publication year, and rating. The data set used in the app is not specified, but it can be assumed that it contains information about books such as their titles, authors, publication years, and ratings.

The expected output for the user side of the app includes a table displaying the books that match the selected criteria, a plot showing the mean rating of books based on the selected variable (book title or author), and a p-value from a t-test comparing the ratings of two selected groups of books. The app also allows users to select and filter the data interactively through drop-down menus and sliders. Overall, this app provides an interactive and user-friendly way to explore and analyze a dataset of books.

This book recommendation app utilizes a comprehensive dataset of book recommendations from Kaggle, allowing users to discover new and interesting books to read. It offers personalized recommendations based on the user's reading history and preferences, as well as community-generated ratings and reviews. The interface is user-friendly and intuitive, providing an enjoyable and effortless browsing experience. The app also includes data visualization and statistical inference features that provide users with deeper insights into the book recommendation dataset. The data visualization tools allow users to explore the dataset visually, while the statistical inference feature utilizes machine learning algorithms to make predictions about the user's reading preferences.


install.packages('shiny')
library(shiny)
shiny::runGitHub("Shiny-Recommendation","AntonyAlexia")

Web Link :
###https://bookrecommendationapp.shinyapps.io/shinybookapp/
 
Here are some quick instructions for using the app:

Select the search option; you may look for books by their titles or authors by their names.
In the search box, either the book's title or the author's name.
Using the sliders, choose the minimum book rating and the year range.
Select "Search" from the menu.
A table displaying the results after filtering will be shown.
Choose a place from the drop-down menu to get a plot of the average book rating there.
Choose either "Book Title" or "Book Author" to specify which variable appears on the plot's x-axis.
To run a t-test on the authors' book ratings, choose two from the drop-down choices.
To view the t-test results, click the "Compare" button.
Remark: The data set utilized in the program is given internally, and the user interface does not allow you to modify the data set.


Preview Link :
### https://bookrecommendationapp.shinyapps.io/shinybookapp/

Presented By : 
Antony Alexia Sebasthikannu.
