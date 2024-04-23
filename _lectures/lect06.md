---
num: "Lecture 6"
desc: "Inheritance, Midterm review, Asymptotic Behavior"
ready: true
lecture_date: 2024-04-18 15:30:00.00-7:00
---

* [Slides folder]({{ site.slides_url }}){:target="_blank"}

# Plan for today
- Review the past 3 weeks using a practice midterm
New for today:
- Discuss [Algorithm Analysis](https://runestone.academy/ns/books/published/pythonds/AlgorithmAnalysis/WhatIsAlgorithmAnalysis.html)
- Work through algorithm examples
- Review [Recursion](https://runestone.academy/ns/books/published/pythonds/Recursion/WhatIsRecursion.html)


# Midterm Review

### Student Questions
When a parent and child class have the same method and you call that method on an instance of the child class, which version of the method runs first?

# Algorithm Analysis

* There are many ways we can try to estimate an algorithm
* For example, we can benchmark the algorithm by calculating the time it takes for something to run
* We can do this in Python using some code:

```
import time

def function_timing(func_name, func_param):
    print("Starting", func_name)
    start = time.time()
    func_name(func_param)
    end = time.time()
    return end - start

def list_insert(total):
    num_list = []
    for num in range(total):
        num_list.insert(0, num)

def list_append(total):
    num_list = []
    for num in range(total):
        num_list.append(num)

num_items = 100
print(f"Testing functions using {num_items} elements")

f1_time = function_timing(list_insert, num_items)
print("list_insert:", f1_time)

f2_time = function_timing(list_append, num_items)
print("list_append:", f2_time)
```

* What are the problems of this approach?

## Asymptotic Behavior
* We want to analyze approximately how fast an algorithm runs when the size of the input approaches infinity
* So instead of calculating the raw time of how fast the algorithm runs on our computers, we can approximate the number of instructions the algorithm will take with respect to the size of the input
* See how the different functions look as we increase the N: <https://science.slc.edu/~jmarshall/courses/2002/spring/cs50/BigO/index.html>


## Recursion
* Recursion is when a function contains a call to itself
* Recursive solutions iteratively call themselves with a smaller input until a base case is reached

A simple recursive function:
```
def count(n):
    if n == 0:
        print("Hello!")
    else:
        print(n)
        count(n-1)
```

Call it using `count(3)` to see it produce:
```
3
2
1
Hello!
```

How can we modify this function to now output the following?
```
3
2
1
Hello!
1
2
3
```

You might find it helpful to run through this example in Python Tutor to see the state of the function calls and the arguments that they are called with.
