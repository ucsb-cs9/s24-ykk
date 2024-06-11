---
num: "Lecture 20"
desc: "Deletion from the Binary Search Trees and Course Wrap-Up"
ready: true
lecture_date: 2024-06-06 15:30:00 -0700
---

# Plan for today
- Why do we need to have 2 seperate classes? BinarySearchTree vs TreeNode
- How to define classes? Which methods do we need?
- What are the 3 cases for deleting a node?
- How to implement each deletion case?
- How to test various deletion cases?
- Final exam topics
- Course evaluation

# Final exam logistics
- **Thursday, 6/13/2024, 4pm - 6pm in our HFH classroom**
- No additional materials allowed
- **Bring photo ID**
- Bring a writing utensil (pencil and an eraser are recommended over pens) 
- Write legibly - if we can't read it, it'll be marked as incorrect; similarly, if the answer contains correct and incorrect components, it'll be graded as incorrect
- Bathroom breaks are not allowed; unless it is an emergency in which case will be with a chaperone and timed
- If someone shows up late for the exam and another student had already turned in their exam, we won't let the tardy student take the exam

# Final exam type questions
- Types of questions:
  - True / False
  - Short answer
  - Given same code, write the output
  - Write code satisfying a specification (short code examples)
  - Given an algorithm we covered, fill in the blanks
  - Draw diagrams, states of list
- Refer to previous labs, homeworks, concepts we have covered several times

# Exam topics
- Python basics
- Types
- Testing
- Object-oriented programming
- Recursion
- Linear data structures (Binary trees, Binary search trees, Min-heap, Max-heap)
- Trees
- Sorting algorithms

See slides for a more detailed breakdown

### Student Questions
- What is meant by "Pass 1, Pass 2, Pass 3" in the context of sorting algorithms (what does a pass mean)?
  - each pass places one item into its correct location
- Review three types of quadratic sort (the steps of each procedure)

# Lab review 

# Review Questions

Refer to Lecture 19 slides or the [textbook tree, e.g., Figure 3 in the Search Tree Implementation chapter](https://runestone.academy/ns/books/published/pythonds/Trees/SearchTreeImplementation.html).

Question 1: What node replaces the deleted node 35?

_Remember that we go right and then move all the way to the leftmost child to find the successive value (the immediate next largest value after the one we are deleting)._

Question 2: What node replaces the deleted node 17?
```
A. 7
B. 16
C. 35
*D. 29*
E. 38
```

Question 3: What node replaces the deleted node 7 (after 5 had been removed)?
```
A. 2
B. 11
C. 16
D. 9
*E. 8*
```

### Student Questions
- What does `self` refer to in splice out method?
- Does the order of reconnecting the parent to the child or the child to the parent matter when we are splicing out the node?

## Lab09 deadline extension

**Lab 09 deadline is now 06/09/2024 11:59 PM**
