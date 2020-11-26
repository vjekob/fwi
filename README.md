# Simple animal sound demo

Let's start from here. This illustrates a typical starting point where interfaces can help.

# Adding interfaces and factory pattern

All animals can make a sound, and business logic doesn't care how they do. Here, we create a pet using factory pattern and then ask the pet to make a sound in a polymorphic way.

# Problem with uninitialized interfaces

AL cannot check if an interface is initialized. Attempting to access uninitialized interface causes runtime error.
