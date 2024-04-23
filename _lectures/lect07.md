---
num: "Lecture 7"
desc: "Recursion and Algorithm Analysis"
ready: true
lecture_date: 2024-04-23 15:30:00.00-7:00
---

* [Slides folder]({{ site.slides_url }}){:target="_blank"}

# Plan for Today
* Recursion review
* Algorithm analysis: Big-O
* Python lists vs. Python dictionaries

## Midterm Preparation
* OOP
* Inheritance
* Algorithm analysis
* Recursion
* Stacks, Queues, Deques, Linked Lists

## Recursion and Call Stack
```
def triple(num):
  return num + double(num)

def double(num):
  return 2 * num

print(triple(5))
```
* Calls are pushed onto the stack
* Recursion rules:
  * Base case
  * Each call moves towards the base case
  * Function has to call itself
 
## Time Complexity
* T(n): time it takes to solve a problem of size n
```
for val in range(10):
  print(val)
```
* T(n) = 2n

```
for x in range(n, 0, -1):
  x = x * x
```
* T(n) = 1 + (n-1) + (n-1) + (n-1) = 1 + 3(n-1)

* Big-O: Order of Magnitude: drop all constants
  * Asymptotic behavior
  * Only keep the biggest term
  * Ex: if T(n) = 1 + 3(n-1), then Big-O = O(n)

### Student Questions
