## Outcome-Monad-For-ROP
This repository was created for the talk "Monads: Exploring Railway Oriented Programming in Ruby", delivered at the 11th edition of RubyDay in Verona, Italy on May 31st 2024.

It shows the basics of creating a monad with success and failure types to implement Railway Oriented Programming in Ruby. It also introduces different error types to handle expected errors, making testing even more streamlined.

The program without the use of monads is in the `main` branch and the one with the monad is in the `use_outcome` branch.

The monad is called `Outcome` and is implemented in the `Outcome` module.

This repo covers the basics of moving from returning error messages within a process based on the different functions that make up the process to returning an outcome type from every function so that they are composable.
