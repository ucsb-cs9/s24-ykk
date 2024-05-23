---
layout: lab
num: lab08
ready: true
desc: "Apartment Listing Manager - BST"
assigned: 2024-05-21 23:59:59.59-7
due: 2024-05-28 23:59:59.59-7
---

In this lab, you'll have the opportunity to practice:

* Defining classes in Python
* Overloading the `==`, `<`, and `>` operators in a Python class
* Implementing and applying the Binary Search Tree (BST) data structure
* Writing functions that ensure Apartment objects are in sorted order
* Testing your functionality with pytest

**Note: It is important that you start this lab early so you can utilize our office hours to seek assistance / ask clarifying questions during the weekdays before the deadline if needed.**

# Introduction

The goal for this lab is to write a program that will manage apartment listings for a real estate agency. Each apartment has attributes such as location, size (in square feet), number of bedrooms, and rent. These attributes can be used to compare and determine the value of apartments relative to one another. All apartment listings will be managed by a Binary Search Tree (BST) where nodes are sorted first by location in ascending order (lexicographical order), then by size. Within each node with the same location/size, `Apartment` objects will be grouped in a Python List based on their **order of insertion**.

In order to manage the apartments for this lab, you will define `Apartment`, `ApartmentListingNode` and `ApartmentListing` classes that organize the Apartments in a BST data structure. Apartments with the same location/size will be located in the same node, and appended to a list based on insertion order.

You will also write pytests in `testFile.py` illustrating your behavior works correctly. This lab writeup will provide some test cases for clarity, but the Gradescope autograder will run different tests shown here.

# Instructions

You will need to create four files:
* `Apartment.py` - Defines an Apartment class. This class will assume all Apartments have attributes like `location` (str), `size` (int), `number of bedrooms` (int), and `rent` (int).
* `ApartmentListingNode.py` - Defines a BST Node class that includes all necessary fields for a BST node and a Python List collection of Apartment objects, where each node might hold multiple apartments with identical location and size.
* `ApartmentListing.py` - Defines an ApartmentListing (BST) class that is an ordered collection of a real estate agency’s Apartment listings. You can adapt the BST implementation shown in the textbook to support the specifications in this lab. 
* `testFile.py` - This file will contain your pytest functions that tests the overall correctness of your class definitions.

There will be no starter code for this assignment, but rather class descriptions and required methods are defined in the specification below. **You may also write additional helper methods wherever required.**

You should organize your lab work in its own directory. This way all files for a lab are located in a single folder. Also, this will be easy to import various files into your code using the `import / from` technique shown in lecture. 

# Apartment.py

The `Apartment.py` file will contain the definition of an `Apartment` class. The `Apartment` class will hold information about apartments (`location`, `size`, `bedrooms`, and `rent`). We will define the `Apartment` attributes as follows:

* `location` - string value representing the address or area of the apartment (e.g., `Downtown`, `Suburbs`). Your program must store this attribute in uppercase characters.

* `size` - integer value representing the square footage of the apartment (e.g., 800, 1200, 1500).

* `bedrooms` - integer value representing the number of bedrooms in the apartment (e.g., 1, 2, 3).

* `rent` - integer value representing the monthly rental price of the apartment (e.g., 1000, 1500, 2000).

You will write a constructor that allows the user to construct an `Apartment` object by passing in values for `location`, `size`, `bedrooms`, and `rent`.

* `__init__(self, location, size, bedrooms, rent)`

In addition to the constructor, the following comparator methods are required to be implemented to manage the sorting within a data structure like a Binary Search Tree (BST):

* `__gt__(self, rhs)` - comparator operator that allows checking if an `Apartment` object is greater than another `Apartment` object. `Apartment `objects are first organized by the lexicographical/alphabetical order of their `location`. If the `location` is the same, then they'll be determined by their `size`. If the `size` is the same, then they are organized by the `number of bedrooms`. If the `bedrooms` are the same, then they are organized by their `rent` (from least-to-greatest). For example, if both `Apt2` and `Apt1` have the same `location` and `size`, then `Apt2 > Apt1` if `Apt2` has more bedrooms; if `Apt2` and `Apt1` have the same number of bedrooms as well, then `Apt2 > Apt1` if `Apt2` has higher rent.

