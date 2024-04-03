---
layout: lab
num: lab00
ready: true
desc: "Python Review (strings, dictionaries, loops)"
assigned: 2024-04-02 11:00:00.00-7
due: 2024-04-09 23:59:59.59-7
---

# Introduction

Your first lab for this week is an introduction to making submissions to Gradescope's autograder and writing Python functions.

## Goals for this lab

By the time you have completed this lab, you should have:
* installed Python
* created and run Python progams in IDLE
* submited an assignment using the Gradescope system

## Python concepts to review

Many of the concepts are covered in Section 1.4 - Review of basic Python ([online section 1.8](https://runestone.academy/ns/books/published/pythonds/Introduction/GettingStartedwithData.html)):
* defining functions
* iterating over lists and string characters (using `for` loops)
* comparing conditions using `if` / `elif` / `else` statements
* using string's `.isupper()` / `.islower()` and `.upper()` / `.lower()` methods
* writing tests using `assert` statements

# Get setup with Gradescope

We will use [Gradescope]({{ site.gradescope }}) to grade all your homeworks, quizzes, and lab assignments. I have manually added everyone (using your @umail.ucsb.edu accounts) currently enrolled in the course to the Gradescope system. You should have received an email notification with instructions about logging into Gradescope. Once you follow the instructions to set your password, you should have access to our course on Gradescope. You should see "CMPSC 9" in your Winter 2024 courses.

The lab assignment "Lab00" should appear in your Gradescope dashboard in CMPSC 9. You will need to submit your code for Lab00 using the instructions on this page.

As always in this class, you can submit your files as often as you'd like to Gradescope (we encourage you to submit your code often to back up your progress).


# Install Python on your computer

The instructions on installing Python on your computer can be found here:

<https://www.python.org/downloads/>

Follow the appropriate links to install Python for your computer.

<!--
# Lab Section Computers

We are offering in-person lab sections this quarter in SSMS 1301. These computers are Windows machines with Python 3+ already installed. **In general, it is acceptable to conduct your work on your own computer for this class.** 

The workstations in SSMS 1301 **WILL NOT** save your work such that when you log in / log out. If you plan on using these machines to do your work, it is a good idea to create back up versions of your work in case you plan on working on your personal computer - uploading versions of your work on github or Gradescope is a great way to do this since you can download / upload your work on any computer. Instructions on creating a repository on github to store your work is at the bottom of these lab instructions.
-->

# Create your Lab00 directory

It's important to be organized when working on various labs this quarter. 
My recommendation is to create a "cs9" folder that will contain sub folders for each lab - in this case I would recommend creating a `cs9/lab00` folder on your computer
where you can save your file(s) and work in this directory for Lab00. I recommend creating a new folder for each lab assignment.

When creating or obtaining files to work with, you may use any editor of your choice. However, I recommend IDLE since this comes with the installation of Python and 
the lab instructions will guide you through the process using IDLE (a program to create and run Python programs).
Additionally, since IDLE relies on your writing code yourself, it is a good editor to help you practice the concepts in this class without any AI assistance.

You can launch IDLE running Python 3+ as a Windows Application. On a Mac or Unix system, you can start IDLE by typing `idle3` in a terminal window 
(a program that gives us access to the `command line` interface for the computer). You can access the terminal window by opening up a terminal window:

![terminal icon](Terminal.png)

* A Terminal Window should pop up
* You can then open the IDLE program by typing `idle3`

If you are encountering any issues or need help, feel free to ask a TA / ULA for assistance when getting started.

# Create a new lab00.py file

Create a `lab00.py` file in your lab00 directory. This `lab00.py` file will contain the python code you will submit for this lab assignment. 

Steps of creating this new file with IDLE are:
* Open IDLE on your computer
* Go to "File" -> "New File", which will create an untitled file.
* Save this file by going to "File" -> "Save", which will prompt you to save this file in a specified location.
	* Name this file `lab00` (the file will automatically be saved as a `.py` file).
	* Save this file under your `cs9/lab00` directory that you created for this lab.

# Copy the following code template into `lab00.py` and complete the function definitions

We will write three python functions for this lab, which reviews some of the concepts covered in CS 8 and the readings in h00.

Note that several `assert` statements are included after each function definition. 
The goal is to run your code such that these assert statements do not produce any errors and your code successfully finishes execution. 
Assert statements are a quick-and-dirty way to do simple testing, but there are better ways instead of just using `assert` statements scattered throughout your code 
for testing, which we'll cover later this quarter.

In Python, code is executed line-by-line from top to bottom. So if your code has an error and an `assert` statement doesn't pass, then you will see which `assert` 
statement failed and execution will stop (no other statements after the error will be executed).

In order to run your `lab00.py` file in IDLE, go to "Run" -> "Run Module". This will start the execution of the file you're working on and the output will be displayed 
in IDLE's Interactive Shell. Remember to configure IDLE to show line numbers - it will make debugging a lot easier (IDLE Settings -> Shell/Ed).


Copy the following code into your `lab00.py` file and complete the function definitions according to the comments (and type your actual name on the first line):

```python
# Lab00, CS 9, [type your name here]

def found_in_list(list1, list2):
    ''' This function takes two lists as its parameters (list1 and
        list2). Return True if each element in list1 exists in list2.
        Return False otherwise. If list1 contains no elements, return True.
    '''
    # COMPLETE FUNCTION DEFINITION HERE

assert found_in_list(["one",2], [0,"one",2,"three"]) == True
assert found_in_list([], [1,2,3,4]) == True
assert found_in_list([1,2,3], [1,2]) == False
assert found_in_list([1,2,3], [3,2,1]) == True

def alternate_case(text):
    ''' This function takes a string parameter (text) and returns a new
        string that flips the case of each alpha character in the provided text.
    '''
    # COMPLETE FUNCTION DEFINITION HERE

assert alternate_case("") == ""
assert alternate_case("This is a Sentence") == "tHIS IS A sENTENCE"
assert alternate_case("CS9") == "cs9"
assert alternate_case("9.95") == "9.95"

def get_counts(text):
    ''' This function takes a string parameter (text) and returns a dictionary
        type where each key in the dictionary is a unique upper-case character
        in `text` and its associated value is the number of occurences of the 
        unique character in text. Note that the unique characters should be case
        insensitive ("a" and "A" are considered the same and should be stored as
        "A" in the dictionary). Non-alpha characters (including whitespaces)
        and their occurences should also be stored in the dictionary.
    '''
    # COMPLETE FUNCTION DEFINITION HERE

dict1 = get_counts("This is a Sentence")
assert dict1.get("S") == 3
assert dict1.get("P") == None
assert dict1.get("I") == 2
assert dict1.get(" ") == 3

dict2 = get_counts("Pi is Approximately 3.14159")
assert dict2.get("1") == 2
assert dict2.get("A") == 2
assert dict2.get("P") == 3
assert dict2.get(".") == 1
assert dict2.get(4) == None
```


# Submitting to Gradescope

The lab assignment "Lab00" should appear in your Gradescope dashboard in CMPSC 9. If you haven’t submitted anything for this assignment yet, 
Gradescope will prompt you to upload your files. This prompt is shown below:

![Gradescope_upload](Gradescope_upload.png)

You either can navigate to your file(s) or "drag-and-drop" them into the "Submit Programming Assignment" window.

If you already submitted something on Gradescope, it will take you to their "Autograder Results" page. 
There is a "Resubmit" button on the bottom right that will allow you to update the files for your submission.

For this lab, if everything is correct, you'll see a successful submission passing all of the autograder tests.

Note: Be sure to log out of the machine before you leave. In fact, you should do this every time you walk away from a lab computer.

# Troubleshooting

**Tip: Removing print statements**
If you see the following error message:

```The autograder failed to execute correctly. Please ensure that your submission is valid. Contact your course staff for help in debugging this issue. Make sure to include a link to this page so that they can help you most effectively.```

This may be because your code contains `print()` statements when submitting to Gradescope. Print statements sometimes confuses the autograder resulting in this message. In general, lab submissions do not require any `print` statements (though it may be helpful to use when debugging). If you see this error, try removing any `print` statements in your code and see if that resolves your issue.

If the tests don't pass, you may get some error message that may or may not be obvious at this point. Don't worry - if the tests didn't pass, take a minute to think about what may have caused the error. If your tests didn't pass and you're still not sure why you're getting the error, feel free to ask your TAs or Learning Assistants.


#### Assert statements

If you include assertions that don't pass in your code, then it is likely that none of the tests on Gradescope will pass.

You can try removing assert statements for the functions that you have not implemented yet, and see if you get credit for the tests that pass.

**Structure of an assert statement** 

- Always start with the assert keyword
- Then, include an expression that involves the function that you are writing
  - Call the function using a specific input
- Use a comparison operator, typically `==` (but can also be others, for example `<` when comparing floats)
- Compare the returned value of the function with the result that you know the function is supposed to return

Example: `assert alternate_case("CS9") == "cs9"`
- after an `assert`, an expression that involves the function that you are writing is `alternate_case("CS9")`
  - it calls the function using a specific input `"CS9"`
- there is a comparison operator `==` to check that the function returned the exact value that we expect
- the returned value of the function that you know the function is supposed to return in this case is `"cs9"`
- if the `assert` evaluates to `True`, it passes; otherwise, it throws an `AssertionError`


#### EOF error

If you are getting an EOF error, check that you are not using `input()` anywhere in your code. 
Parameters are passed directly into the function call, so there is no need for user input.


#### `ModuleNotFoundError: No module named ...`

Check that you named your file EXACTLY as was specified - remember that Python is case-sensitive.

---

