---
layout: lab
num: lab04
ready: true
desc: "Maze Solver using Stacks"
assigned: 2024-04-30 23:59:59.59-7
due: 2024-05-09 23:59:59.59-7
---

## Table of Contents
* [Learning Goals](#learning-goals)
* [Solving a maze](#solving-a-maze)
* [Representing a maze](#representing-a-maze)
* [Traversing the maze](#traversing-the-maze)
* [Utilizing a Stack](#utilizing-a-stack-to-keep-track-of-where-weve-visited)
* [Instructions](#instructions)
	* [`Stack.py`](#stackpy)
	* [`lab04.py`](#lab04py)
	* [`testFile.py`](#testfilepy)
* [Submission](#submission)
* [Additional Resources](#step-by-step-traversal-of-the-maze)
	* Step-by-step traversal
	* Visual walkthrough (video) 
* [Troubleshooting](#troubleshooting)


## Learning Goals

In this lab, you'll practice:

* Utilizing a Stack to solve a maze
* Practice writing pytests to ensure your solution is correct

**Note: It is important that you start this lab early so you can utilize our office hours to seek assistance / ask clarifying questions during the week before the deadline if needed!**

_For this writeup, it might be helpful to draw the provided mazes and write the indices next to the rows and columns to make it easier to follow the instructions._

## Solving a Maze

We can explore and solve a maze by utilizing a Stack data structure. The idea is: given coordinates (x,y positions), we can explore the maze in different directions until we reach dead-ends or our goal. If we do reach a dead-end, a Stack data structure can help us keep track of coordinates we've visited and allow us to "backtrack" to a certain point.

More context on this specific problem is covered in the book (See **Recursion Chapter 4.6: Exploring a Maze**, or [5.11 in the online book](https://runestone.academy/ns/books/published/pythonds/Recursion/ExploringaMaze.html)). The book explains how this problem can be solved recursively, but in this lab we will not use recursion - rather we will do what recursion does for us and manually keep track of positions visited using our implementation of a Stack data structure.

## Representing a maze

There can be several ways to represent a maze, but we will use a _n_ x _m_ 2D List. An example below will help explain how the 2D List is being used as a maze:

```
maze = [
['+','+','+','+','G','+'],
['+',' ','+',' ',' ','+'],
['+',' ',' ',' ','+','+'],
['+',' ','+','+',' ','+'],
['+',' ',' ',' ',' ','+'],
['+','+','+','+','+','+'] ]
```

The above example is a 6 x 6 maze. 
* `maze[x][y]` will represent a single item in the 2D List. 
* `maze[x]` will contain a list and `maze[x][y]` will contain a single element (the y<sup>th</sup> item in the x<sup>th</sup> list). 
* Since we're dealing with Python 2D Lists (a Python list where the elements are Python Lists), the indices of the maze coordinates start with 0. 
* The top left position of the maze will be indexed at `maze[0][0]` and the bottom right position of the maze will be indexed at `maze[n-1][m-1]`. 

_In the above example, `G` is located at `maze[0][4]`, so `maze[0]` contains the list where `G` is found._

If you would like to review Python 2D Lists, you may find the following CS 8 notes useful: <https://ucsb-cs8.github.io/m19-wang/lectures/lect10/>


**Note: This layout is different than a traditional cartesian coordinate system. As we move right the y value increases, as we move left the y value decreases, as we move up the x value decreases, and as we move down the x value increases.**

The initial maze element can have one of three states:

* `' '` - an empty space. This indicates the space can be moved into.
* `'+'` - a wall. This indicates that you cannot move into this position.
* `'G'` - a goal. We are trying to see if a path exists to this position.

**Also Note: You may assume that a maze will always be enclosed with a border (`'+'`) or the Goal (`'G'`) - there won't be any open spaces along the borders of the maze.**

## Traversing the maze

Your function will need to traverse the 2D maze given a starting coordinate. As your function traverses the maze, you will need to keep track of the number of steps your algorithm takes and replace the `' '` elements in the maze as you move along with the "step number" value.
By following these numbered steps, you can trace how the algorithm was traversing the maze to reach the goal.

Remember: Lists (and 2D Lists) are mutable, so we should be able to change the maze structure as our algorithm progresses and it should keep these changes! 

You may traverse the spaces horizontally and vertically (not diagonally). 

**You must implement your traversal in following way**:

* When reaching a certain coordinate, you must check and move **counterclockwise** in the following order: **North, then West, then South, then East**
* You will always be given a starting coordinate. This will be the first step taken by the function.
* You will traverse the maze until you reach a goal (`'G'`). Once you reach the goal, your algorithm can stop (no need to keep traversing the maze)
	* **Note: in the edge case where the current position is next to the goal, your function should always attempt to move into the space _before_ it checks to see if the position stepped into is the goal.**

Using the maze provided above, let's assume your starting position is at `maze[4][4]`. After your algorithm finshes, `maze` will have the following updates containing the number of steps:

```
[ ['+', '+', '+', '+', 'G', '+'],
  ['+', 8, '+', 11, 12, '+'],
  ['+', 7, 9, 10, '+', '+'],
  ['+', 6, '+', '+', 2, '+'],
  ['+', 5, 4, 3, 1, '+'],
  ['+', '+', '+', '+', '+', '+'] ]
```

This format is not too easy on the eyes, so we're providing a helper function below that you can use to print out the state of the maze in a more user-friendly way:

```
def print_maze(maze):
	for row in range(len(maze)):
		for col in range(len(maze[0])):
			print(f"|{maze[row][col]:<2}", sep='',end='')
		print("|")
```

We can print the initial maze in the following format:

```
|+ |+ |+ |+ |G |+ |
|+ |  |+ |  |  |+ |
|+ |  |  |  |+ |+ |
|+ |  |+ |+ |  |+ |
|+ |  |  |  |  |+ |
|+ |+ |+ |+ |+ |+ |
```

And we can print the maze after our algorithm runs in the following format:

```
|+ |+ |+ |+ |G |+ |
|+ |8 |+ |11|12|+ |
|+ |7 |9 |10|+ |+ |
|+ |6 |+ |+ |2 |+ |
|+ |5 |4 |3 |1 |+ |
|+ |+ |+ |+ |+ |+ |
```

Note that our starting coordinate (`maze[4][4]`) is the first step we take (and mark the grid with a 1). Then it traverses North (step 2) until it can't go any further. For example, in step 2's position (at coordinate `maze[3][4]`), it tries to check North (runs into a wall), then West (runs into a wall), then South (already visited), then East (runs into a wall), so we can't continue. At this point, we need to "backtrack" to step 1 and check the other counterclockwise directions of `maze[4][4]`, so at step 1 it tries to go North (already visited as indicated with step 2), then West, which is open (can continue, so now it takes the 3rd step), and so on. 

**Note that `'G'` or `'+'` should never be overwritten when traversing the maze.**

## Utilizing a Stack to keep track of where we've visited

Instead of using a recursive solution like the book describes, we will use a Stack in our solution. It essentially is doing the same thing as recursion, except now we have to manually push and pop the position(s) we've visited that may have other directions to check.

* As we move along the maze, we should be pushing the coordinates of where we're visiting onto the Stack, and we want to replace the empty space (`' '`) with the current number of steps taken in the 2D List maze structure.
	* Since we're defining positions as `[x][y]` indices on the 2D maze, I would recommend pushing these coordinates as a list onto the stack (`[x,y]`). When extracting a coordinate list type on the Stack, you can index x with [0] and y with [1] as needed.
* We want to make sure we don't move to a position we've already visited (since that might end up in an infinite loop!). So keep in mind we should only move to coordinates with a `' '` value.
* The top of our Stack will be the current position we're at, and check if we are able to move to a valid adjacent coordinate. If not, then we need to remove that position from the Stack and check the next top element in the Stack (containing a `x,y` position that has more directions to check).
	* As long as there are items in the Stack, that means there are still positions that have possible directions to check.
	* If our Stack does not have any items, this implies there are no more positions with directions to check. If we haven't reached our goal at this point, then this implies there is no path from the given starting position to the goal.
	

## Instructions

For this lab, you will need to create three files:
* `Stack.py` - file containing your class definition of a Python Stack using Python Lists
* `lab04.py` - file containing your solution to writing the `maze_path_exists` function as described in this writeup
* `testFile.py` - file containing pytest functions testing if your solution works as expected for your own mazes you'll create. **Note:** Gradescope's autograder requires you to submit your `testFile.py` in order for it to run your code (hopefully you're practicing TDD and use your tests to check correctness!) 


There will be no starter code for this assignment, but rather function descriptions and helper functions are given in the specification below.

It's recommended that you organize your lab work in its own directory. This way, all files for a lab are located in a single folder. Also, this will be easy to import various files into your code using the `import / from` technique shown in lecture.

## `lab04.py`

This file will contain a single function definition `maze_path_exists(maze, start_x, start_y)`. The `maze` parameter will be the 2D List maze as described above. `start_x` and `start_y` are the starting coordinates used when traversing the maze (`maze[start_x][start_y]`). You may assume that `start_x` and `start_y` position is a valid position (i.e., it's contained within the maze and no `+` or `G` value exists in that position in the 2D List).

The `maze_path_exists` function will utilize a Stack and update the maze elements with the number of steps at each traversed position. It should return `True` if a path exists and the goal was reached, and return `False` if no path to the goal exists.

## `Stack.py`

This file will simply contain a Stack class implementation **exactly** as the one covered in the book using Python Lists (we'll also cover this implementation in lecture - no need to write pytests for this, but Gradescope will check to see if this implementation is correct). This should contain a constructor (`__init__`), and the `isEmpty`, `push`, `pop`, `peek`, and `size` methods. Your solution **must** utilize the Stack data structure and any of its methods to manage the traversal through the maze.

## `testFile.py` 

This file will contain unit tests using pytest to test if your `maze_path_exists` functionality is correct. **Think of various mazes (with or without solutions and different sizes) and check to see if the traversal is correct according to these instructions.** Write your tests first in order to check the correctness of your function. Again, Gradescope requires `testFile.py` to be submitted before running any autograded tests. You should write at least one test where a solution exists (different than the one provided in these instructions), and another test where a solution does not exist. Remember that testing can help you debug your algorithm and ensure your functionality works as expected.

An example of how we could write a pytest using the maze above using pytest: first, check the return value of the function, then verify that the maze after the function execution looks as expected. Solving the path through the maze on paper can help write these test cases.

```
def test_example():
	maze = [
    ['+','+','+','+','G','+'],
    ['+',' ','+',' ',' ','+'],
    ['+',' ',' ',' ','+','+'],
    ['+',' ','+','+',' ','+'],
    ['+',' ',' ',' ',' ','+'],
    ['+','+','+','+','+','+'] ]
	assert maze_path_exists(maze, 4, 4) == True
	assert maze == [
    ['+', '+', '+', '+', 'G', '+'],
    ['+', 8, '+', 11, 12, '+'],
    ['+', 7, 9, 10, '+', '+'],
    ['+', 6, '+', '+', 2, '+'],
    ['+', 5, 4, 3, 1, '+'],
    ['+', '+', '+', '+', '+', '+'] ]
```

## Submission

Once you're done with writing your class / function definitions and tests, submit your `lab04.py`, `Stack.py` and `testFile.py` files to the `Lab04` assignment on Gradescope. There will be various unit tests Gradescope to ensure your code is working correctly based on the specifications given in this lab.

Also, double-check and remove any print statements in your submission. Sometimes print statements confuses the autograder and may result in an error message.

If the tests don't pass, you may get some error message that may or may not be obvious at this point. Don't worry - if the tests didn't pass, take a minute to think about what may have caused the error. If your tests didn't pass and you're still not sure why you're getting the error, feel free to ask your TAs or Learning Assistants.


---

## Step-by-Step Traversal of the Maze

```
To illustrate how our given algorithm works, let's see the following example:

Let's say the starting maze and stack looks like this: (first step already taken)

[
	['+', '+', '+', '+', 'G', '+']                  |   |
	['+', ' ', '+', ' ', ' ', '+']                  |   |
	['+', ' ', ' ', ' ', '+', '+']                  |   |
	['+', ' ', '+', '+', ' ', '+']                  |   |
	['+', ' ', ' ', ' ',  1 , '+'] <- now at 1      |4,4| <- keep track of where we are
	['+', '+', '+', '+', '+', '+']                  |---|
]
For each step, we check the 4 directions (north, west, south, east) one by one to see if there is a valid slot to move.

[
	['+', '+', '+', '+', 'G', '+']                  |   |
	['+', ' ', '+', ' ', ' ', '+']                  |   |
	['+', ' ', ' ', ' ', '+', '+']                  |   |
	['+', ' ', '+', '+',    , '+'] <- north good    |   |
	['+', ' ', ' ', ' ',  1 , '+']                  |4,4|
	['+', '+', '+', '+', '+', '+']                  |---|
]
Since north is valid, we take a step to the north and update the maze and the stack accordingly:

[
	['+', '+', '+', '+', 'G', '+']                  |   |
	['+', ' ', '+', ' ', ' ', '+']                  |   |
	['+', ' ', ' ', ' ', '+', '+']                  |   |
	['+', ' ', '+', '+',  2 , '+'] <- now at 2      |3,4| <- keep track of where we are
	['+', ' ', ' ', ' ',  1 , '+']                  |4,4|
	['+', '+', '+', '+', '+', '+']                  |---|
]
Now, start from 2, we check the 4 directions (North, West, South, Eastt) one by one to see if there is a valid slot to move.

[
	['+', '+', '+', '+', 'G', '+']                  |   |
	['+', ' ', '+', ' ', ' ', '+']                  |   |
	['+', ' ', ' ', ' ', '+', '+']                  |   |
	['+', ' ', '+', '+',  2 , '+'] <- NWSE blocked  |3,4|
	['+', ' ', ' ', ' ',  1 , '+']                  |4,4|
	['+', '+', '+', '+', '+', '+']                  |---|
]
When all 4 directions NWSE are blocked, we take a step back by popping the stack:

[
	['+', '+', '+', '+', 'G', '+']                  |   |
	['+', ' ', '+', ' ', ' ', '+']                  |   |
	['+', ' ', ' ', ' ', '+', '+']                  |   |
	['+', ' ', '+', '+',  2 , '+']                  |   | <- pop
	['+', ' ', ' ', ' ',  1 , '+'] <- back to 1     |4,4| <- where to go back
	['+', '+', '+', '+', '+', '+']                  |---|
]
Start from 1, again, we check the 4 directions (north, west, south, east) one by one to see if there is a valid slot to move.

we check the north (this time occupied), then the west, and since the west is valid, we go west:

[
	['+', '+', '+', '+', 'G', '+']                  |   |
	['+', ' ', '+', ' ', ' ', '+']                  |   |
	['+', ' ', ' ', ' ', '+', '+']                  |   |
	['+', ' ', '+', '+',  2 , '+']                  |4,3| <- keep track of where we are
	['+', ' ', ' ',  3 ,  1 , '+'] <- now at 3      |4,4|
	['+', '+', '+', '+', '+', '+']                  |---|
]
```

The algorithm given is straightforward, and all you need to do is translate this procedure into python code. Our suggestion is reading the lab description carefully. It indeed contains all you need.

If you'd like an additional walkthrough, here's a handwritten explanation of the various elements you will need to solve this lab:
<https://www.loom.com/share/b3323f2125d447dcbc7d18b96e45dda4?sid=092fe2c5-cf90-48fa-ae40-ead8c12c86c7>


## Troubleshooting

* Ensure that the starting coordinates (`start_x, start_y`) are used only **once** for initializing the starting position in the maze. Reusing or modifying these initial coordinates incorrectly during the traversal can lead to incorrect path tracking.

* Each position you move to must be immediately marked with the current step number. This marking is crucial to avoid revisiting and looping back to previously explored locations, which can lead to infinite loops.

*  Properly manage the stack by ensuring that only viable paths are pushed onto it and that backtracking is handled correctly by popping the stack when no moves are possible. Neglecting proper stack management can cause premature termination or missing the correct path.


