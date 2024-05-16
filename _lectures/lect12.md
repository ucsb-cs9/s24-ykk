---
num: "Lecture 12"
desc: "Linked List and Ordered Linked List"
ready: true
lecture_date: 2024-05-09 15:30:00 -0700
---

[Slides folder]({{ site.slides_url }})


# Plan for today
- Iclicker review of last class
- Linked list vs ordered linked list
- How to delete an item from linked list
- How to add an item to an ordered linked list

# Iclicker Questions
'''
Question 1:
Which of the following assertions is False
A linked list is...
A.
B.
C.
D.
E.

Question 2:
Given a linked list, which attribute will it have as part of its class definition?
A. next
B. data
*C. head*
D. self
E. None of the above

Question 3:
Given a node that will be part of a linked list, which attribute will it not have as part of its class definition?
A. next
B. data
C. head
D. self
E. None of the above

Question 4:
Given the following lines of code, what order do they need to go in to correctly add a new node to the list?

Question 5:
Which operator do we need to overload to implement object comparison as follows?
'''

# Linked List versus Ordered Linked List
(Unordered) Linked Lists
-The position of the nodes did not matter with respect to each other
-Inserted at the start of the list

Ordered Linked List is similar to Unordered Linked List
-Except the nodes in the list are ordered with respect to each other
-Need to overload the comparison operators
-Adding the node requires us to put a node in the correct position

# Note
- Add practice for overloading operators @ykharitonova

How to remove an element from a LinkedList?
  1. What do we need to remove an element from a Linked List?
  2. How to check if a Linked List is empty or we are at the end of the list
  3. How to advance through a Linked List

Case 1: Remove an element from the start of a Linked List

Case 2: How to remove an item after the first element of a Linked List

### Student Questions
Where does the code snippet for each case go?

# Ordered Linked List
Q: What operation will become faster or simpler with an Ordered Linked List vs Unordered Linked List
A: Removing from the list, adding to the list, finding a specific item

How to add an element to an Ordered Linked List?

How to check if an element is at the spot where we want to add it?

Case 1: Add a node to the start of the list 

Case 2: Add a node past the start of the list

# Other types of linked lists
- Singly-linked list with a head link
- Singly-linked list with a head and tail link
- Doubly-linked list with a next and previous link for each node
- Circular linked list

# Sorting
- Bubble sort O(n^2) --> Bubble the largest element to the end of the list
- Selection sort O(n^2) --> Find the INDEX of the largest element and swap it to the last spot
- Worst case for these algorithms: A list sorted in reverse order
- Visualization: https://www.hackerearth.com/practice/algorithms/sorting/bubble-sort/visualize/
  
