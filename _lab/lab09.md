---
layout: lab
num: lab09
ready: true
desc: "Event Management - BST Deletion"
assigned: 2024-06-04 23:59:59.59-7
due: 2024-06-09 23:59:59.59-7
---

In this lab, you'll have the opportunity to practice:

* Defining classes in Python
* Implementing and applying the Binary Search Tree (BST) data structure
* Writing functions to delete nodes from BST
* Testing your functionality with pytest

**Note: In this lab, you need to fill-in the provided template and implement the assertions that cover all cases.**

Please read the lab in its entirety first, before starting on your implementation.


# Introduction

The goal for this lab is to write a program that will manage events/holidays for a business. Each node will store a `date` as a string attribute (key) and the `eventinfo` containing the event name as the corresponding value (payload). 

You will also need to write pytests in `testFile.py` verifying that your code works correctly. This lab writeup will provide some test cases for clarity, but the Gradescope autograder will run different tests than what is shown here.

_Use the visualization functions provided at the end of the writeup to help debug what the code is doing at every step._

# Instructions

You will need to create the following files:
* `EventNode.py` - Defines a BST Node class that includes all necessary fields for a BST node that stores the event data.
* `EventTree.py` - Defines an EventTree (BST) class that is an ordered collection of a set of events (ordered by date). 
* `testFile.py` - This file should contain your pytest functions that tests the overall correctness of your class definitions.

You should organize your lab work in its own directory. This way all files for a lab are located in a single folder. Also, this will be easy to import various files into your code using the `import / from` technique shown in lecture. 

# EventNode.py

Given the following template, fill-in the blanks as appropriate:
```py
# EventNode.py

class EventNode:
    def __init__(self, key, val, leftChild=None, rightChild=None, parent=None):
        self.date = ___
        self.eventinfo = ___
        self.left = ___
        self.right = ___
        self.parent = ___

    def has_left_child(self):
        return ___

    def has_right_child(self):
        return ___

    def is_left_child(self):
        return self.parent and self.parent.left == ___

    def is_right_child(self):
        return ___

    def is_root(self):
        return not ___

    def is_leaf(self):
        return ___

    def has_any_children(self):
        return ___

    def has_both_children(self):
        return ___

    def update_node_data(self, key, value, lc, rc):
        self.date = ___
        self.___ = value
        self.left = ___
        self.___ = ___ 
        if self.has_left_child():
            self.left.parent = self
        if self.has_right_child():
            self.___ = ___

    def find_min_successor(self):
        # the smallest child in the right subtree - not doing the other case
        if self.right:
            current = ___
            while current.___:
                current = ___.___
            return ___

    def splice_out(self):
        # if the node is a leaf
        if self.___():
            if self.is_left_child():
                self.parent.___ = None
            else:
                self.___.___ = ___
        elif self.has_any_children():
            # in the BST deletion the node that is being
            # spliced out is the left node (the min value)
            # and should have only the right child
            """ # NOT USING THIS CODE FROM THE BOOK, refer to it to fill out the code at the bottom
            if self.left:
                if self.is_left_child():
                    self.parent.left = self.left
                else:
                    self.parent.right = self.left
                self.left.parent = self.parent
            else:
                if self.is_left_child():
                    self.parent.left = self.right
                else:
                    self.parent.right = self.right
                self.right.parent = self.parent
            """
            self.parent.___ = self.___
            self.___.parent = self.___

```


# EventTree.py

