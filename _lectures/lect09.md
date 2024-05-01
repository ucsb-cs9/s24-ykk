---
num: "Lecture 9"
desc: "Python Data Structures: List, Dictionary, Stack"
ready: true
lecture_date: 2024-04-30 15:30:00 -0700
---

# Plan for today
* Lab04 announcement
* Exam logistics
* Lists and dictionaries
* What is an ADT? What's the advantage?
* What are linear data structures?
* What are the benefits of using stacks?
* What are the rules for using stacks?
* What are the main functions for the stacks? What are their Big-O runtimes?
* How can we implement a stack using a list?

## Big-O iClickers
```py
def print_pair(n):
  for i in range(n):
    for val in range(n):
      print(i, val)

for num in range(0, 1000):
  print_pair(num)
```
Big-O of O(1): the input to the print_pair function is constant

## Lists
- Stored in contiguous memory
- Processing elements from the front of the list vs from the back of the list results in different Big-O runtimes
  - Appending to the front of the list: O(n)
    - The program has to shift all of the current items in the list so that there is space for the new element
  - Appending to the end of the list: O(1)

## Dictionaries
- Uses a hashing function to figure out where to store elements
- Key-value pairing
- Most of the dictionary operations are O(1) because of the efficient access to the elements
- Copying the dictionary is O(n)

## Abstract Data Type
- ADT specifies the states (data) and operations that the object needs to perform without specifying th eexact implementation

## Linear Data Structures
- Use relative positioning
- Stacks, queues, deques
 
### Stacks
- Push to top & Pop from the top
- FILO: first in, last out
- Peek: see the top element without removing it
- Why use a stack?
  - Helpful in cases of backtracking
  - Unwinding recursive calls from the call stack
- Represent the stack as a list
- push(item), pop(), and peek() are all O(1)