* `__lt__(self, rhs)` - __lt__(self, rhs) - comparator operator that allows checking that an Apartment object is less than another Apartment object via the operation `Apt1 < Apt2` according to the specifications above.

* `__eq__(self, rhs)` - comparator operator that checks if an `Apartment` object is equivalent to another `Apartment` (both apartments have the same `location`, `size`, `bedrooms`, and `rent`) via the operation `Apt1 == Apt2`

* `__str__(self)` - method that returns the details of an apartment via the operation `str(Apt1)`. The string representation should fit the format: "Location: [location], Size: [size] sqft, Bedrooms: [bedrooms], Rent: $[rent]".

For example:

```
a = Apartment("Downtown", 700, 2, 1000)
print(a)
```
**Output:**
```
Location: DOWNTOWN, Size: 700 sqft, Bedrooms: 2, Rent: $1000
```

# ApartmentListingNode.py

The `ApartmentListingNode.py` file contains the definition of the `ApartmentListingNode` class. This class acts as the node within a Binary Search Tree (BST) specifically designed for managing apartment listings. Each node in the tree organizes apartments based on their `location` and `size`.

The `ApartmentListingNode` class should have the following attributes:

* `location`: A string value representing the geographic location or address of the apartment. To ensure uniformity and facilitate sorting, the location is stored in uppercase.

* `size`: An integer indicating the square footage of the apartment.

* `apartments`: A Python list that contains `Apartment` objects. This list ensures that apartments sharing the same `location` and `size` are grouped together and stored in the order they were added.(most recently inserted `Apartment` will exist at the end of the Python List).

* `parent` - a reference to the parent of a `ApartmentListingNode`, `None` if it has no parent (it is the root).

* `left` - a reference to the left child of a `ApartmentListingNode`, `None` if it has no left child.

* `right` - a reference to the right child of a `ApartmentListingNode`, `None` if it has no right child.

The `ApartmentListingNode` class should define the following methods:

* `__init__(self, apartment)` - the constructor for the `ApartmentListingNode` will take in a `Apartment` object, and initialize all attributes in the `ApartmentListingNode`. The constructor should also append the parameter `Apartment` object from the parameter into the list attribute `apartments`.

In addition to the construction of the BST in this class, the following methods are required to be implemented:
* `get_location(self)` - returns a string containing the `location` of a `ApartmentListingNode`.

* `get_size(self)` - returns a string containing the `size` of a `ApartmentListingNode`.
* `get_parent(self)` - returns the `parent` Node of the `ApartmentListingNode`. If the parent does not exist, return `None`.
* `set_parent(self, parent)` - sets the `parent` Node of the `ApartmentListingNode`.
* `get_left(self)` - returns the left child of the `ApartmentListingNode`. If the left child does not exist, return `None`.
* `set_left(self, left)` - sets the left child of the `ApartmentListingNode`.
* `get_right(self)` - returns the right child of the `ApartmentListingNode`. If the right child does not exist, return `None`.
* `set_right(self, right)` - sets the right child of the `ApartmentListingNode`.
* `get_apartments(self)` - returns the `apartment` objects in the `apartments` list
* `__str__(self)` - overload the string operator to allow us to get the details of all apartmentss in the `ApartmentListingNode` (eg, `str(ApartmentNode1)`). The string representation should contain all the `Apartment` objects in this `ApartmentListingNode` in insertion order. Make use of the `Apartment` class' `__str__` method, and separate each apartment with a newline character (`\n`) (including the last `Apartment` object in the apartments Python List).

For example:

