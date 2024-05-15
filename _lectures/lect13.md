---
num: "Lecture 13"
desc: "Sorting Algorithms"
ready: true
lecture_date: 2024-05-07 15:30:00 -0700
---

# In-class activity: sorting algorithm excerises
[54, 26, 93, 17, 77, 31, 44, 55, 20]

Bubble sort:
- Pass 1: [26, 54, 17, 77, 31, 44, 55, 20, 93]
- Pass 2: [26, 17, 54, 31, 44, 55, 20, 77, 93]
- Pass 3: [26, 17, 31, 44, 54, 20, 55, 77, 93]
- Pass 4: ...
  
Selection sort:
- [54, 26, 20, 17, 77, 31, 44, 55, 93]
- [54, 26, 20, 17, 55, 31, 44, 77, 93]
- ...

# Bubble Sort
```py
def bubbleSort(alist):
  for passnum in range(len(alist)-1, 0, -1):
    printf("{passnum = }")
    for i in range(passnum):
      if i == 3:
        break
      if alist[i] > alist[i+1]:
        temp = alist[i]
        alist[i] = alist[i+1]
        alist[i+1] = temp
    print(alist)
```

# Insertion Sort
```py
def insertionSort(alist):
  for index in range(1, len(alist)):
    print("pass", index)
    currentvalue = alist[index]
    position = index

    while position > 0 and alist[position-1]>currentvalue:
      print("Comparing ", alist[position-1], currentvalue)
      alist[position] = alist[position-1]
      position = position-1

    alist[position] = currentvalue
    print(alist)
```

# Class examples
```py
class Pet:
  def __init__(self, name, animal, rating):
    """
    :param str name: - name of pet
    :param str animal: - type of pet(eg: 'snake' > 'cat' > 'dog')
    :param str rating: - user rating ('meh' < 'ok' < 'ok' < 'nice' < 'awesome')
    """
    self.name = name
    self.animal = animal
    self.rating = rating

  def __repr__(self):
    animal_map = {'snake': 100, 'cat': 90, 'dog': 80}
    rating_map = {'meh': 0, 'ok': 1, 'nice': 2, 'awesome': 3}
    return f"Name {self.name}\nAnimal type: {self.animal} (animal_map[self.animal])\n \
      Rating: {self.rating} (rating_map[self.rating])"

  def __lt__(self, other):
    animal_map = {'snake': 100, 'cat': 90, 'dog': 80}
    rating_map = {'meh': 0, 'ok': 1, 'nice': 2, 'awesome': 3}

    if animal_map[self.animal] < animal_map[other.animal]:
      return True
    return False
  # or
  def __lt__(self, other):
    animal_map = {'snake': 100, 'cat': 90, 'dog': 80}
    rating_map = {'meh': 0, 'ok': 1, 'nice': 2, 'awesome': 3}

    if animal_map[self.animal] == animal_map[other.animal]:
      return rating_map[self.animal] < rating_map[other.animal]
    return animal_map[self.animal] < animal_map[other.animal]
```

# Student Questions
- Q: We have the two variables `passnum` and `i` in various sorting algorithms. What's the difference?
- A: `passnum` tells you which pass through the list you are in (eg: first pass through the list). `i` tells you which comparisons you are doing (eg: between two objects in a list).

- Q: For selection sort, could you sort by the smallest element and put it at the front instead?
- A: Yes! That's how we get insertion sort

- Q: Why do you include a backslash (\) in a return statement? 
- A: Backslashes are used to create a multiline return statement

- Q: Assert statements when using comparison operators
- A: You need to include parentheses to indicate order of operations
	- eg: `(pet1 < pet2) == true` instead of `pet1 < pet2 == true`
