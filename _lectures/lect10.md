---
num: "Lecture 10"
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

Define a SongNode class that keeps track of the object (artist, title, duration), and the link to the next object
```py
class SongNode:
  def __init__(self, artist, title, duration):
    self.artist = artist
    self.title = title
    self.duration = duration
    self.next = None
```

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

# Comparing nodes
How to compare two SongNode objects?
- There are multiple possibilities, eg: compare objects based only on their duration

Overloading comparison operators:
- Overload the less than operator
```py
def __lt__(self, other):
  return self.data.duration < other.data.get_duration()
```

# Benefits of Linked Lists
- No need to specify the size of the list
- Linked lists are a dynamic data structure

# Student Questions
- 