```
a = Apartment("Downtown", 700, 2, 1000)
b = Apartment("downtown", 700, 3, 2000)
anode = ApartmentListingNode(a)
anode.apartments.append(b)
print(anode)
```
**Output:** (note the extra newline)
```
Location: DOWNTOWN, Size: 700 sqft, Bedrooms: 2, Rent: $1000
Location: DOWNTOWN, Size: 700 sqft, Bedrooms: 3, Rent: $2000

```

Some tips for the implementation:

`ApartmentListingNode`s are ordered by `location` and `size` attributes. You *can* implement comparators (`<`, `==`, `>`) for `ApartmentListingNode` to help with navigating through the `ApartmentListing`, but this is not required.

# ApartmentListing.py

The `ApartmentListing.py` file will contain the definition of a `ApartmentListing` class. This will manage the `ApartmentListingNode`s and keep track of all the apartments a listing has. The `ApartmentListing` is implemented as a BST. The `ApartmentListing` will create and manage `ApartmentListingyNode` objects based on a apartment's `location` and `size` attributes. When storing `Apartment` objects in the `ApartmentListing`, `Apartment` objects with the same `location` and `size` will be appended to a Python List based on insertion order within the `ApartmentListingNode` object.

* `__init__(self)` - the constructor for the `ApartmentListing` will simply initialize the empty BST. You should have an attribute called `root` to represent the root node of the `ApartmentListing` BST.

In addition to the construction of the BST in this class, the following methods are required to be implemented:

* `add_apartment(self, apartment)` - adds an `Apartment` object to the BST. If a `ApartmentListingNode` with the same `location` and `size` exists, then append the apartment to the end of its apartment list.

* `does_apartment_exist(self, apartment)` - searches for an `apartment` object in the `ApartmentListing` by traversing to the appropriate `ApartmentListingNode` (if it exists), and checking the `apartments` Python List to see if any `Apartment` object is equal to the parameter `apartment`. This method returns `True` if it does, and returns `False` otherwise (i.e. no `Apartment` object with the same `location`, `size`, `bedrooms`, and `rent` exists).

* `inorder(self)` - returns a string with the in-order traversal of the BST. Printing the in-order traversal should help check that the apartments are in the correct order in the BST

* `preorder(self)` - returns a string with the pre-order traversal of the BST. BSTs with the same structure should always have the same pre-order traversal, so this can be used to verify that everything was inserted correctly

* `postorder(self)` - returns a string with the post-order traversal of the BST.

* `get_best_apartment(self, location, size)` - returns the `Apartment` with the most number of bedrooms - and if multiple, then the highest rent - given the location and size. If the location and size doesn't exist, then return None. **Note: The location and size are case insensitive and should be converted to upper case while searching**

* `get_worst_apartment(self, location, size)` - returns the `Apartment` with the least number of bedrooms - and if multiple, then the lowest rent - given the location and size. If the location and size doesn't exist, then return None. **Note: The location and size are case insensitive and should be converted to upper case while searching**

* `get_total_listing_price(self)` - returns an integer the total rent of all the apartments in the listing. 

Given an example BST:

```python
bst = ApartmentListing()

apt1 = Apartment("Mountain View", 900, 1, 2500)
apt1A = Apartment("Mountain View", 900, 2, 3000)
apt2 = Apartment("Northern Plaza", 1000, 3, 3500)
apt2A = Apartment("Northern Heights", 950, 2, 3000)
apt3 = Apartment("Ocean Side", 1100, 3, 3000)
apt4 = Apartment("Urban Center", 850, 1, 1000)
apt4A = Apartment("Urban Center", 850, 2, 3500)
apt5 = Apartment("Downtown", 750, 1, 1000)
apt6 = Apartment("Bayshore Retreat", 800, 2, 2800)
apt6A = Apartment("Bayshore Retreat", 850, 2, 1200)
apt7 = Apartment("Jasmine Riveria", 750, 2, 1800)

bst.add_apartment(apt1)
bst.add_apartment(apt1A)
bst.add_apartment(apt2)
bst.add_apartment(apt2A)
bst.add_apartment(apt3)
bst.add_apartment(apt4)
bst.add_apartment(apt4A)
bst.add_apartment(apt5)
bst.add_apartment(apt6)
bst.add_apartment(apt6A)
bst.add_apartment(apt7)


assert bst.does_apartment_exist(apt5) == True
assert bst.get_worst_apartment("Urban Center", 850) == apt4
assert bst.get_best_apartment("Urban Center", 850) == apt4A
assert bst.get_total_listing_price() == 26300
```

