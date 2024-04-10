---
layout: lab
num: lab01
ready: true
desc: "Python Classes"
assigned: 2024-04-09 11:00:00.00-7
due: 2024-04-16 23:59:59.59-7
---

In this lab, you'll have the opportunity to practice:

* Defining classes in Python
* Defining methods in Python classes

**Note:** In general, it is always important to work on labs and reading early so you can gain the proper context and utilize our office hours to seek assistance / ask clarifying questions during the week before the deadline, if needed!

It is a good idea to read up on some tools we'll use in this lab before you get started, specifically **Chapter 1.4.2.1 (String Formatting)** and **1.4.6 - 1.4.6.1 (Object Oriented Programming)**.

The main idea for this lab is to write a program that will organize Movies into a Movie list. The program should have the ability to add / remove / search for movies.

# Instructions

We recommend that you organize your lab work for this lab in its own directory, e.g., `lab01`. This way all files for a lab are located in a single folder. Also, this will be easy to import various files into your code using the `import / from` technique shown in lecture.

You will need to create three files (note that the file names are case-sensitive when we import them in Python!):
* `Movie.py` - a file containing a class definition for a Movie object.
* `MovieList.py` - a  file containing a class definition for a MovieList object.
* `testFile.py` - a file with the tests for the class methods.


## `Movie.py` class

The `Movie.py` file will contain the definition of a Movie.

We will define the Movie attributes as follows:

* `title` - `str` that represents the title of the movie. <b>Your program should ensure this field will be stored as a Python title (use `str.title()` method)</b> (yes, you will have `title.title()` in your code :-)).
* `genre` - `str` that represents the genre of the movie. <b>Your program should ensure that this field will be stored in all upper-case characters</b>.
* `year` - `int` that represents the release year of a movie.

You will write a constructor that allows the user to construct a Movie object by passing in values for all of the fields. <b>Your constructor should set these attributes with the value `None` by default</b>.

* `__init__(self, title, genre, year)`

In addition to your constructor, your class definition should also support "setter" methods that can update the state of the Movie objects:

* `set_title(self, title)`
* `set_genre(self, genre)`
* `set_year(self, year)`

Each Movie object should be able to call a method `to_string()` that you will implement, which **returns a `str` with all the movie attributes** EXACTLY as shown (i.e., the string should contain all attributes in the following EXACT format `"Title" (GENRE) - YEAR`):

```python
movie1 = Movie("About time", "Drama", 2013)
print(movie1.to_string())
print() # separate two movies with a newline
movie2 = Movie("eternal sunshine of the spotless mind", "Sci-Fi", 2004)
print(movie2.to_string())
```

**Output:**

```
"About Time" (DRAMA) - 2013
"Eternal Sunshine Of The Spotless Mind" (SCI-FI) - 2004
```

<b>IMPORTANT:</b> The `.to_string()` return value in the example above does **not** contain a newline character (`\n`) at the end.

## Test your code

To ensure that your methods return the correct values of correct types, create a file `testFile.py` to hold the tests for the methods.

Below are potential objects and corresponding assertions that you can include:
```
from Movie import Movie

movie0 = Movie()
assert movie0.title == None
### TODO: write additional asserts for the other methods
### to test the default form of the constructor

movie1 = Movie("About time", "Drama", 2013)
assert movie1.title == "About Time"
### TODO: write additional asserts for the other methods
assert movie1.to_string() == '"About Time" (DRAMA) - 2013'

### TODO: write additional asserts for at least one other movie

```


## MovieList.py

The `MovieList.py` file will contain the definition of a single MovieList object.

An `MovieList` object will contain a dictionary structure where the keys of the dictionary will be a `str` type representing a Movie's genre (all upper-case characters).

The dictionary value will be a list of Movie objects that the MovieList contains. Note that the order of the Movies in the list is based on when the Movie object was inserted into the dictionary structure (most recent Movie inserted will be at the end of the list).

Your code should support the following constructor and methods:

* `__init__(self)` - Constructor that initializes the dictionary structure of the MovieList class. Initially, this dictionary should be empty.

* `add_movie(self, movie)` - Adds a Movie object (`movie`) to the MovieList. The inserted Movie object should be added to the end of the list of existing movies that are of the same genre. You may assume that a movie with the same attributes does not already exist in the MovieList when this method is called.

* `does_movie_exist(self, movie)` - Returns a Boolean `True` if the parameter `movie` (with matching title, genre, year) exists in the MovieList. Returns `False` otherwise.


* `remove_movie(self, movie)` - Removes a Movie object (`movie`) from the MovieList if it exists. Your code will need to check that the provided parameter `movie` object has the same attributes (title, genre, year) as an existing movie in the MovieList, if it is to be removed from the MovieList. 

* `remove_genre(self, genre)` - Removes all movies of a certain genre from the MovieList if it exists. Your code will need to remove the genre entry from the MovieList's dictionary.  Note: the provided `genre` parameter value may be input in either lower / upper case.

