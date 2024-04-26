---
num: "Lecture 8"
desc: "Algorithm Analysis, Python List and Dictionary"
ready: true
lecture_date: 2024-02-06 15:30:00 -0700
---

[Slides folder]({{ site.slides_url }})

[Recorded video](https://www.loom.com/share/3510c8617d294f9abdd697eb8a782c35?sid=7d9793a0-3789-4bf5-b88d-c703525a4c6e)

# Plan for today

- Quick Notes
- Derive the Order of Magnitude (Big-O)
  - Using nested loops
  - using return and break to modify execution
  - using recursive functions 
  - iClicker questions
- Performance differences between Python Lists and Dictionaries
  - Underlying reasons
  - Differences in insertion, retrieval, removal

# Quick Notes
- When in a constructor, work with attributes directly
  - Don't use getters and setters
  - One exception is when you're extending a parent class
- Empty string, None, and "None" are not the same things
- Use regrade requests for any questions about graded artifacts
- Iclicker question: `'      Hello\n'.strip()` returns `'Hello'`
- Iclicker question: `[1,2,3].append(42)` returns `None`
  - Since lists are mutable, when we perform operations on the list, nothing gets returned
  - The exception to this is slicing lists

# Derive the Order of Magnitude (Big-O)
- For any loop: get the maximum number of its iterations
  - A single loop over N elements: O(N)
  - Two nested loops over N elements each: O(N^2)
  - Three nested loops over N elements each: O(N^3)
  - A loop that is independent of the number of elements runs in constant time, O(1) 
  - A loop that discards about half its input on each iteration, O (log n)
- Evaluate the runtime of the body of each block in the worst case 
  - Evaluate the runtime as the input size approaches infinity
  - Pay attention to any loop exits such as `return` and `break` statements, which shorten running time

# Time Complexity Iclicker Questions

### Question 1:
```py
def print_pair(n):
  for i in range(n):
	 for val in range(n):
		print(i, val) 
```


* O(n) - outer for `i` loop
* O(n) - innder for `val` loop
* O(1) - constant work to print two values
Because of the loop nesting:
Time complexity: O(n^2) = O(n) * O(n) * O(1)


### Question 2:
```py
def print_pair(n):
  for i in range(n):
	 for val in range(n*n):
		print(i, val) 
```

Time complexity: O(n^3)
* O(n) - outer for `i` loop
* O(n^2) - inner for `val` loop (because of `n*n`)
* O(1) - constant work to print two values
Because of the loop nesting:
Time complexity: O(n^3) = O(n) * O(n^2) * O(1)

### Question 3
```py
def print_pair(n):
  for i in range(n):
	 for val in range(n):
		print(i, val) 

for num in range(0, 1000):
  print_pair(num)
```

Even though the for loop runs in constant time, its body runs in quadratic as we saw earlier.

However, because this specific algorithm is driven by `num`, which is constant, the entire algorithm is constant `O(1)`.

As a sanity check, if we were to plug our nested `for` loops from the function into the `for num in range(0, 1000):` loop, we'll see that the `n` in those loops becomes fixed to 1000 as its max value.


### Question 4:
```py
def print_pair(n):
  for i in range(n):
	 if i == 100:
		break
	 for val in range(n):
		print(i, val) 
```
Rememeber: `break` gets us out of the innermost loop that it is housed in.
* O(1) - outer `for i` loop, because as soon as `i == 100` the outer loop stops because of the `break` (in the worst case, it is independent of the input it receives)
* O(n) - inner `for val` loop (because it runs proportionally to `n` for the first 100 iterations)
* O(1) - constant work to print two values
Because of the loop nesting:
Time complexity: O(n) = O(1) * O(n) * O(1)

### Question 5:
```py
def print_pair(n):
  for i in range(n):
	 if i == 100:
		break
	 print(“*”*i)
  for val in range(n):
	 print(i*val) 
```

* O(1) - the first `for i` loop, because as soon as `i == 100` the loop stops (in the worst case, it is independent of the input it receives)
* O(n) - the second `for val` loop (because it runs proportionally to `n`), after the `for i` finishes its execution 
* O(1) - constant work to print two values (`i` remains set to 100 because that's the value that broke us out of the first for loop)

Because of the loop sequencing:
Time complexity: O(n) = O(1) + O(n)

### Question 6:
```py
def print_pair(n):
  for i in range(n):
	 if i == 100:
		return
 	 print(“*”*i)
  for val in range(n):
	 print(i*val) 
```

Time complexity: O(1)
* O(1) - the first for `i` loop, because as soon as `i == 100` the loop _and the entire function_ stops due to the `return` (in the worst case, it is independent of the input it receives)


### Question 7:
```py
def print_pair(n):
  i = 0
  for j in range(n):
	 while i < j:
		print(i, j) 
		i += 1
```

Time complexity: 

### Question 8:
```py
def print_pair(n):
  i = 0
  for j in range(n):
	 while i <= j:
		print(i, j) 
		i += 1
  	 i = 0
```

Time complexity: 

### Question 9:
```py
def print_pair(n):
  for i in range(n):
	 for j in range(n, 0, -1):
		if i == j:
			break
		print(i, val) 
```

`break` gets us out of the innermost loop


Time complexity:   O(n^2)


### Student questions
- When dividing the input by half, why is the O notation O(log n) instead of O(n/2)?
- How is the execution of Question 5 different to Question 4
- For question 5, what is i in the second for loop 

# Python Lists Vs Dictionaries Demo
```py
```