An example of the `inorder()` string format is given below:

```python
assert listing.inorder() == \
"""\
Location: BAYSHORE RETREAT, Size: 800 sqft, Bedrooms: 2, Rent: $2800
Location: BAYSHORE RETREAT, Size: 850 sqft, Bedrooms: 2, Rent: $1200
Location: DOWNTOWN, Size: 750 sqft, Bedrooms: 1, Rent: $1000
Location: JASMINE RIVERIA, Size: 750 sqft, Bedrooms: 2, Rent: $1800
Location: MOUNTAIN VIEW, Size: 900 sqft, Bedrooms: 1, Rent: $2500
Location: MOUNTAIN VIEW, Size: 900 sqft, Bedrooms: 2, Rent: $3000
Location: NORTHERN HEIGHTS, Size: 950 sqft, Bedrooms: 2, Rent: $3000
Location: NORTHERN PLAZA, Size: 1000 sqft, Bedrooms: 3, Rent: $3500
Location: OCEAN SIDE, Size: 1100 sqft, Bedrooms: 3, Rent: $3000
Location: URBAN CENTER, Size: 850 sqft, Bedrooms: 1, Rent: $1000
Location: URBAN CENTER, Size: 850 sqft, Bedrooms: 2, Rent: $3500
"""
```

An example of the `preorder()` string format is given below:

```python
assert listing.preorder() == \
"""\
Location: MOUNTAIN VIEW, Size: 900 sqft, Bedrooms: 1, Rent: $2500
Location: MOUNTAIN VIEW, Size: 900 sqft, Bedrooms: 2, Rent: $3000
Location: DOWNTOWN, Size: 750 sqft, Bedrooms: 1, Rent: $1000
Location: BAYSHORE RETREAT, Size: 800 sqft, Bedrooms: 2, Rent: $2800
Location: BAYSHORE RETREAT, Size: 850 sqft, Bedrooms: 2, Rent: $1200
Location: JASMINE RIVERIA, Size: 750 sqft, Bedrooms: 2, Rent: $1800
Location: NORTHERN PLAZA, Size: 1000 sqft, Bedrooms: 3, Rent: $3500
Location: NORTHERN HEIGHTS, Size: 950 sqft, Bedrooms: 2, Rent: $3000
Location: OCEAN SIDE, Size: 1100 sqft, Bedrooms: 3, Rent: $3000
Location: URBAN CENTER, Size: 850 sqft, Bedrooms: 1, Rent: $1000
Location: URBAN CENTER, Size: 850 sqft, Bedrooms: 2, Rent: $3500
"""
```

An example of the `postorder()` string format is given below:
```python
assert listing.postorder() == \
"""\
Location: BAYSHORE RETREAT, Size: 850 sqft, Bedrooms: 2, Rent: $1200
Location: BAYSHORE RETREAT, Size: 800 sqft, Bedrooms: 2, Rent: $2800
Location: JASMINE RIVERIA, Size: 750 sqft, Bedrooms: 2, Rent: $1800
Location: DOWNTOWN, Size: 750 sqft, Bedrooms: 1, Rent: $1000
Location: NORTHERN HEIGHTS, Size: 950 sqft, Bedrooms: 2, Rent: $3000
Location: URBAN CENTER, Size: 850 sqft, Bedrooms: 1, Rent: $1000
Location: URBAN CENTER, Size: 850 sqft, Bedrooms: 2, Rent: $3500
Location: OCEAN SIDE, Size: 1100 sqft, Bedrooms: 3, Rent: $3000
Location: NORTHERN PLAZA, Size: 1000 sqft, Bedrooms: 3, Rent: $3500
Location: MOUNTAIN VIEW, Size: 900 sqft, Bedrooms: 1, Rent: $2500
Location: MOUNTAIN VIEW, Size: 900 sqft, Bedrooms: 2, Rent: $3000
"""
```

