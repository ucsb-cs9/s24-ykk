---
num: "Lecture 16"
desc: "Trees, Priority Queues, Heaps"
ready: true
lecture_date: 2024-05-23 15:30:00 -0700
---

[Slides folder]({{ site.slides_url }})

# Lecture 15 information was recorded and sent out via the Canvas announcement


# Plan for today
- Review the different types of trees
- How to construct a heap given a set of numbers?

# Identifying types of trees - Iclicker
Question 1: What kind of tree is it?

(see the slides for an example)
```
**A. Binary**
B. Balanced
C. Complete
D. Skeleton
E. None of the above
```

Question 2: What kind of tree is it?

(see the slides for an example)
```
**A. Binary**
B. Balanced
C. Complete
D. Imbalanced
E. None of the above
```

Question 3: What kind of tree is it?

(see the slides for an example)
```
A. Binary
**B. Balanced**
C. Complete
D. Imbalanced
E. None of the above
```

Question 4: What kind of tree is it?

(see the slides for an example)
```
A. Binary
B. Balanced
C. Complete
D. Imbalanced
E. None of the above
```

Question 5: What kind of tree is it?

(see the slides for an example)
```
A. Binary
B. Balanced
C. Complete
D. Imbalanced
E. None of the above
```

Question 6: What kind of tree is it?

(see the slides for an example)
```
A. Binary
B. Balanced
**C. Complete**
D. Tree-like
E. None of the above
```

Question 7: What kind of tree is it?

(see the slides for an example)
```
A. Binary
**B. Balanced**
C. Complete
D. Tree-like
E. None of the above
```

Question 8: Which tree property allowed us to implement a heap as a Python list?
```
A. Binary
B. Balanced
**C. Complete**
D. None of the above
```

# Binary Heaps
Binary Heap Structure Property:
- To guarantee logarithmic performance, we must keep our tree balanced
- A balanced binary tree has roughly the same number of nodes in the left and right subtrees of the root
- In our heap implementation we keep the tree balanced
- A complete binary tree is a tree in which each level has all of its nodes. 
  -The exception is the bottom level of the tree, which we fill in from left to right.
  - can represent it using a single list
  - because the tree is complete, if a parent is at position P, 
    - its left child is found in position 2P in the list
    - its right child is found in position 2P + 1 in the list


Heap Order Property:
- In a heap, for every node X with parent P, the key in P is smaller/greater than or equal to the key in X.
- Adding or removing an element requires swaps that help maintain the heap order property
- An item is added to the next available spot at the bottom level and swapped up if necessary
- When the root is deleted, the rightmost element from the bottom level takes its place and is then swapped down if necessary

Binary Heap Insertion Visualization: *refer to lecture slides for a visual representation of the heap* 

Resulting list is: `0 88 80 63 75 59 13 38 25 52 50`

Delete the root (`88`) from the heap above. 

Resulting list is:  `0 80 75 63 52 59 13 38 25 50`

*Question: Does the insertion order of the elements affect the structure of the tree?*

Practice inserting the elements and either perculating up (during the insertion) or perculating down (during the deletion).

- Fill in the tree from left to right








