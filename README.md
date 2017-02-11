# brainfuck

> "...things so complicated or unusual that they exceed the limits of one's
> understanding."

Brainfuck is an esoteric programming language created in 1993 by Urban Müller,
and notable for its extreme minimalism. My colleague challenged me to write an
interpreter for it - so here we are.

## Syntax

The Brainfuck programming language consists of eight commands, each of which is
represented as a single character:

| Symbol | Instruction            |
|--------|------------------------|
|  `>`   | Increment the pointer |
|  `<`   | Decrement the pointer |
|  `+`   | Increment the byte at the pointer |
|  `-`   | Decrement the byte at the pointer |
|  `.`   | Output the byte at the pointer    |
|  `,`   | Input a byte and store it in the byte at the pointer |
|  `[`   | Jump forward past the matching `]` if the byte at the pointer is zero |
|  `]`   | Jump backward to the matching `[` unless the byte at the pointer is zero|

## Installation

I'll let you know when I've finished it.