# Debugging
As part of the debugging process, we are providing you two functions to visually represent the BST to ensure it looks similar to your thought. Make use of these carefully through multiple steps of your methods - For e.g. you can print out the visual representation of your subtree in each step of the recursion so that you can validate your theoretical assumption in action. If you want to call this method inside your call, you can do this by running `show_tree(self.root)` or `show_tree(node)` or `show_tree(apartment_listing_object.root)`. Below is the code snippet for the functions and the corresponding logic to see it in action - 

```python
def show_tree(node):
    import sys
    from io import StringIO
    old_stdout = sys.stdout
    sys.stdout = StringIO()

    if node is None:
        print("No apartments in listing.")
    else:
        print(f"Showing Tree Representation of Children under Node - Location: {node.get_location()}, Size: {node.get_size()}\n")
        _print_tree(node, 0, "")
        print("\nEnd of the apartment listing. \n")
    print("\n" + "="*50 + "\n")
    contents = sys.stdout.getvalue()
    sys.stdout = old_stdout
    print(contents)

def _print_tree(node, level, position):
    if node is not None:
        _print_tree(node.get_right(), level + 1, position + "R")
        # Print all apartments at this node
        apartments_details = "\n".join([f"{apartment.location} : {apartment.size} sqft : {apartment.bedrooms} - ${apartment.rent}" for apartment in node.get_apartments()])
        print("   " * level + f"|---- (Level {level}) {position if position else '*'} \n{apartments_details}")
        _print_tree(node.get_left(), level + 1, position + "L")
       

if __name__ == "__main__":
    listing = ApartmentListing()
    # Adding some apartments
    listing.add_apartment(Apartment("Mountain View", 900, 1, 2500))
    listing.add_apartment(Apartment("Mountain View", 900, 2, 3000))
    listing.add_apartment(Apartment("mountain view", 900, 2, 2000))
    listing.add_apartment(Apartment("Northern Plaza", 1000, 3, 3500))
    listing.add_apartment(Apartment("Northern Plaza", 1000, 2, 3000))
    listing.add_apartment(Apartment("Ocean Side", 1100, 3, 3000))
    listing.add_apartment(Apartment("Urban Center", 850, 1, 1000))
    listing.add_apartment(Apartment("Urban Center", 850, 2, 3500))
    listing.add_apartment(Apartment("Downtown", 750, 1, 1000))
    listing.add_apartment(Apartment("Bayshore Retreat", 850, 2, 2800))
    listing.add_apartment(Apartment("Bayshore Retreat", 850, 2, 1200))
    listing.add_apartment(Apartment("Jasmine RIveria", 750, 2, 1800))
    listing.add_apartment(Apartment("JASMINE Riveria", 750, 2, 1800))

    # Displaying the inventory
    show_tree(listing.root)
```

The output for this should look like this - 

```
Showing Tree Representation of Children under Node - Location: MOUNTAIN VIEW, Size: 900

         |---- (Level 3) RRR 
URBAN CENTER : 850 sqft : 1 - $1000
URBAN CENTER : 850 sqft : 2 - $3500
      |---- (Level 2) RR 
OCEAN SIDE : 1100 sqft : 3 - $3000
   |---- (Level 1) R 
NORTHERN PLAZA : 1000 sqft : 3 - $3500
NORTHERN PLAZA : 1000 sqft : 2 - $3000
|---- (Level 0) * 
MOUNTAIN VIEW : 900 sqft : 1 - $2500
MOUNTAIN VIEW : 900 sqft : 2 - $3000
MOUNTAIN VIEW : 900 sqft : 2 - $2000
      |---- (Level 2) LR 
JASMINE RIVERIA : 750 sqft : 2 - $1800
JASMINE RIVERIA : 750 sqft : 2 - $1800
   |---- (Level 1) L 
DOWNTOWN : 750 sqft : 1 - $1000
      |---- (Level 2) LL 
BAYSHORE RETREAT : 850 sqft : 2 - $2800
BAYSHORE RETREAT : 850 sqft : 2 - $1200

End of the apartment listing. 


==================================================


```

