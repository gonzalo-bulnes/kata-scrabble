Whiteboard
==========

This file contains some design ideas and blueprints.

Overview
--------

### User interface

Scrabble is meant to be an interactive, multiplayer game. As such, some user interface must be part of the design. Because that user interface must match the user's expectations, it is very likely to evolve over time. These changes should not affect the game logic in any way.

> Constraint 1: the game logic MUST NOT depend on the user interface

A command-line interface (CLI) is acceptable.

### State of the game

The game, by definition has a gameplay. That's to say the **current game state** and **a set of inmutable rules** do determine the possible future game states.
A combination of a _current game state_ and an _valid user input_ should detrmine an unique _future game state_. Several of those combinations can lead to the same future game state, however.

Anytime, the game state should provide enough information to resume the game.

> Definition 1: the current game state determines the universe of valid user inputs

> Definition 2: the current game state and the current user input determine the future game state (through and inmutable set of rules).

### Design steps

1. Problem analysis, data definitions (classes definition)
1. Functions signature and documentation (methods signature)
1. Functional examples and specifications
1. Functions templates (methods templates)
1. Functions definitions (methods definitions)
