---
layout: lab
num: lab02
ready: true
desc: "Tea Shop"
assigned: 2024-04-16 11:00:00.00-7
due: 2024-04-23 23:59:00.00-7:00
---

# Table of Contents
* [Learning Goals](#goals)
* Testing your code
    * [Step 1: Installing pytest](#step1)
    * [Step 2: Create `testFile.py`](#step2)
    * [Step 3: run `testFile.py` using `pytest`](#step3)
        * Step 3.1: Navigating to the correct folder on the command Line
        * Step 3.2: Executing `testFile.py`
    * [Step 4: understand pytest output messages](#step4)
* [Lab Instructions](#overview)
    * [`Drink` class](#drinkclass)
        * Template for the `Drink` and `TestDrink` classes
        * Write tests for the `TestDrink` class
    * [`Tea` class](#teaclass)
    * [`Juice` class](#juiceclass)
    * [`DrinkOrder` class](#drinkorderclass)
        * [Testing `DrinkOrder`](#testingdrinkorder)
* [Testing your code](#testingcode)
    * `testFile.py` pytests
* [Submission](#submission)
* [Troubleshooting](#troubleshooting)
    * [Interpreting the autograder output on Gradescope](#grs)

<a href="#" id="goals"></a>
# Learning Goals 

In this lab, we'll utilize inheritance functionality and define various Drink objects and its properties. You'll have the opportunity to practice:

* Defining a base class and creating an inheritance hierarchy
* Defining derived classes and inheriting data and reusing functionality from a base class
* Overriding inherited methods from the parent class in the derived classes
* Installing pytest and unit testing your code

> Note: In general, it is always important to work on labs and reading early so you can gain the proper context and utilize our office hours to seek assistance / ask clarifying questions during the weekdays before the deadline if needed!

It may be a good idea to read up on some concepts we'll be using in this lab before you get started, specifically **Chapter 1.4.6.2 (Inheritance)**.

---

# Testing your code

<a href="#" id="step1"></a>
## Step 1: Installing pytest

For this step, you will need to use the Terminal (on MacOS). See the link below for the installation instructions for Windows.

Pytest will need to be installed on your computer since it does not come with Python by default. Some links for you to use when installing pytest are:
* Installation Guide: <https://docs.pytest.org/en/stable/getting-started.html>
	* Note: on MacOS running Python3, in the Terminal, try using **pip3** instead of **pip** if your installation is not working.
    * If you are running into an error about pip upgrade, remember that you might need to use the **pip3** to do that: `pip3 install --upgrade pip`

* Windows Installation Guide (created by previous Learning Assistants): [Python and Pytest Installation Guide for Windows](https://drive.google.com/file/d/1nPCwIA8cBAkiJ-kOKZFjkOskD94jmWYn/view)
	* **IMPORTANT**: when installing Python, make sure to select the checkbox to `Add Python 3.x to PATH`!
  	* If you have installed Python on your windows machine already without selecting `Add Python 3.x to PATH`, the easiest thing to do is uninstall / reinstall Python and be sure to select this box. 


<a href="#" id="step2"></a>
## Step 2: Create `testFile.py`

In your lab02 folder, create a file that will contain the tests for the classes from this lab and their corresponding methods.

Following the Test-Driven Development (TDD), for every class that you'll write in its own file, you will create a corresonding **Test class** in the `testFile.py`. Each Test class will contain `test_` functions for the corresponding methods of that class (see examples below).

Your testFile will have 2 parts: 
1. the `import` statements at the top of the file (one for each class; `from [filename] import [classname]` substituting the correct filename and classname)
2. the Test classes with their functions.

At the moment, your `testFile.py` should be empty, saved in the lab02 folder where you will create the files for the class definitions for this lab.

Your next task is to locate this lab02 folder using the Terminal (on MacOS) or Command Prompt (on Windows). 
These two programs give us access to **command line** - an interface that allows us to run commands that interact with the operating system (OS).


<a href="#" id="step3"></a>
## Step 3: run `testFile.py` using `pytest`

There are 2 things you need to do to run a testFile: navigation and execution.


### Step 3.1: Navigating to the correct folder on the command Line

In order to run your pytests, you can navigate to your folder where your lab02 code is located using the command line interface.

If you are familiar with the Unix `cd` command: open the command line and `cd` to the lab folder.

If you are not familiar with the `cd` command:
* If you are using macOS: 
  - copy the path to the **folder** that contains `testFile.py` (holding the ALT key as shown here: <https://apple.stackexchange.com/questions/317992/is-there-any-way-to-get-the-path-of-a-folder-in-macos>)
  - open the command line (the Terminal program)
  - type `cd`, type a space, and then paste the path that you copied. 
    - For example, your command could look like `cd /Users/YKK/Documents/cs9/lab02`
    - If any folder name in this path includes spaces (e.g., "CS 9" instead of "CS9"), then make sure to add quotation marks around it (e.g., `cd "/Users/YKK/Documents/CS 9/lab 02"`)
    - If you copied the pathname to the `testFile.py` file (instead of its folder), then just delete that file name, leaving the rest of the path
  - press enter/return on the keyboard to run this command
* If you are using Windows: [Windows 10 How to Open Command Prompt in Current Folder or Directory](https://www.youtube.com/watch?v=bgSSJQolR0E) (a 1min YouTube video)


### Step 3.2: Executing `testFile.py`

Execution:
After you open the terminal and navigate to the lab folder following the steps above, type the following command to run `testFile.py` using pytest.

On Mac:

```
python3 -m pytest testFile.py
```

On Windows:

```
python -m pytest testFile.py
```

If you see something like this, congratulations! You successfully installed and ran pytest.
```
=================== test session starts ====================
platform darwin -- Python 3.8.0, pytest-5.3.1, py-1.8.0, pluggy-0.13.1
rootdir: THE FOLDER YOU COPIED
collected 0 items

================== no tests ran in 0.01s ===================
```

* If you run into any difficulties when installing / running pytest, and/or have any questions about testing your code, we will be happy to help you out during our office / lab hours!

<a href="#" id="step4"></a>
## Step 4: understand pytest output messages

See Step 4 in the [Step-by-step instructions for using pytest for this lab](https://docs.google.com/document/d/e/2PACX-1vTbIEpAAAYTNv-zOMx5EP5bdbw-89na8jDUlQ45DBI8q8woNr41ho_DD6a9GPJlSB1SNUpjKrLlRTGK/pub) (some of them are included below as well).



---

<a href="#" id="overview"></a>
# Lab Instructions

In this lab, we will create a `Drink` base class as well as defining specific classes for a couple types of Drinks (`Tea` and `Juice`). The `DrinkOrder` class will organize Drinks and will provide a summary of a specific drink order.

In addition to defining classes for various Drinks and a Drink Order, you will test your code for correctness by unit testing various scenarios using `pytest`.

You will need to create five files:
* `Drink.py` - file containing a class definition with attributes all Drinks have.
* `Tea.py` - file containing a class definition of a tea beverage that inherits from the `Drink` class.
* `Juice.py` - file containing a class definition of a juice beverage that inherits from the `Drink` class.
* `DrinkOrder.py` - file containing a class definition of a customer's drink order containing various beverages.
* `testFile.py` - file containing `pytest` functions testing the `Drink`, `Tea`, `Juice`, and `DrinkOrder` classes.

To help you organize your code and use it for reference in the future labs, we will provide you with a template code for the `Drink` class, so that you can model the other classes accordingly.

For testing, you will create the `TestDrink` class in the `testFile.py`, so that you can write the tests as you are implementing the class and its methods.


<a href="#" id="drinkclass"></a>
## `Drink` class

The `Drink.py` file will contain the class definition of a general beverage.

We will define this class' attributes as follows:

* `size` - a `str` that represents the size of the beverage (`'small'`, `'medium'`, `'large'`).
* `price` - positive `float` that represents the price of the beverage.

You should write a constructor that passes in values for all the fields. You may assume calls to the constructor will always contain a non-empty `str` representing the beverage's size and a positive `float` representing the beverage's price.

* `__init__(self, size, price)`

In addition to your constructor, your class definition should also support "setter" and "getter" methods that can update and retrieve the state of the Drink objects:

* `get_size(self)` - returns the size of the beverage
* `get_price(self)` - returns the price of the beverage
* `update_size(self, new_size)` - updates the size of the beverage
* `update_price(self, new_price)` - updates the price of the beverage

Each Drink object should be able to call a method `info(self)` that you will implement, which **returns** a `str` with the current beverage's size and price. Since there are many beverages, the following output represents what will be returned if we call the `info` method after constructing a `Drink` object:

```python
bev1 = Drink('medium', 20.5)
print(bev1.info())
```

<b>Output:</b>

```
medium: $20.50
```

<b>Note:</b> The `bev1.info()` return value in the example above does not contain a newline character (`\n`) at the end.

**Note:** The quotation marks around the **returned string** in IDLE tell us that the value was returned, _not_ printed, hence the string representation is shown.

<b>Hint:</b> Note that the return string should contain a price with two decimal places (as traditionally used when displaying prices). Use the f-string to show the floating point values with 2 decimal places. For example:

```
>>> price = 5
>>> f"${price:.2f}"
'$5.00'
```

### Template for the `Drink` and `TestDrink` classes

Below is the skeleton template for the `Drink` class that you can use as a starting point for your `Drink.py` file:

```python
class Drink:
    def __init__(self):
        pass

    def get_size(self):
        pass

    def get_price(self):
        pass

    def update_size(self):
        pass

    def update_price(self):
        pass

    def info(self):
        pass
```

Immediately, we can add the corresponding test class and its testing methods to the `testFile.py` like so:

```python
from Drink import Drink

class TestDrink:
    def test_init(self):
        pass

    def test_get_size(self):
        pass

    def test_get_price(self):
        pass

    def test_update_size(self):
        pass

    def test_update_price(self):
        pass

    def test_info(self):
        pass
```

The way the `TestDrink` template was created:
- copy the stubs for the Drink class directly
- add the corresponding `import` statement at the top of the file
- change the name of the class from `Drink` to `TestDrink`
- change the `__init__` method to be `test_init`
- prepend `test_` to all the other methods

### Write tests for the `TestDrink` class

Now, inside each test function in `testFile.py`, we test each class’s methods using `assert` statements. 
- If the method has a return value, directly assert the return value to verify its correctness; 
- if the method doesn’t have a return value, combine it with another method that has a return value to do the testing.

For example, we can use the example that we saw above, to create a sample Drink object and test that it was correctly created:

```py

from Drink import Drink

class TestDrink:
    def test_init(self):
        drink = Drink('medium', 20.5)
        assert drink.size == 'medium'
        assert drink.price == 20.5
```

Continue in this way to test the rest of the methods of the class:

```py
    def test_get_size(self):
        drink = Drink('large', 20.95)
        assert drink.get_size() == 'large'
```

Before submitting your code to Gradescope, run your `testFile.py` using pytest to verify that all your tests are correct and are passing.

---

You are now ready to implement the rest of the classes and add their tests to `testFile.py`.

<a href="#" id="teaclass"></a>
## `Tea` class

The `Tea.py` file will contain the class definition of a tea drink. Since a tea **IS-A** drink, it should inherit the values we defined in the `Drink` class.

**HINT: Think of the `super` keyword discussed in the lecture**

Your `Tea` class definition should support the following constructor and method:

* `__init__(self, size, price, style)` - constructor that extends the parent class' (`Drink`) constructor and sets the style of tea (for example, Camomile, Mint, English Breakfast, etc.) as an attribute to the `Tea` class. 
  - Note, you may assume the `style` parameter is a `str`. 
  - In order to avoid code duplication, **you must explicitly utilize the base class' constructor to set the size and price attributes.**
* `info(self)` - method should override the inherited `info()` method in the `Drink` class, and returns a `str` with the properties of a `Tea` object. 
  - In order to avoid code duplication, **you must explicitly utilize the base class' `info()` method to construct the `Tea` object's information**. 
  - An example of what the return string format of the `info()` method is shown below:

```
>>> drink1 = Tea('small', 3.0, "Camomile")
>>> drink1.info()
'Camomile Tea, small: $3.00'
```

<b>Note:</b> The `drink1.info()` return value in the example above does not contain a newline character (`\n`) at the end.

**Note:** The quotation marks around the **returned string** in IDLE tell us that the value was returned, _not_ printed, hence the string representation is shown.

---

<a href="#" id="juiceclass"></a>
## `Juice` class

The `Juice.py` file will contain the class definition of what a juice drink will have. Since a juice **IS-A** drink, it should inherit the values we defined in the `Drink` class.

Your `Juice` class definition should support the following constructor and method:

* `__init__(self, size, price, ingredients)` - constructor that extends the parent class' (`Drink`) constructor and sets a list of ingredients used in this juice object. 
  - Note, you may assume the `ingredients` parameter is a list of strings representing the types of ingredients (for example, `"tomato"`, `"orange"`, `"blueberry"`, `"guava"`, etc.) used in the juice. 
  - In order to avoid code duplication, **you must explicitly utilize the base class' constructor to set the size and price attributes.**
* `info(self)` - method that overrides the inherited `info` method in the `Drink` class, and returns a `str` with the properties of a `Juice` object.  - In order to avoid code duplication, **you must explicitly utilize the bass class `info()` method to construct the `Juice` object's information.** 
  - An example of what the return string format of the `info` method is shown below:

```
>>> juice1 = Juice('large', 8.5, ["Apple", "Guava"])
>>> juice1.info()
'Apple/Guava Juice, large: $8.50'
```

<b>Note:</b> The `juice.info()` **return value** in the example above does not contain a newline character (`\n`) at the end. 

**Note:** The quotation marks around the **returned string** in IDLE tell us that the value was returned, _not_ printed, hence the string representation is shown.

---

<a href="#" id="drinkorderclass"></a>
## `DrinkOrder` class

The `DrinkOrder.py` file will contain the class definition of what a customer's drink order will contain, along with the total price of all beverages in the drink order.

Your `DrinkOrder` class definition should support the following constructor and methods:

* `__init__(self)` - constructor that initializes an empty list to the class. Name this list attribute `drinks`. This list `drinks` will eventually expand with drinks for the customer's drink order.
* `add(self, drink)` - method that will add the drink parameter to the `DrinkOrder`'s list. The most recently added drink will be at the end of the list. You may assume the drink parameter will either be a `Juice` or `Tea` object.
*  `total(self)` - method that will return a `str` containing each drink in the drink order, and the total price of all drinks in the drink order. An example of what the return string format of the `total` method is shown below:

```python
drink1 = Tea('small', 3.0, "Camomile")
juice1 = Juice('large', 8.5, ["Apple", "Guava"])
order = DrinkOrder()
order.add(drink1)
order.add(juice1)
print(order.total())
```

<b>Output:</b>

```
Order Items:
* Camomile Tea, small: $3.00
* Apple/Guava Juice, large: $8.50
Total Price: $11.50
```

**IMPORTANT**: be careful with the string formatting in the DrinkOrder class; especially the new line character and the space after the `*` for every new order.

An example of what the return string format of the `total()` method when there are no drinks in the Drink Order is shown below:

```
Order Items:
Total Price: $0.00
```

<b>Note:</b> There is NO space after the colon on the first line, just a newline (i.e., `"Order Items:\n"`). The `order.total()` return value in the examples above do not contain a newline character (`\n`) at the end. 

<a href="#" id="testingdrinkorder"></a>
## Testing `DrinkOrder`

How to write a correct assert statement when a method’s return value is a string that is very long and contains newlines?

We have two options: see the "miscellaneous" section in the document that's linked above in Step 4. In that example, the test creates two drink orders `order1` and `order2`, which are both tested in the `TestDrinkOrder` class's `test_total()` method.

---


<a href="testingcode"></a>
# Testing your code

## `testFile.py` pytests

This file will contain unit tests using `pytest` to test if your functionality is correct. You should create your own tests different than the examples given in this writeup. Think of various scenarios and method calls to be certain that the state of your objects and return values are correct (provide enough tests such that all method calls in `Drink`, `Tea`, `Juice` and `DrinkOrder` are covered). Even though Gradescope will not use this file when running the automated tests, it is important to provide this file with various test cases (testing is important!). 

We will manually grade your `testFile.py` to make sure your unit tests cover the defined methods in `Drink`, `Tea`, and `Juice` and `DrinkOrder`. 


<a href="submission"></a>
# Submission

Once you're done with writing your class definition and tests, Submit your `Drink.py`, `Tea.py`, `Juice.py`, `DrinkOrder.py`, and `testFile.py` files to the `Lab02` assignment on Gradescope. There will be various unit tests Gradescope will run to ensure your code is working correctly based on the specifications given in this lab.

**Note on grading for labs with testing component:** For this lab assignment (and all lab assignments requiring a `testFile.py`), we will manually grade the tests you write. In general, your lab score will be based on the autograder's score (out of 100 points).

* If you write your tests correctly according to the specifications, then you will receive 100/100 points.
* If your written tests are missing, incomplete, or incorrect, then there will be **up to** a 10 point deduction from the autograder score. For example, if you didn't write any tests, then your lab score will be 90/100 (-10 point deduction from the autograder's score).

Additionally, if the instructions are asking you to implement something in a certain way, e.g., to minimize code duplication, we might subtract points if your implementation does not follow these instructions.


<a href="troubleshooting"></a>
# Troubleshooting

If Gradescope's tests don't pass, you may get some error message that may or may not be obvious. Don't worry - if the tests didn't pass, take a minute to think about what may have caused the error. Try to think of your pytests and see if you can write a test to help you debug the error (if you haven't already). If you're still not sure why you're getting the error, feel free to post on the forum or ask your TAs or Learning Assistants.

Some of the common issues that students encountered in this lab:

* be careful with the string formatting in the DrinkOrder class; especially the new line character and the space after the `*` for every new order.
* DrinkOrder is **not** a child class of the Drink class.


<a href="#" id="grs"></a>
## Interpreting the autograder output on Gradescope

If you see the error 
`"The autograder failed to execute correctly. Please ensure that your submission is valid. Contact your course staff for help in debugging this issue. Make sure to include a link to this page so that they can help you most effectively."`
Make sure to remove any `print()` statements from your code or add them in the `if __name__ == "__main__"` section.

---

Below is an example output for a failed test on Gradescope:
```
- * Berry/Grape Juice, small: $ 5.00
?                              -
+ * Berry/Grape Juice, small: $5.00
```
```
- * Chamomile, large: $4.00
+ * Chamomile Tea, large: $4.00
?            ++++
```

* the line that starts with a `-` is the result of _your_ code
* the line that starts with a `?` shows you where the autograder detected a difference between your result and what is expected
  * if that line is showing a `-` it marks what needs to be _removed_ from your result 
  * if that line is showing a `+` (in the example above, `++++`), it marks what needs to be _added_ to your result 
* the line that starts with a `+` shows what was expected

In the first case, see the hint in the instructions about the price formatting using f-strings. 
In the second case, make sure that the `.info()` is correctly defined for the `DrinkOrder` class.


If you run into any other issues, make a post on the forum (remember to follow the posting guidelines) or ask during the lab / office hours.

