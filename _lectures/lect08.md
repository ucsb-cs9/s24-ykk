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
- Question 1:
```py
```

Time complexity: O(n^2)

- Question 2:
```py
```

Time complexity: O(n^3)

- Question 3
```py
```

Time complexity: O(n^2)

- Question 4:
```py
```

Time complexity: 

- Question 5:
```py
```

Time complexity: O(n)

- Question 6:
```py
```

Time complexity: O(1)

- Question 7:
```py
```

Time complexity: 

- Question 8:
```py
```

Time complexity: 

- Question 9:
```py
```

Time complexity:   O(n^2)


### Student questions
- When dividing the input by half, why is the O notation O(log n) instead of O(n/2)?
- How is the execution of Question 5 different to Question 4
- For question 5, what is i in the second for loop 

# Python Lists Vs Dictionaries Demo
```py
```


