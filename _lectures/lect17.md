---
num: "Lecture 17"
desc: "Trees, Priority Queues, Heaps"
ready: true
lecture_date: 2024-05-28 15:30:00 -0700
---

# Plan for today
- iClicker: review trees terminology
- Difference between Binary Trees and Binary Search Trees
- BST Property
- How to construct a BST given a set of numbers. Does the insertion order matter?
- 3 main traversal algorithms. What are their steps and corresponding results?
- BST vs Heap
- BST implementation

# Tree Terms
- Node - An element in the tree. May have an incoming edge and at most two outgoing edges.
- Edge - A connection between nodes
- Root - The topmost node
- Parent - Contains outgoing edges to other child nodes
- Child / Children - Nodes that have incoming edges from another node
- Sibling - Nodes that have the same parent
- Leaf - A node without any outgoing edges
- Subtree - A tree structure where the root of the tree is a child of a parent
- Path - The sequence of nodes from one node to a destination node along the tree
- Level - Number of edges from the root node to a destination node
- Height - Maximum level of the entire tree

# Tree Properties
- Binary Tree: Any node may have at most two children.
- Balanced Binary Tree: The left and right subtrees of every node differ in height by no more than 1.
- Complete Tree: A binary tree where every level of the tree, except the deepest, must contain as many nodes as possible. The deepest level must have all nodes to the left (as possible).

# Binary Trees vs Binary Search Trees
- Binary Trees: a tree structure where a node may have at most two children
  - **Cannot** be guaranteed to be balanced
- BST: binary trees that have the BST property
  - Not guaranteed to be balanced
  - Insertion order into a BST affects tree structure
- BST Property:
  - Values that are less than the parent are in the left subtree
  - Values that are greater than the parent are in the right subtree
 
# Nodes and References
- Binary trees store nodes (like with linked lists)
- Each node has a `left_child` and `right_child` link (unlike linked lists)

# Map ADT
- Can be implemented using BSTs: maps keys to corresponding values
- Keys define where in the BST structure a node is inserted
- Each node has a corresponding value field
- Similar to dictionaries in Python

# Tree Traversal Algorithms
- A way to visit all nodes in a tree
- Three common recursive ways to traverse:
  - Preorder: N, L, R. Visit node, recursively go down left subtree, recursively go down right subtree
  - Inorder: L, N, R. Recursively go down left subtree, visit node, recursively go down right subtree
  - Postorder: L, R, N. Recursively go down left subtree, recursively go down right subtree, visit node
 
The name of the traversal method tells you when the node that you are visiting should be printed:
- pre-order: (pre-) means that the node is printed first (_before_ printing the left and right subtree)
- in-order: (in-) means that the node is printed **in**-between printing the left and right subtree
- post-order: (post-) means that the node is printed last, after the children (post printing the left and right subtree)

# Heap
- MaxHeap: the value of any node is never less than the value of its children
  - another way to say it is: the value of any node is always greater than the value of its children
  - the max value is always at the root
- MinHeap: the value of a node is never greater than the value of its children
  - another way to say it is: the value of any node is always smaller than the value of its children
  - the min value is always at the root
 
By repeatedly removing the elements from a heap, we retreive them in **sorted** order.

Printing the values in a BST using inorder traversal, prints them in **sorted** order. Note: This is not the case for regular binary trees.
