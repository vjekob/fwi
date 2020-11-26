# Implementing interfaces: Stage 1

This demo shows a typical polymorphic scenario where there are no interfaces and polymorphism is attained using `case` syntax. This constitutes the starting point from where interfaces can be implemented.

First step in implementing interfaces is to identify areas that are logically polymorphic. Can you identify those areas?

# Polymorphic candidates

The first polymorphic candidate is the type of new account that can be created. There is the `NewAccount.Codeunit.al` codeunit that runs a `case` block to determine which codeunit to run. This can easily be polymorphic.

# Enums

This demo uses enums to address polymorphism.

# Improving reusability

There is boilerplate code in all `New_XYZ_.Codeunit.al` codeunits. That code is now moved into `NewAccount.Codeunit.al`.

# Improving loose binding

There is no event-driven binding between page and codeunits. It's not explicit through the interface. Also, there is no more back-door for event hijacking.

# More interfaces

What else can be a good candidate for interfaces? Where do we have a `case` statement? Correct: all of the `New_XYZ_.codeunit.al` inside the `CheckPrecondition` function.

This can be handled with a new interface: `IPrecondition`.

However, this exposes one major drawback of static enum-bound interface implementations: it's not possible to control instance context.