# Implementing interfaces: Stage 1

This demo shows a typical polymorphic scenario where there are no interfaces and polymorphism is attained using `case` syntax. This constitutes the starting point from where interfaces can be implemented.

First step in implementing interfaces is to identify areas that are logically polymorphic. Can you identify those areas?

# Polymorphic candidates

The first polymorphic candidate is the type of new account that can be created. There is the `NewAccount.Codeunit.al` codeunit that runs a `case` block to determine which codeunit to run. This can easily be polymorphic.

# Enums

This demo uses enums to address polymorphism.
