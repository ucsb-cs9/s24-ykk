---
num: "Lecture 3"
desc: "Python Objects and Classes"
ready: true
lecture_date: 2024-04-09 15:30:00.00-7:00
---

* [Slides folder]({{ site.slides_url }}){:target="_blank"}

# Plan for today
- What are Python objects and classes? Why do we need them?
- How to create a new class?
  - What is a constructor? 
  - What are the different ways to define/call a constructor?
- How to define a method of a class?
- How to instantiate an object of our class?
- How to create a container class?


# Object Oriented Programming: Model Real-world Properties
* OOP lets us:
  * Manipulate states using methods
  * Methods vs functions: methods are functions that belong to a specific class
 
Example: built-in method for a dictionary vs. `enumerate()` function:
- the way the are called is different
- the objects that operate on is different

```
my_dict = {"jan": 1, "feb": 2}
for index, month in enumerate(my_dict):
    print(index, month)
```
Output:
```
0 jan
1 feb
```

Same function using a string:
```
my_string = "Python is awesome"
for index, char in enumerate(my_string):
    print(index, char)
```

Using a class method involves calling the method using a dot notation:
```
my_dict.get("march")
my_dict.get("feb")
2
my_string.get("Python")
Traceback (most recent call last):
  File "<pyshell#13>", line 1, in <module>
    my_string.get("Python")
AttributeError: 'str' object has no attribute 'get'

```

# Defining a new class
 
* Creating a new object type
  * Name of the type as well as the file name are capitalized
  * Example: Song.py
    * Attributes for title and genre (noted by the self keyword)
  * Create getters and setters for each attribute

```
class Song:

    def set_title(self, new_title):
        self.title = new_title

    def set_genre(self, new_genre):
        self.genre = new_genre

    def set_duration(self, new_duration):
        self.duration = new_duration

    def get_title(self):
        return self.title

    def get_genre(self):
        return self.genre

    def get_duration(self):
        return self.duration

```

When calling the method, we need to make sure to use parentheses, otherwise, Python will display the info about the method itself as an object:
```
song1.get_title()
'Some song'

song1.get_genre()
'Techno'

song1.get_genre
<bound method Song.get_genre of <__main__.Song object at 0x1034e7c50>>
type(song1.get_genre)
<class 'method'>
```

* Use a class in a different file with: `from Song import Song`
  * which stands for `from [filename (without .py)] import [component]`

* Constructors: called when a new class object is created, sets the attributes to the values passed in by the parameters
  * Default constructor: `__init__(self, title, genre)`
* Create a new object of the class:
  * `song1 = Song("SongA", "Jazz")`
  * `song2 = Song()`
* Exercise: create class Playlist that contains a collection of Song objects


# The `self` parameter

Every method of any class should have `self` as its first parameter; `self` refers to the object of that class that will be calling that method - Python implicitly passes it into the method call.

If we try to re-write our method call to pass the object of that class as an argument, we'll get different errors:
- in the first case, "Some song" was counted as the 3rd argument
- in the second case, the `set_title()` method is not found, because it is not called using a dot notation by an object of that class; instead, Python is looking for a function with that name.

```
song1.set_title(song1, "Some song")
TypeError: Song.set_title() takes 2 positional arguments but 3 were given

set_title(song1, "Some song")
NameError: name 'set_title' is not defined
```

The way that Python calls the constructor in the following two lines is equivalent:
- explicitly call the `__init__()` method - not usually used
- call the constructor directly
```
song4 = Song().__init__()
song5 = Song()
```

# Two forms of a constructor

To create a new object of our class, we can use the following 3 strategies:
- do not define a constructor, which will use Python's default `__init__()` method that will only create a space in memory for a new object'
  - the object will not have any of our custom attributes, so we'll need to use setters to create them
- define our custom constructor by overwriting Python's default `__init__()` method
  - listing the custom parameters will tell Python what the user needs to provide when they create a new object
  - e.g., defined a constructor using `def __init__(self, new_title = "", new_genre = "")` to create a song using `Song("Another title", "Jazz")`
- define our custom constructor but allow the user to omit some or all of the parameters by using the **default parameter values**
 - e.g., `def __init__(self, new_title = "", new_genre = "")` allows us to create a new object by using `song1 = Song()`
 - sets the parameters to their default values from the method signature if the user didn't provide them during the initialization of the object

# Testing our code

We customarily put the tests into a separate file, which we need to run to verify that the code works as expected.

```
from Song import Song

song1 = Song() # instantiating a new song object
assert song1.get_genre() == ""
assert song1.get_title() == ""

song1.set_title("Some song")
song1.set_genre("Techno")

assert song1.get_genre() == "Techno"
assert song1.get_title() == "Some song"

song2 = Song("Another title", "Jazz")
assert song2.get_genre() == "Jazz"
assert song2.get_title() == "Another title"

print("All tests pass!") # will display if everything worked
```

We can also test it interactively by using the IDLE shell:
```
print(song1.get_title())
Some song
print(song2.get_title())
Another title
song3 = Song()
print(song3.get_title())
None
print(song3.get_genre())
None
```

Note that the default parameter values allow us to use positional arguments and initialize some of them:
```
song3 = Song("Hello")
print(song3.get_title())
Hello
print(song3.get_genre())
None
```

# Displaying the object values

To be able to see the parameters displayed in a nicer form, we can define a method to help us:
```
    def info(self):
        return f"Title: {self.title}\nGenre: {self.genre}"
```

The method returns a string, so if we use the IDLE shell to see the return value, we'll see the newline character `\n`; if we print the returned string, the newline will be converted into part of the output:

```
song1.info()
'Title: Some song\nGenre: Techno'

print(song1.info())
Title: Some song
Genre: Techno

print(song2.info())
Title: Another title
Genre: Jazz
```

# Constructor classes

We can now begin using our custom classes as part of our other classes.

Let's create a playlist of our songs, organized by the songs' genres.

```
from Song import Song 

class Playlist:
    '''
    Class representing a collection of songs.
    Songs are organized by a dictionary where
    the key is the song genre and the corresponding
    value is a list of songs with that genre.
    '''
    def __init__(self):
        self.db = {}
```

Let's add a new song to this database:
```
def add_song(self, new_song):
		# If a genre doesn't exist…
genre =  new_song.get_genre()
		if self.db.get(genre) == None:
			# new entry in the dictionary; its value is a list
			self.db[genre] = [new_song]
		elif not new_song in self.db.get(genre):
			self.db[genre].append(new_song)
```


