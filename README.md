# Shiny-Recommendation
This recommendation app  allow the user to search books and Data visualization then this app show the statistical interference to compare two groups using t-test.

ABSTRACT:
The purpose of the application is to provide users with the ability to search and filter a collection of books using several criteria, including the book's title, author, publishing year, and rating. Although the data set utilized in the app is not explicitly stated, it is likely to include details on books including their names, authors, release dates, and ratings.

A table listing the books that satisfy the chosen criteria, a plot of the mean rating of books based on the chosen variable (book title or author), and a p-value from a t-test comparing the ratings of two groups of books are all examples of the intended output for the user side of the app. Through drop-down menus and sliders, the software also enables interactive data selection and filtering for users. Overall, this software offers a fun and intuitive method to explore and examine a collection of books.

This book recommendation software helps users find new and intriguing books to read by utilizing a large dataset of book suggestions from Kaggle. It provides individualized suggestions based on the user's reading tastes and history in addition to user-generated ratings and reviews. The user-friendly, simple layout makes for a pleasurable, stress-free browsing experience. The software also offers customers more insights into the book recommendation dataset through data visualization and statistical inference tools. Users may visually examine the dataset using the data visualization tools, and the statistical inference function uses machine learning methods to forecast the user's reading habits.

```install.packages('shiny')
library(shiny)
shiny::runGitHub("Shiny-Recommendation","AntonyAlexia")
```

Web Link :
### https://bookrecommendationapp.shinyapps.io/shinybookapp/
 
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

Cite :
https://www.kaggle.com/datasets/arashnic/book-recommendation-dataset

Preview Link :
### https://bookrecommendationapp.shinyapps.io/shinybookapp/

Presented By : 
Antony Alexia Sebasthikannu.
