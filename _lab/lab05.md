---
layout: lab
num: lab05
ready: true
desc: "Ordered Linked Lists"
assigned: 2024-05-07 23:59:59.59-7
due: 2024-05-14 23:59:59.59-7
---

In this lab, you'll have the opportunity to practice:

* Defining classes in Python
* Overloading an operator in a Python class
* Implementing an Ordered Linked List
* Testing your functionality with pytest

**Note: It is important that you start this lab early so you can utilize our office hours to seek assistance / ask clarifying questions during the week before the deadline if needed!**

You will write a program that will organize Book objects into a Book Collection. The Book Collection will be implemented as an Ordered Linked List with a head reference. The implementation in this lab will be different than an Unordered Linked List since you will need to organize the nodes by the Book's author (in lexicographical / alphabetical order). In the event of a tie (several books are written by the same author), the published year will be used to determine the Book object's place in the Ordered Linked List. If the author and year published are the same, then the Book's title (lexicographical / alphabetical order) will be used to determine the Book object's place in the Ordered Linked List.

This lab will require you to define classes for a `Book`, `BookCollection`, and a `BookCollectionNode`, as well as writing your own unit tests to verify the correctness of your implementation.

## Instructions

You will need to create four files:
* `Book.py` - file containing a class definition for a Book object
* `BookCollection.py` - file containing a class definition for a collection of Books that will be implemented as an Ordered Linked List
* `BookCollectionNode.py` - file containing a class definition for a Node in the BookCollection
* `testFile.py` - file containing pytest functions testing the overall correctness of your class definitions

There will be no starter code for this assignment, but rather the class descriptions and required methods are defined in the specification below.

You should organize your lab work in its own directory. This way all files for a lab are located in a single folder. Also, this will be easy to import various files into your code using the `import / from` technique shown in lecture.

## Book.py class

The `Book.py` file will contain the definition of a Book. We will define the Book attributes as follows:

* `title` - str that represents the title of the Book
* `author` - str that represents the author of the Book. This will be in a LastName, FirstName format. You may assume this will always be the case
* `year` - int that represents the year the Book was published

You should write a constructor that allows the user to construct a book object by passing in values for all of the fields. Your constructor should set the `title` and `author` attribues to empty strings (`""`), and the `year` attribute to `None` by default.

* `__init__(self, title, author, year)`

In addition to your constructor, your class definition should also support "getter" methods that can receive the state of the Book object:

* `get_title(self)`
* `get_author(self)`
* `get_year(self)`

You will implement the method

* `get_book_details(self)`

that returns a `str` with all of the Book attributes. The string should contain all attributes in the following EXACT format (**Note: There is no `\n` character at the end of this string**):

```python
b = Book("Ready Player One", "Cline, Ernest", 2011)
print(b.get_book_details())
```

<b>Output</b>

```
Title: Ready Player One, Author: Cline, Ernest, Year: 2011
```

* Lastly, your `Book` class will overload the `>` operator (`__gt__`). This will be used when finding the proper position of a Book in the Ordered Linked List using the specification above. We can compare books using the `>` operator while walking down the list and checking if the inserted book is `>` than a specific Book in the Ordered Linked List.

We reviewed operator overloading in class and the textbook does discuss overloading Python operators. You can also refer to this reference on overloading various operators as well:

[https://www.geeksforgeeks.org/operator-overloading-in-python/](https://www.geeksforgeeks.org/operator-overloading-in-python/)

## BookCollectionNode.py 

The `BookCollectionNode.py` file will define the `BookCollectionNode` class. This will be similar to the Linked List Node implementation done in lecture. You will need to write the following methods:

* `__init__(self, data)` - constructor that will assign the parameter data (a Book object) as part of this node. Each node will also have a next reference associated with it. When constructing a `BookCollectionNode`, the next reference should be `None` by default
* `get_data(self)` - getter method that returns the data (Book object)
* `get_next(self)` - getter method that returns the next `BookCollectionNode` in the Linked List structure
* `set_data(self, newData)` - updates the Node's data with the parameter newData
* `set_next(self, newNext)` - updates the Node's next reference with the newNext parameter (another `BookCollectionNode`)


## BookCollection.py

The `BookCollection.py` file will contain the definition of a collection of Book objects stored in an Ordered Linked List. The BookCollection will manage an Ordered Linked List containing `BookCollectionNode`s.The `BookCollection` class will be responsible for maintaining the overall structure of the Ordered Linked List. Your `BookCollection` class will need to support the following methods:

* `__init__(self)` - constructor that will have a head reference that references the first node in the Ordered Linked List. This should be set to `None` by default
.
* `is_empty(self)` - method that returns True (boolean) if the BookCollection is empty, and returns False otherwise

* `get_number_of_books(self)` - method that returns the total number of Books (int) in the BookCollection

* `insert_book(self, book)` - method that inserts a Book in the appropriate place. As mentioned before, all Books in the BookCollection are ordered based on 1) the Book's author (alphabetical / lexicographical order), then 2) the Book's year of publication, and then 3) the Book's title (alphabetical / lexicographical order). Here is where we can utilize the Book's `>` operator. You'll need to use some logic to replace the references for the BookCollectionNodes when inserting the Book in the appropriate place. **Note that the comparison of the strings should be case insensitive ('a' == 'A')**

