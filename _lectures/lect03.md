---
num: "Lecture 3"
desc: "Python Objects and Classes"
ready: true
lecture_date: 2024-04-09 15:30:00.00-7:00
---

# Plan for today
- What are objects and classes and why do we need them
- How to create a new class (constructors, etc)

# Object Oriented Programming: Model Real-world Properties
* OOP lets us:
  * Manipulate states using methods
  * Methods vs functions: methods are functions that belong to a specific class
 
* Creating a new object type
  * Name of the type as well as the file name are capitalized
  * Example: Song.py
    * Attributes for title and genre (noted by the self keyword)
  * Create getters and setters for each attribute
```
class Song:
  def set_title(self, title):
    self.title = title
  def set_genre(...): ...
```

* Use a class in a different file with: `from Song import Song`

* Constructors: called when a new class object is created, sets the attributes to the values passed in by the parameters
  * Default constructor: `__init__(self, title, genre)`
* Create a new object of the class:
  * `song1 = Song("SongA", "Jazz")`
  * `song2 = Song()`
* Exercise: create class Playlist that contains a collection of Song objects
