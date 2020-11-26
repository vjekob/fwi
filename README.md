# Implementing interfaces: Stage 1

This demo shows a typical polymorphic scenario where there are no interfaces and polymorphism is attained using `case` syntax. This constitutes the starting point from where interfaces can be implemented.

First step in implementing interfaces is to identify areas that are logically polymorphic. Can you identify those areas?

# What did we do in this step?

There is a big problem with all `Handled` patterns, in that anyone can subscribe, and thus hijack the process. In this demo, `DummySatisfier.Codeunit.al` hijacks the precondition checking.