Other than the required methods, feel free to implement any helper methods that you think are useful in your implementation (Gradescope will test the required methods). The automated tests will test your implementation of the required methods by creating a `ApartmentListing` containing various `ApartmentListingNode`s containing `Apartment`s with different `location`, `size`, `bedrooms`, and `rent` attributes. The `add_apartment()` method will be run, with `does_apartment_exist()`, `get_best_apartment()`, `get_worst_apartment()`, `inorder()`, `preorder()`, and `postorder()`, etc. being used to verify that the `ApartmentListing` is fully functional. You should write similar tests to confirm your BST is working properly.

# testFile.py

This file should test all of your classes and required methods using pytest. Think of various scenarios and edge cases when testing your code according to the given descriptions. You should test every class' method functionality. Even though Gradescope will not use this file when running automated tests (there are separate tests defined for this), it is important to provide this file with various test cases (testing is important!!). Here, examples of various test cases could be different tree structures.

**Hint: use the traversal methods (inorder, preorder and/or postorder) to test different tree structures**

**A note about Gradescope tests:** Gradescope will use your functions to correctly check the state of your Apartments and ApartmentListing with many scenarios. In order to test if everything is in the correct state, these tests use your ApartmentListing's `preorder` / `inorder` / `postorder` traversals and `add_apartment` methods, as well as getting the string representation of your Apartments (using your `__str__` overloaded method in `Apartment`) to run other tests such as ApartmentListing's `does_apartment_exist`, `get_best_apartment`, `get_worst_apartment`, `get_total_listing_price`, etc. It is important to ensure your `preorder` / `inorder` / `postorder` traversals, Apartment's `__str__` method, and `ApartmentListing`'s `add_apartment` methods work correctly first or else many of the other tests may not pass.

Of course, feel free to reach out / post questions on Piazza as they come up!

# How to best approach this lab

This lab contains a lot of implementation details, and different parts of the lab intertwine and depend on each other. Here are some suggestions on the order of approaching the lab:

1. Implement the `Apartment` class, and especially double check that your comparators are working
2. Implement the `ApartmentListingNode` class. You should go through and test your `__str__` overloading before moving on
3. Start with `add_apartment`, and then the BST traversal methods. You should test to see if your `add_apartment` is working by inserting several Apartments into the BST, and using the traversals to verify your results; is a new `ApartmentListingNode` being created if the Apartment didn't exist in the BST, and if the node did already exist, is the Apartment being inserted to the list of apartments in the node?
4. Once you've made sure your `add_apartment` is working, you can then move on to `does_apartment_exist`, `get_best_apartment` and `get_worst_apartment`.
5. Testing is extremely important to help debug any issues you may experience. Be sure to write thorough tests with various edge cases to make sure your program works as expected.

# Submission

Once you're done with writing your class definitions and tests, submit the following files to Gradescope's Lab08 assignment:

* `Apartment.py` 
* `ApartmentListingNode.py`
* `ApartmentListing.py`
* `testFile.py`

There will be various unit tests Gradescope will run to ensure your code is working correctly based on the specifications given in this lab.

If the tests don't pass, you may get some error message that may or may not be obvious at this point. Don't worry - if the tests didn't pass, take a minute to think about what may have caused the error. If your tests didn't pass and you're still not sure why you're getting the error, feel free to ask your TAs or Learning Assistants.