Scrabble Kata
=============

A board game in which players create words from sets of letters.

Up to 4 players
The tiles have values
You can extend other people words
Words must be valid

Basic concepts
--------------

- board
- tiles (or at least a letter + score) - fixed set of tiles
- player

- [user gets a set of tiles
- user inputs a words + its location on the boards
- the word gets validated (dictionary + location)
- the word score is computed (tiles + location on the board)
- and appended to the user total score

Usage
-----

start the game
then the 1st player gets a set of tiles (display a set of tiles)
player can input a word
if word valid
  the used tiles are replaced

and the second player plays

Basic objects
-------------

### Word (duh!)

- delegates its valdiation to a dictionnary
- holds its own position
- can be "writen down" on the table once the validations were performed
- holds a list of squares (determined from the starting position and orientation)

### Dictionary

- receives a word and checks if it exists

### Board

- the current game status (from the tiles point of view)
- validating the words position
- (*) providing hints about the score modifiers (3x word, 2x word, 3x letter, 2x letter)

* current game status: set of squares (ordered)

### Square

- empty, (tenative), occupied -> put_tile(Tile tile)
- modifies the tiles or word scores (immutable)

### Whiteboard

- hold the users score (and ranking)

### Tiles

- score
- holds its own value (default value)
- can get "promoted" depending their position on the board

### TilesStore

- holds the available tiles
- gets populated on startup with a default (configurable?) set of tiles

### Player

- set of tiles: list of Tiles (unordered)
- place_a_tile(board, square (or location), tile) # the tiles comes from the list of tiles (by value: e.g "A")
  board.validate_position([current_square, the past_square, and the previous one])
  square.is_available?

Storyline
---------

1. Player 1 gets a set of tiles from the TilesStore
1. The board is displayed (with columns and row names e.g. A..O, 1..15)
1. [user input] Player submits a word + location
      A1 A
      A2 P
      A3 P
      A5 E
      [empty] -> triggers the whole-word validations
      (the word is "APPLE" but the "L" tile was already present on the board)
1. A1 A, B2 is invalid form
1. The play gets validated
   - all newly placed tiles must share either their column or row (independent)
   - all newly placed tiles must be places on empty square (depends on the board)
   - all newly placed tiles must belong to the users tiles set (depends on the user)
   - in the row (resp. column) the word must exist (dictionnary)
     * a word is a set of tiles surrounded by two empty squares (one on each side) (one left to right writing is allowed, resp. top to bottom)
     * (the location of the word has been implicitely validated tile by tile)



Alternative validations workflow
--------------------------------

### Player submits a word

Player submits a **word**: e.g. word: "APPLE" starting from starting_square: "A1" with orientation: "vertically"

```ruby
word = Word.new("APPLE", starting_at: "A1", orientation: VERTICAL)
# => <Word "APPLE", "A1", VERTICAL>
```

That word could be stored by the player, and later hold its own value (score).

### Scrabble validates the word

```ruby
word.exists? # may depend on the language (game setting)
# => true

  # Word delegates the validation to a dictionnary
```

If the board does not exist, the move is aborted and the player must create another word or pass.

#### Keep in mind

In some conditions, the player won't be able to submit a valid word and must be allowed to pass.

### Scrabble computes the word composition

Both the board state and the players set of tiles determine the word composition (which tiles ashould be places in which places to compose the word on the board).

```ruby
word.squares = board.get_squares(as_much_as: word.length, starting_at: "A1", orientation: VERTICAL)
# => [<Square A1>, <Square A2>, <Square A3>, <Square A4>, <Square A5>]

# From the word point of view:
#
#      1 2 3 4 5 .
#     ------------
#  A | A P P L E     -> involved squares: A1 A2 A3 A4 A5
#  B |
#  C |
#  . |
#

# From the board point of view:
#
#      1 2 3 4 5 .
#     ------------
#  A |   P           -> involved tiles from the player set: A P L E
#  B |
#  C |
#  . |
#
```

#### Keep in mind (use cases)

```ruby

# From the board point of view:
#
#      1 2 3 4 5 .
#     ------------
#  A |   P
#  B | R
#  C | I
#  D | S
#  E | E
#  . | |> words can be created in the orthogonal direction from any involved square
#
```
