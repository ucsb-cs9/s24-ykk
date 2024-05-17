---
num: "Lecture 11"
desc: "Linked Lists"
ready: true
lecture_date: 2024-05-07 15:30:00 -0700
---

# Plan for today
- What are linked lists? How are they different from Python lists?
- How to define a node?
- Overriding comparison operators for nodes?
- Benefits for using a linked list?
- Main functions for linked lists and their Big-O runtimes?
- How can we implement a linked list?
- Why is the order of operations so important?

# Stack, Queue, Deque
- Stack ADT: <https://youtu.be/X_YM_ZnkN6k> (15 min)
- Queue ADT: <https://youtu.be/U1J_U-Fwlzg> (10 min)
- Deque ADT: <https://youtu.be/4wFTHsTnclU> (15.5 min)

# Linked Lists vs. Lists
Lists:
- Contiguous in memory: requires shifting to add and remove from the front

Linked Lists:
- Don't have to store items contiguously in memory but can still have relative positioning of items

# Nodes
- A data structure that keeps track of the data and the link to the next object in the sequence
```py
class Node:
  def __init__(self, newData):
    self.data = newData
    self.next = None
```
- If the constructor required us to pass in an object and create it directly, the above code would look different (see next example).

SongNode in-class activity: <https://t.ly/HHoM7>
- Define a SongNode class that keeps track of the object (artist, title, duration), and the link to the next object
```py
class SongNode:
  def __init__(self, artist, title, duration):
    self.artist = artist
    self.title = title
    self.duration = duration
    self.next = None

  def get_next(self):
	  return self.next

  def set_next(self, newNext):
  	self.next = newNext
```

# Comparing nodes
How to compare two SongNode objects?
- There are multiple possibilities, eg: compare objects based only on their duration

SongNode in-class activity: <https://tinyurl.com/cs9songnode1>
- Overloading comparison operators:
	- Overload the less than (<) operator: example: compare only by duration
```py
def __lt__(self, other):
  return self.data.duration < other.data.get_duration()
```

# Benefits of Linked Lists
- No need to specify the size of the list
- Linked lists are a dynamic data structure
- Linear data structures like stacks and queues are often easily implemented using a linked list
- No need to shift elements after the insertion or deletion of an element.
  - Scalable
  - Great for large datasets
 
# Question & Example SongList
- In-class activity: https://tinyurl.com/cs9linked1
- What's the easiest to insert an element into a linked list?: at the front

  Add to the front of a linked list:
```py
def prepend(self, item):
  new_node = Node(item)
  new_node.set_next(self.head)
  self.head = new_node
```

Count number of nodes in a linked list:
```py
def length(self):
  current = self.head
  count = 0
  while current != None:
    count += 1
    current = current.get_next()
  return count
```

Remove an element from the linked list:
```py
def remove(self, item):
  current = self.head
  previous = None
  found = False
  # while loop to iterate through the linked list and find the node to remove
```

Check if linked list is empty or at the end of the list:
```py
while not found:
  if current == None:
    return
```

# Student Questions
Q: Why do you include a backslash (`\`) in a return statement? 
A: Backslashes are used to create a multiline statement, so when we use it in the return statement, we can write our `and` condition on multiple lines (to make it easier to see its parts)

Q: Assert statements when using comparison operators
A: You need to include parentheses to indicate order of operations
	- eg: `assert (pet1 < pet2) == True` instead of `assert pet1 < pet2 == True`