* `get_movies_by_genre(self, genre)` - Returns a string of all movies of a certain genre. This string should consist of a collection of strings - one line for each movie. 
   - <b>Since each movie will be in its own line within a single string, a newline character (`\n`) should be inserted between each line (if applicable) EXCEPT at the very last line where no newline character should exist</b>. 
   - The order of the Movies in this string will be dictated by the order of the Movies in the MovieList's list for the Movie's genre. 
   - The Movie `toString()` method should be used when constructing this method's return string. 
   - If no Movies of the specified genre exist in the MovieList, then this method returns an empty string (`""`). 
   -  Note: the `genre` parameter value may be in either lower / upper case.



Given an example MovieList, add the following objects and assertions to your `testFile.py`:

```python

### remember to import the correct module into your testFile.py

movies = MovieList()
movie1 = Movie("La La Land", "Musical", 2016)
movie2 = Movie()
movie3 = Movie("Poor Things", "Thriller", 2023)
movies.add_movie(movie1)
movies.add_movie(movie2)

'''try to create more movie objects and add them in the MovieList, 
you must use assert statements as shown below to test if the movie objects were inserted correctly to the MovieList'''

assert movies.does_movie_exist(movie1) == True
assert movies.does_movie_exist(movie2) == True
assert movies.does_movie_exist(movie3) == False

movies.add_movie(movie3)
assert movies.does_movie_exist(movie1) == True
assert movies.does_movie_exist(movie2) == True
assert movies.does_movie_exist(movie3) == True

movies.remove_movie(movie1)
assert movies.does_movie_exist(movie1) == False
assert movies.does_movie_exist(movie2) == True
assert movies.does_movie_exist(movie3) == True

'''do the same for the other movie objects in the MovieList. 
use the assert statements as shown to check if the movie objects were removed correctly'''

movie1 = Movie("La La Land", "Rom-com", 2016)
movie2 = Movie()
movie3 = Movie("Poor Things", "Thriller", 2023)
movie4 = Movie("About time", "Drama", 2013)
movie5 = Movie("eternal sunshine of the spotless mind", "Rom-com", 2004)

movies = MovieList()
movies.add_movie(movie1)
movies.add_movie(movie2)
movies.add_movie(movie3)
movies.add_movie(movie4)
movies.add_movie(movie5)

assert movies.get_movies_by_genre("Rom-com") == \
'''"La La Land" (ROM-COM) - 2016
"Eternal Sunshine Of The Spotless Mind" (ROM-COM) - 2004'''

assert movies.get_movies_by_genre("Drama") == \
'''"About Time" (DRAMA) - 2013'''
assert movies.get_movies_by_genre("Sci-Fi") == ""

# check that the removal is working correctly
movies.remove_genre("Sci-Fi")
assert movies.get_movies_by_genre("Rom-com") == \
'''"La La Land" (ROM-COM) - 2016
"Eternal Sunshine Of The Spotless Mind" (ROM-COM) - 2004'''
assert movies.get_movies_by_genre("Drama") == \
'''"About Time" (DRAMA) - 2013'''
assert movies.get_movies_by_genre("Sci-Fi") == ""

movies.remove_genre("Rom-com") 
assert movies.get_movies_by_genre("Rom-com") == ""
assert movies.get_movies_by_genre("Drama") == \
'''"About Time" (DRAMA) - 2013'''
assert movies.get_movies_by_genre("Sci-Fi") == ""

movies.remove_genre("Drama")
assert movies.get_movies_by_genre("Rom-com") == ""
assert movies.get_movies_by_genre("Drama") == ""
assert movies.get_movies_by_genre("Sci-Fi") == ""
```


Please make sure that your logic for all the methods in MovieList.py pass the above example assert statements. 
<b>IMPORTANT: You are highly encouraged to test your code locally with additional assert statements before you submit your files to Gradescope - please do not use Gradescope to debug.</b>


## Submission

Once you're done with writing your class definition, submit your `testFile.py`, `Movie.py`, and `MovieList.py` to the `Lab01` assignment on Gradescope. There will be various unit tests Gradescope will run to ensure your code is working correctly based on the specifications given in this lab.

If the tests don't pass, you may get some error message that may or may not be obvious at this point. Don't worry - if the tests didn't pass, take a minute to think about what may have caused the error. Check the Troubleshooting guide below.
If your tests didn't pass and you're still not sure why you're getting the error, feel free to ask your TAs or Learning Assistants.

# Troubleshooting


`ModuleNotFoundError: No module named ...`

Check that you named your file EXACTLY as was specified - remember that Python is case-sensitive.

---

`NoneType has no attribute ...`

Remember that before you can use `.title()` or `.upper()` in your constructor, you need to verify that the parameter is a string instead of `None`. 
Use the `if`/`else` branches to differentiate between these cases.

---

```The autograder failed to execute correctly. Please ensure that your submission is valid. Contact your course staff for help in debugging this issue. Make sure to include a link to this page so that they can help you most effectively.```

This may be because your code contains `print()` statements when submitting to Gradescope. Print statements sometimes confuses the autograder resulting in this message. In general, lab submissions do not require any `print` statements (though it may be helpful to use when debugging). If you see this error, try removing any `print` statements in your code and see if that resolves your issue.

---

`EOF error`

If you are getting an EOF error, check that you are not using `input()` anywhere in your code. Parameters are passed directly into the function call, so there is no need for user input.

