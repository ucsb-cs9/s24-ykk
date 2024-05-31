---
num: "Lecture 18"
desc: "Binary Search Trees"
ready: true
lecture_date: 2024-05-30 15:30:00 -0700
---

# Plan for today
- Sample final exam
- Questions about lab08 and other reminders
- BST implementation


# Sample Final Exam

Use it as supplemental material, don't base your studying solely on the topics in this document:
<https://drive.google.com/file/d/1Do_4egncKDoNGJjP_hPxGMApjiOmR5lT/view?usp=drive_link>

As you can see, many of the questions are based on the in-class activities that we've done over the course of the quarter.

Final will be cumulative, so previous topics such as the Big-O and recursion are likely to show up on the exam as well.

# Questions about lab08

Q: For the lab, are we doing what the book is doing, using a list of lists?

A: Yes, but it's not identical to how the book is doing it. 

Q: For the lab, if two apartments have the same size/location, do you add them to the same tree node?

A: Yes, each node has an associated size and location, and it will hold all the apartments with that size and location in a list. In addition, make sure to fully read the lab description and use the provided tree printing method which prints the tree for you. (note that it prints sideways, so that that the right side is at the top and left side is at the bottom, and the tree descends towards the right)

Reminder about abstract data types (ADTs):
- they implement a data type without giving you the implementation details
In the case of lab08, the ApartmentListing class is implementing a map. Remember a map has a key and value.
- Key is the combination of location and size
- Value is list of all the apartments that have a matching location and size

Writing tests and looking at visualizations of the tree will be especially important for this lab

# BSTs

Practice inserting nodes into the BST yourself on paper, and then think about what decisions you're making as you go through the insertion procedure. This will help you think of the algorithm.

Minimum components of a TreeNode:
- key
- value or payload
- parent reference
- left child reference
- right child reference

References should be initialized to None (because by default a TreeNode isn't connected to anything). But you do always need a key and a value to create the node.

Implementation of a generic TreeNode with lots of methods:
```
class TreeNode:
  def __init__(self, key, val, parent = None, left = None, right = None):
    self.key = key
    self.payload = val
    self.parent = parent
    self.left = left
    self.right = right

  # methods to get a left and right child:
  def has_left_child(self):
    return self.left

  def has_right_child(self):
    return self.right

  # what about checking if a node is a left (or right) child?
  # check self's parent and look at the parent's left (or right) child. if it's self, then self is a left (or right) child
  # but first we have to make sure that self.parent exists (is not None).
  # if self.parent is None, we're trying to say None.left and None.right which will give an error
  def is_left_child(self):
    return self.parent and self.parent.left == self 
  def is_right_child(self):
    return self.parent and self.parent.right == self 

  # return True if self is a root (no parent) and False if self is not a root (has parent)
  # if self.parent is None it will be False, so not self.parent returns True.
  # if self.parent references another TreeNode it will be True, so not self.parent returns False
  def is_root(self):
    return not self.parent

  # return True if self is a leaf (no left or right child) and False otherwise
  def is_leaf(self):
    return not (self.right or self.left)

  def has_any_children(self):
    return self.left or self.right

  def has_both_children(self):
    return self.left and self.right

  # want to replace the data in a Node (it's value)
  def replace_node_data(self, val, lc, rc):
    pass
```

Q: what does has_left_child() and has_right_child() return?

A: they return the values of the left and right attributes, which can be None or a TreeNode. But None evaluates to False and TreeNode evaluates to True in a boolean expression. So getting the left and right child also allows you to check whether the left and right children exist or not.

We can start testing the TreeNode class:
```
class TestTreeNode:
  def test_TreeNode(self):
    # ensure the code works with default constructors for references
    node = TreeNode(10, "ten")
    assert node.key == 10
    assert node.payload == "ten"
    assert node.left == None
    ...

```

Recall that linked list nodes have data and a reference to the next node.
The linked list itself has a single attribute, ```self.head```, which references the head of the linked list.
The equivalent of the linked list head is the bst root. So a bst object has a single attribure, ```self.root```, which references the root of the bst.

Let's define the BST class, which will hold the tree of TreeNodes:
```
class BST:
  def __init__(self):
    self.root = None # a reference to the root TreeNode
    self.size = 0 # no nodes to start with
```
Now let's insert into our BST.
Be careful. If there's nothing in the tree yet, then the root node should be the the new node. 
Otherwise, there is stuff in the tree, so you have to recursively branch through the tree to find an empty slot to put it in.

The following methods are part of the BST class defined above:
```
  def put(self, key, val):
    # non-empty tree - call helper function
    if self.root: 
      # the underscore in _put is python's way to hide a method.
      # a user shouldn't interact with this function directly,
      # but it helps a user-facing function (like put without the underscore) do its job.
      self._put(key, val, self.root)

    # empty tree: make the new TreeNode self.root
    else: 
      self.root = TreeNode(key, val)

    self.size += 1

  # helper method to branch down the tree (recursively) until you reach a place to insert the new node
  def _put(self, key, val, current):

    # the key we have is smaller than the current TreeNode's key.
    # so the node we want to insert belongs to the left of the current node
    if key < current.key:

      # if current has a left child, then we need to look down the left subtree to find a space
      # to put our new node, so make a recursive call to _put on current's left child
      if current.has_left_child(): 
        self._put(key, val, current.left)

      # no left child, so we can just make our new node as the current node's left child.
      # our new node should have no children. it's parent should be current.
      # current's left child has to be set to reference this new TreeNode.
      else: 
        current.left = TreeNode(key, val, parent=current)

    # the key we have is greater than the current TreeNode's key.
    # so the node we want to insert belongs to the RIGHT of the current node
    else:

      # just like the less-than case but now it's the right side. we need to check if current has a right child
      if current.has_right_child(): 
        self._put(key, val, current.right)

      # no right child, so we can just make our new node as the current node's right child
      # same as the less-than case, but with right instead of left
      else: 
        current.right = TreeNode(key, val, parent=current)
```

Now let's test our put method:
```
class TestBST:
  def test_root(self):
    # create and check an empty BST
    mytree = BST()
    assert mytree.root == None
    assert mytree.size == 0

    # add our first TreeNode and check that the BST's root is the new TreeNode
    mytree.put(18, "18")
    assert mytree.root.key == 18
    assert mytree.root.payload == "18"
    assert mytree.size == 1
    assert mytree.root.is_root()
    assert mytres.root.has_left_child() == None
    assert mytres.root.has_right_child() == None

  def test_left_child(self):
    mytree = BST()
    mytree.put(18, "18")
    mytree.put(16, "16")

    # if all went well, 18 should be our root and 16 should be it's left child.
    # that means the root should have a left child with key 16 and value "16", and not have a right child
    assert mytree.root.has_right_child() == None
    assert mytree.root.has_left_child()
    assert mytree.root.left.key == 16
    assert mytree.root.left.payload == "16"
```

More tips for the lab:

Take small, iterative steps when testing. Add apartments one at a time. For example, check that you can successfully add a root. Then add a single left child. Then try adding a single right child instead. Then you can add more children, for example we can check what happens if you insert nodes such that you have a root, a right child node, and that node also has a right child:

```
def test_right_child_node(self):
  mytree = BST()
  mytree.put(18, "18")
  mytree.put(28, "28")
  mytree.put(30, "30")
  assert mytree.root.right.right.key == 30
```

The next step will be to write a get method to find arbitrary nodes in a tree. (Not covered in today's lecture)
