---
num: "Lecture 16"
desc: "Trees, Priority Queues, Heaps"
ready: true
lecture_date: 2024-05-23 15:30:00 -0700
---

[Slides folder]({{ site.slides_url }})

# Plan for today
- Review the different types of trees
- How to construct a heap given a set of numbers?

# Identifying types of trees - Iclicker
Question 1: What kind of tree is it?
@ykharitonova - add the image here 
**A. Binary**
B. Balanced
C. Complete
D. Skeleton
E. None of the above

Question 2: What kind of tree is it?
@ykharitonova - add the image here
**A. Binary**
B. Balanced
C. Complete
D. Imbalanced
E. None of the above

Question 3: What kind of tree is it?
@ykharitonova - add the image here
A. Binary
**B. Balanced**
C. Complete
D. Imbalanced
E. None of the above

Question 4: What kind of tree is it?
@ykharitonova - add the image here
A. Binary
B. Balanced
C. Complete
D. Imbalanced
E. None of the above

Question 5: What kind of tree is it?
@ykharitonova - add the image here
A. Binary
B. Balanced
C. Complete
D. Imbalanced
E. None of the above

Question 6: What kind of tree is it?
@ykharitonova - add the image here
A. Binary
B. Balanced
**C. Complete**
D. Tree-like
E. None of the above

Question 7: What kind of tree is it?
@ykharitonova - add the image here
A. Binary
**B. Balanced**
C. Complete
D. Tree-like
E. None of the above

Question 8: Which tree property allowed us to implement a heap as a Python list?
A. Binary
B. Balanced
**C. Complete**
D. None of the above

# Binary Heaps
Binary Heap Structure Property:
- To guarantee logarithmic performance, we must keep our tree balanced
- A balanced binary tree has roughly the same number of nodes in the left and right subtrees of the root
- In our heap implementation we keep the tree balanced
@ykharitonova couldn't finish these notes and I don't see the slides in the folder

Heap Order Property:
- In a heap, for every node X with parent P, the key in P is smaller/greater than or equal to the key in X.
- Adding or removing an element requires swaps that help maintain the heap order property
- An item is added to the next available spot at the bottom level and swapped up if necessary
- When the root is deleted, the rightmost element from the bottom level takes its place and is then swapped down if necessary

Binary Heap Insertion Visualization: *refer to lecture slides* @ykharitonova is this sufficient

*Question: Does the insertion order of the elements affect the structure of the tree?*

### Student Questions
- Fill in the tree from left to right








