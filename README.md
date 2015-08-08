Scrabble Kata
=============

[![Build Status](https://travis-ci.org/gonzalo-bulnes/kata-scrabble.svg?branch=master)](https://travis-ci.org/gonzalo-bulnes/kata-scrabble)
[![Code Climate](https://codeclimate.com/github/gonzalo-bulnes/kata-scrabble.svg)](https://codeclimate.com/github/gonzalo-bulnes/kata-scrabble)
[![Inline docs](http://inch-ci.org/github/gonzalo-bulnes/kata-scrabble.svg?branch=master)](http://inch-ci.org/github/gonzalo-bulnes/kata-scrabble)

A board game in which players create words from sets of letters.

Installation
------------

Add the gem to your `Gemfile`:

```ruby
# Gemfile

gem 'scrabble', '~> 0.1.0' # see semver.org
```

Usage
-----

```bash
# Start a new game
scrabble start

# Read usage instructions
scrabble help
```

Development
-----------

```bash
# Run the test suite
rake
```

About
-----

This kata aims at uncovering a model for the Scrabble game, by applying _Object-Oriented Design_ techniques.

While doing so, I wrote down some thoughts and comments in this [whiteboarding branch](https://github.com/gonzalo-bulnes/kata-scrabble/tree/spike-whiteboarding).

Credits
-------

> **DISCLAIMER**: The name SCRABBLE® is a [registered trademark](http://www.scrabble.com/), and so may be some graphical elements of the board and tiles. This gem is not related in any way with the trademark owners, and only makes use of the name and the original board game graphical elements with a fair-use intention.

License
-------

    Scrabble
    Copyright (C) 2015 Gonzalo Bulnes Guilpain

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
