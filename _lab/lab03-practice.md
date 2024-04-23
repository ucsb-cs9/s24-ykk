---
layout: lab
num: lab03-practice
ready: ready
desc: "Recursion step-by-step (optional walkthrough)"
assigned: 2024-04-22 23:59:59.59-7
due: 2024-04-30 23:59:59.59-7
---

# Learning Goals

In this lab, you'll practice:

* Writing recursive functions based on a specification.
  - Define a base case (or cases)
  - Design the _next smallest input_ that would trigger a recursive case
  - Determine the actions that need to happen in the recursive case as well as how to reduce the input to get it to trigger the base case
* Practice writing pytests to ensure your recursive functions are correct.

Before you get started, make sure to read up on recursion, specifically **Chapter 4.2**.

<a name="top"></a>

> **Open the lab side-by-side with your code window, so that you don't need to scroll up and down to follow the instructions. Carefully read through the instructions top to bottom first, and then attempt to solve the function on your own, referring to the instructions when necessary.**

In this lab, you will:
* review the structure of a recursive function and steps for solving recursive problems.
* follow the lab's instructions to practice implementing a recursive function as a preparation for doing so on your own in the next labs.
* debug and visualize the recursive steps and variable values.

# Table of Contents
1. [Instructions](#instructions)
1. [Questions to ask when solving recursion ](#questions)
1. [Recursion walk-through](#walkthrough)
	1. [Sample problem](#sample)
	1. [Base case](#base)
	1. [Recursive case](#recursion)
1. [Printing to Visualize Recursion!](#print)

# Instructions <a name="instructions"></a>

This lab contains a fully worked-out solution to a recursive function. Carefully read through the instructions top to bottom first, and then attempt to solve the function on your own, referring to the instructions when necessary.

# Questions to ask when solving recursion <a name="questions"></a>

When designing a recursive solution, we need to answer the following questions:

* **Step 0** - What is the input into the function? What is its type?

* **Step 1** - What is our **base case** (or cases)? What input value should trigger the "base case branch"?
    * What is the simplest input value for which the function does not need to do/compute anything?
    * Which input value is used in the **base case** (i.e., in the `if` comparison)?
    * Is there more than one base case?

* **Step 2** - What action should be taken in the base case? What is `print`ed or `return`ed? 
   * If something needs to be returned, what is the **type** of the return value?

* **Step 3** - (Conceptually) What is the **first recursive case**? That is, what is the next simplest input (after the base case) that would _immediately_ return the base case?

* **Step 4** - (Specifically) How does the **input** need to change to turn it into the input that _triggers the base case_? (i.e., How does it need to be subtracted/divided/split/sliced/reduced to **get from the first recursive case to the base case**?)

* **Step 5** - What should happen in the _next simplest input case_ in order to get _the answer for that case_ using the _result that came back from the recursive call_?

Remember, a skeleton of the recursive function will have the following approximate structure:

```py
# Note, this is just a pseudocode skeleton structure
def recF(val):
   if val == ...
      print/return fixedValue # base case / cases
   else / elif
      print/return recF(val_modified) 

# `val_modified` is a modified version of `val` that gets closer to the base case
```


------


# Recursion walk-through <a name="walkthrough"></a>

# Sample problem <a name="sample"></a>

Write a function `reverse_digits()`, such that given an integer `num` (0 or greater), it reverses its digits using recursion, and returns a string that contains the reversed number. The function shouldn't do anything if `num < 0` (returns None).

For example, imagine you are given an integer `num = 9321` as an input, so when the function reverses its digits, it should return the reversed digits as a string `"1239"`.

# Base case <a name="base"></a>

**Remember**, a recursive function should always either **`print`** or **`return`** the result, depending on what you are asked to do. _Every case_ (branch)  has to have a `print` or a `return`, depending on the instructions.

* **Step 0** - What is the input into the function? What is its type?

In the sample problem above, the function takes **an integer**, which represents a number that needs to be reversed.


* **Step 1** - What is our **base case** (or cases)? What input value should trigger the "base case branch"?

* What is our **base case** (or cases)?

When writing a recursive function, you need to first identify the **base case** (or cases): the simplest case for which the function still works but does not need to do/compute/process anything. This case stops the recursion.

* What is the simplest input value for which the function does not need to do/compute anything?

The simplest input value, which is the base case in this scenario, would be a single-digit `num`, since there is **nothing to reverse**. 


* **Step 2** - What action should be taken in the base case? What is `print`ed or `return`ed? 
   * If something needs to be returned, what is the **type** of the return value?

The function needs to `return` the result **as a string**. 

In your function, you can simply return the string consisting of the provided `num`, if `num` is between 0 and 9 (i.e., nothing to reverse).


```py
def reverse_digits(num):
    """
    Reverse the digits of an integer (0 or greater), using recursion.
    Return a string that contains the reversed number.
    Returns None if num < 0.
    """
    if 0 <= num <= 9:
        return str(num)
```

Yay! We're done with the base case.

_Side note: you could've found other ways to implement the base case. For example, `if len(num) == 1`, is an alternative way to detect that we are looking at the "simplest input" where we have nothing to reverse._


# Recursive case <a name="recursion"></a>

The recursive case should always involve _calling the function itself_ on the input that _gets you closer to the base case_.

Now, you can start developing an algorithm for a recursive solution.

* **Step 3** - (Conceptually) What is the **first recursive case**? That is, what is the next simplest input (after the base case) that would _immediately_ return the base case?

After a single-digit number, the next simplest input would be a two-digit number. We can get from a two-digit number to a single digit by getting either the first or the second/last digit, which is a single-digit number that we need for the base case.


* **Step 4** - (Specifically) How does the **input** need to change to turn it into the input that _triggers the base case_? (i.e., How does it need to be subtracted/divided/split/sliced/reduced to **get from the first recursive case to the base case**?)

As we determined in Step 3, to get a single digit, we can get either the first or the second/last digit of the number.

You will need to decide if you are going to be reversing the number by going front-to-back or back-to-front (that is starting from the first digit and moving towards the last digit or starting from the last digit and moving towards the first digit).

For this example, let's use the fact that the modulo operator `%` is going to give us the remainder of the division by 10 - this gets us the _last digit_. In this case, this is how you can change/reduce the provided input to **get from the first recursive case to the base case**: the "rest of the number" that is before the last digit, in this case is the input that will trigger the base case, because it is going to be a single digit.


What does it look like?
* For example, the next simplest input would be a two-digit number, e.g., `16` (which the function should turn into a string `"61"`).
* Input: `num = 16` (`reverse_digits(16)`)
    * Get the last digit `6` (by using modulo: `num%10 = 16%10 = 6`).
    * Give the rest of the number (i.e., `num//10 = 1`) as an input to `reverse_digits()` (calling `reverse_digits()` with the "rest of the number"(which is 1) will trigger our base case and return `'1'`).


As you can see, in this step, we usually always figure out how the provided input needs to be divided/split/sliced/reduced, so that we can call the function to _immediately_ trigger the base case.


* **Step 5** - What should happen in the _next simplest input case_ in order to get _the answer for that case_ using the _result that came back from the recursive call_?

Now that we have the "last digit" and processed the "rest of the number", what do we need to do to reverse them?

What action do you need to take once you get the result from the base case in order to obtain the next simplest case?

You need to decide if you are going to be assembling the reversed digits at the end or at the beginning of the string that contains the base case.


Since we'll be processing the number from the last digit, we'll be assembling the rest of the digits **after** the "last digit" that will be placed at the _beginning_ of the resulting reversed string.

What does it look like?
* Input: `num = 16` (`reverse_digits(16)`)
    * Get the last digit `6` (by using modulo: `num%10 = 16%10 = 6`).
    * Give the rest of the number (i.e., `1`) as an input to `reverse_digits()` (calling `reverse_digits()` with the "rest of the number"(which is 1) will trigger our base case and return `'1'`).
    * Concatenate the result of `reverse_digits(1)` **after** the last digit, so `'6' + reverse_digits(1) = '6'+'1'` will produce the desired `"61"` result.


Let's see if/how this would work for a longer number.
* Input: `num = 162` (`reverse_digits(162)`)
    * Get the last digit `2` (by using modulo: `num%10 = 162%10 = 2`).
    * Give the rest of the number (i.e., `16`) as an input to `reverse_digits` (calling `reverse_digits(16)` will trigger our previous case, which we know will eventually get to the base case; it should return `'61'` back to us).
    * Concatenate the result of `reverse_digits(16)` **after** the last digit, so `'2' + reverse_digits(16) = '2'+'61'` will produce the desired string `"261"` as a result.

Looks like this might work!

The only part we are missing in the above pseudocode, is the "Give the rest of the number" part. How would you get 16 from 162? Well, if we got 2 by getting the remainder, we can get 16 by getting _the integer part of dividing 162 by 10_.
We can express it using `int(num/10)` or simply as `num//10`.

We are ready to put it together. See if you can assemble the solution yourself. 

```py
def reverse_digits( num ):
    """
    Reverse the digits of an integer (0 or greater), using recursion.
    Return a string that contains the reversed number.
    Returns None if num < 0.
    """
    if 0 <= num <= 9:
        return str(num)

    elif num > 0:  # why is this not else? because "else" would work for -1 as well, which we don't want
        last = str(num%10)
        rest = reverse_digits(num//10)
        return last + rest
```

Because we correctly figured out _the action that we need to take to **get from the first recursive case to the base case**_, this recursive step should now work for arbitrarily large numbers.

At this point, all unit tests in this assignment should be passing, since the function is supposed to be returning the correct values.

---


# Printing to Visualize Recursion! <a name="print"></a>

Printing is a useful tool that will allow us to see what is happening during each step of the recursion. Let's slightly modify the program to allow us to have readable print statements (using a technique described in zyBooks section **_Debugging Recursion_**). This way, we can really see what is happening during our recursive calls.

Let's add an additional parameter to our function definition to let us print an indent on each successful recursive call.

```py
def reverse_digits( num , indent='' )
```

Now let's modify the recursive call! Just as we make our parameters move closer to the base case, let's add an indentation for every successive recursive call we do.

```py
def reverse_digits( num , indent='' ):
    """
    Reverse the digits of an integer (0 or greater), using recursion.
    Return a string that contains the reversed number.
    Returns None if num < 0.
    """
    if 0 <= num <= 9:
        return str(num)

    elif num > 0:
        last = str(num%10)
        rest = reverse_digits(num//10, indent + '|   ')
        return last + rest
```

We have added a way to see how deep our recursion goes, so now let's add some informative print statements! 
These print statements throughout the function will let us know what is going on each step of the way.

```py
def reverse_digits( num , indent='' ):
    """
    Reverse the digits of an integer (0 or greater), using recursion.
    Return a string that contains the reversed number.
    Returns None if num < 0.
    """

    print(f'{indent}Running reverse_digits({...})') # TODO: what is the input to the function?

    if 0 <= num <= 9:
        print(f'{indent}Base Case! Returning {...}') # TODO: what is returned?
        return str(num) 

    elif num > 0:
        print(f'{indent}The last digit is num%10: {...}') # TODO: add the computation
        print(f'{indent}"{num%10}" + reverse_digits({...})')

        last = str(num%10)
        ... = reverse_digits(..., indent + '|   ')   ## here is our recursive call

        print(f'{indent}"{...}" + "{...}"') # TODO: what is supposed to be concatenated?
        print(f'{indent}reverse_digits({...}) returned "{last + ...}"') # TODO: what was the input?

        return ...
```

If we were to call our function as `reverse_digits(345)`, we should get the following output:
```
Running reverse_digits(345)
The last digit is num%10: 5
"5" + reverse_digits(34)
|   Running reverse_digits(34)
|   The last digit is num%10: 4
|   "4" + reverse_digits(3)
|   |   Running reverse_digits(3)
|   |   Base Case! Returning 3
|   "4" + "3"
|   reverse_digits(34) returned "43"
"5" + "43"
reverse_digits(345) returned "543"
```

Great! Now we will be able to have a visual representation of what is going on with our recursion. Notice how with each recursive call, indent gets increased. So the deeper our recursion goes, the further indented the print statements will be.

