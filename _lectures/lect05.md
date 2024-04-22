---
num: "Lecture 5"
desc: "Pytest, Operator Overloading, Inheritance"
ready: true
lecture_date: 2024-04-16 15:30:00.00-7:00
---

* [Slides folder]({{ site.slides_url }}){:target="_blank"} 

# Plan for today
* join.iclicker.com/YADE 
* Review
    * What is operator overloading? What are the benefits of it?
    * What is the difference between the shallow and deep equality?

* New for today:
    * Why write tests for our code? 
    * What are the benefits of pytest?
    * How to write and run tests in pytest?

    * What is inheritance in Python? What are the benefits of it?
 
# Lecture Notes
* Constructors: called to instantiate / create an object of that class
   * Default constructor: created by the program by default if the programmer has not specified another constructor
   * Instance of a class: a unique creation of an object
* Operator overloading: redfining operators:
   * 'def __eq__(self, rhs): ...' redefines the '==' operator
* Shallow vs. deep equality:
   * shallow equality: by default, Python uses the memory address (not the value) to determine if two objects are the same
   * deep equality: comparing values instead of memory addresses
 
* Test-driven development & Unit testing:
   * Testing individual pieces (units) of a program to ensure correct behavior
* Pytest: framework that allows us to test our code
   * Function names have to begin with “test_”
 
* Inheritance: a way of extending the functionality and properties of an existing class
   * Allows us to add new features
   * Allows us to replace existing features
   * Superclass/parent: class that other classes inherit from
   * Subclass/child: class that inherits from a parent class