* `get_books_by_author(self, author)` - method that returns a str containing all of the Book details by a specified author. **Note that each book will be in its own line (each line ending with a `\n` character)**. Also note that the input parameter (`author`) may be in a different case than the case of the author that the book was constructed with - in this situation, the comparison of the authors' names should be case insensitive ('a' == 'A'). An example (with correct order) is shown below:

```python
b0 = Book("Cujo", "King, Stephen", 1981)
b1 = Book("The Shining", "King, Stephen", 1977)
b2 = Book("Ready Player One", "Cline, Ernest", 2011)
b3 = Book("Rage", "King, Stephen", 1977)

bc = BookCollection()
bc.insert_book(b0)
bc.insert_book(b1)
bc.insert_book(b2)
bc.insert_book(b3)
print(bc.get_books_by_author("KING, Stephen"))
```

<b> Output: </b>

```
Title: Rage, Author: King, Stephen, Year: 1977
Title: The Shining, Author: King, Stephen, Year: 1977
Title: Cujo, Author: King, Stephen, Year: 1981

```

* `get_all_books_in_collection(self)` - method that returns a `str` containing the details of all Books in the BookCollection. **Note that each book will be in its own line (each line ending with a `\n` character)**. An example (with correct order) is shown below:

```python
b0 = Book("Cujo", "King, Stephen", 1981)
b1 = Book("The Shining", "King, Stephen", 1977)
b2 = Book("Ready Player One", "Cline, Ernest", 2011)
b3 = Book("Rage", "King, Stephen", 1977)

bc = BookCollection()
bc.insert_book(b0)
bc.insert_book(b1)
bc.insert_book(b2)
bc.insert_book(b3)
print(bc.get_all_books_in_collection())
```

<b> Output: </b>

```
Title: Ready Player One, Author: Cline, Ernest, Year: 2011
Title: Rage, Author: King, Stephen, Year: 1977
Title: The Shining, Author: King, Stephen, Year: 1977
Title: Cujo, Author: King, Stephen, Year: 1981

```

* `remove_author(self, author)` - method that removes all Books written by a specified author. Since this is an Ordered Linked List, all Books written by a specific author should be located right next to each other in the Book Collection assuming your `insert_book` method has been implemented correctly. **Note:** the input parameter (`author`) may be in a different case than the case of the author that the book was constructed with - your solution must account for these situations.

* `recursive_search_title(self, title, bookNode)` - method that searches the `BookCollection` for a specific Book title passed in the method. **Note: this method must be done recursively.** This method will return `True` if a Book in the BookCollection has the same title as the parameter `title` (str), and return `False` otherwise.
	* Since this solution is recursive, this method will take in a reference to a `BookCollectionNode` object (`bookNode`) in the `BookCollection` that needs to be searched.
	* The initial call to `recursive_search_title` would pass in the head of the `BookCollection` since that's the starting point to search through the entire `BookCollection`. For example:

	```python
	b0 = Book("Cujo", "King, Stephen", 1981)
	b1 = Book("The Shining", "King, Stephen", 1977)
	b2 = Book("Ready Player One", "Cline, Ernest", 2011)
	bc = BookCollection()
	bc.insert_book(b0)
	bc.insert_book(b1)
	bc.insert_book(b2)
	assert bc.recursive_search_title("CUJO", bc.head) == True
	bc.remove_author("King, Stephen")
	assert bc.recursive_search_title("CUJO", bc.head) == False
	assert bc.recursive_search_title("Twilight", bc.head) == False
	```

	* You can then recursively search through the `BookCollection` sub parts by recursively referring to the next `BookCollectionNode` in `BookCollection` that needs to be searched if the Book in `bookNode` does not have the title we're looking for.
	* **Note:** the input parameter `title` may be in a different case than the case of the title that the Book was constructed with - your solution must account for these situations (see assert statement above).

## testFile.py pytest

This file should import your `Book`, `BookCollection`, and `BookCollectionNode` classes so you can write unit tests using pytest to test your functionality is correct. Think of various scenarios and edge cases when testing your code. Write your tests first in order to check the correctness of the `Book`, `BookCollection` and `BookCollectionNode` methods. Gradescope requires `testfile.py` to be submitted before running any autograded tests. You should write at least one test for each method in each of these classes and ensure your test cases are covering all branches of the code effectively (but more tests can help you debug various cases!).

## Submission

Once you're done with writing your class definitions and tests, submit your `Book.py` and `BookCollection.py` `BookCollectionNode.py`, and `testFile.py` files to the `Lab05` assignment on Gradescope. Remember to remove any `print` statements in your code since this may confuse the autograder. There will be various unit tests Gradescope will run to ensure your code is working correctly based on the specifications given in this lab.

If the tests don't pass, you may get some error message that may or may not be obvious. Don't worry - if the tests didn't pass, take a minute to think about what may have caused the error, and try writing more comprehensive tests for various cases. If your tests didn't pass and you're still not sure why you're getting the error, feel free to ask your TAs or Learning Assistants.


## Troubleshooting

* Ensure the `head` is set to None to start with an empty list properly.

* Verify that new nodes link correctly during insertion at any position (front, middle, end).

* Double-check the `__gt__` method in Book class for correct author, year, and title comparisons.

* Avoid infinite loops by ensuring loop exit conditions are correct.

* Ensure case-insensitive comparisons for author names; test removals thoroughly to confirm all books by a specific author are removed, including consecutive ones.

* If you get the error `Incorrect logic for get_books_by_author method after adding a single book with author ...` make sure that you correctly implemented the method that the error is alerting you about.