```python
#EventTree.py

from ___ import ___

class EventTree:
    def __init__(self):
        self.___ = ___ # A BST just needs a reference to the root node
        self.size = 0 # Keeps track of number of nodes

    def length(self):
        return self.___

    def put(self,key,val):
        if self.root:
            self._put(key, val, self.___)
        else: # there's no root, so add the first node
            self.root = ___(key, val)
        self.___ = self.___ + 1

    # helper method to recursively walk down the tree
    def _put(self, key, val, currentNode):
        if key < currentNode.___:
            if currentNode.___(): # check if there's already a smaller node
                self._put(key,val,currentNode.left)
            else: # no smaller node exist, so create a new one
                currentNode.left = ___(key,val,parent=currentNode)
        else: # need to add to the right subtree
            if currentNode.has_right_child():
                self._put(key,val,currentNode.right)
            else:
                currentNode.___ = EventNode(key,val,parent=___)


    def get(self,key): # returns eventinfo for key if it exists
        if self.root:
            res = self._get(key,self.root)
            if res:
                return res.eventinfo
        # otherwise, returns None

    # helper method to recursively walk down the tree
    def _get(self,key,currentNode): 
            if not currentNode:
                return None
            elif currentNode.___ == key:
                return ___
            elif key < currentNode.___:
                return self._get(key,currentNode.left)
            else:
                return self._get(key,currentNode.___)

    def delete(self,key):
        if self.size > 1:
            nodeToRemove = self._get(key,self.root)
            if nodeToRemove:
                self.remove(___) # remove modifies the tree
                self.size = self.size-1
            else:
                return 'KeyError'
        elif self.size == 1 and self.root.___ == key:
            self.root = ___
            self.size = self.size - 1
        else:
            return 'KeyError'


    # Used to remove the node and account for BST deletion cases
    def remove(self, currentNode):
        # Case 1: Node to remove is leaf
        if currentNode.is_leaf():
            if currentNode == ___:
                currentNode.parent.left = None
            else:
                currentNode.parent.right = None

        # Case 2: Node to remove has one child
        elif not currentNode.has_both_children():
            # Node has leftChild
            if currentNode.___():
                if currentNode.is_left_child():
                    currentNode.___.parent = currentNode.parent
                    currentNode.___.left = currentNode.left
                elif currentNode.is_right_child():
                    currentNode.left.parent = currentNode.___
                    currentNode.parent.right = currentNode.___
                else: # currentNode is the Root with the left child
                    currentNode.update_node_data(currentNode.left.___,
                            currentNode.left.___,
                            currentNode.left.left,
                            currentNode.left.right)            
            # Node has rightChild
            else:
                if currentNode.is_left_child():
                    currentNode.right.___ = currentNode.parent
                    currentNode.parent.___ = currentNode.right
                elif currentNode.is_right_child():
                    currentNode.right.___ = currentNode.parent
                    currentNode.parent.___ = currentNode.right
                else: # currentNode is the Root with the right child
                    currentNode.update_node_data(currentNode.___.___,
                            currentNode.___.___,
                            currentNode.right.left,
                            currentNode.right.right)

        else:
            # Case 3: Node to remove has both children
            # Need to find the successor, remove successor, and
            # replace currentNode with successor's data / eventinfo
            succ = currentNode.find____()
            succ.___()
            currentNode.___ = succ.___
            currentNode.___ = succ.eventinfo

    def inorder(self):
        result = ""
        if self.root:
            result += ...
        return result

    def _inorder(self, node):
        if node == None:
            return ""
        else:
            return ...

def show_tree(node):
    import sys
    from io import StringIO
    old_stdout = sys.stdout
    sys.stdout = StringIO()

    if node is None:
        print("No events in the tree.")
    else:
        print("Showing Tree Representation of Events\n")
        _print_tree(node, 0, "")
        print("\nEnd of the event listing. \n")
    print("\n" + "="*50 + "\n")
    contents = sys.stdout.getvalue()
    sys.stdout = old_stdout
    print(contents)

def _print_tree(node, level, position):
    if node is not None:
        _print_tree(node.right, level + 1, position + "R")
        event_details = f"{node.date} : {node.eventinfo}"
        print("   " * level + f"|---- (Level {level}) {position if position else '*'} \n{event_details}")
        _print_tree(node.left, level + 1, position + "L")

if __name__ == "__main__":
    tree = EventTree()
    # Adding some events
    tree.put("0704", "Independence Day")
    tree.put("0607", "Final day of S24 instruction")
    tree.put("0616", "Commencement")
    tree.put("0101", "New Year's Day")
    tree.put("1225", "Christmas Day")
    tree.put("1031", "Halloween")
    tree.put("0317", "St. Patrick's Day")
    
    # Displaying the initial tree
    show_tree(tree.root)
    """
Showing Tree Representation of Events

   |---- (Level 1) R 
1225 : Christmas Day
      |---- (Level 2) RL 
1031 : Halloween
|---- (Level 0) * 
0704 : Independence Day
      |---- (Level 2) LR 
0616 : Commencement
   |---- (Level 1) L 
0607 : Final day of S24 instruction
         |---- (Level 3) LLR 
0317 : St. Patrick's Day
      |---- (Level 2) LL 
0101 : New Year's Day

End of the event listing. 
    """

    tree.delete("0704")
    show_tree(tree.root)
    """
Showing Tree Representation of Events

   |---- (Level 1) R 
1225 : Christmas Day
|---- (Level 0) * 
1031 : Halloween
      |---- (Level 2) LR 
0616 : Commencement
   |---- (Level 1) L 
0607 : Final day of S24 instruction
         |---- (Level 3) LLR 
0317 : St. Patrick's Day
      |---- (Level 2) LL 
0101 : New Year's Day

End of the event listing.
    """

```

An example of the `inorder()` string format is given below:

```python
    print(tree.inorder()) # ' 0101  0317  0607  0616  1031  1225 '
```



# testFile.py

This file should test all of your classes and required methods using pytest. Think of various scenarios and edge cases when testing your code according to the given descriptions. You should test every class' method functionality. Even though Gradescope will not use this file when running automated tests (there are separate tests defined for this), it is important to provide this file with various test cases (testing is important!!). 

**Hint: use the traversal methods (inorder, preorder and/or postorder) to test different tree structures.**


