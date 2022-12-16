# Handy Regular Expressions

These are useful for finding and removing noise text from Project Gutenberg books and other sources. Developed in Rubular and used in Sublime Text. Should work elsewhere.

Note that to use multiline regexes in Sublime, instead of `/foo.+bar/m` you must specify `(?s)foo.+bar` instead.

### Find Gutenberg chapter titles

```
/^CHAPTER \w+\.$\n.+\n/
```

Example:

```
CHAPTER II.
The Pool of Tears


“Curiouser and curiouser!” cried Alice (she was so much surprised, that
```

### Find Gutenberg book titles

```
^Book\s\w+\..+$
```

Example:

```
Book I. The History Of A Family


Alexey Fyodorovitch Karamazov was the third son of Fyodor Pavlovitch
Karamazov, a land owner well known in our district in his own day, and
still remembered among us owing to his gloomy and tragic death, which
```

### Find Gutenberg illustration tags

```
/\[Illustration\:.+?\]$/
```

### Find KJV Book/Chapter/Verse Markers

```
^\w+:\w+\s
```

Example:

```
Ge11:30 But Sarai was barren; she had no child.
Ge11:31 And Terah took Abram his son, and Lot the son of Haran his son's son, and Sarai his daughter in law, his son Abram's wife; and they went forth with them from Ur of the Chaldees, to go into the land of Canaan; and they came unto Haran, and dwelt there.
Ge11:32 And the days of Terah were two hundred and five years: and Terah died in Haran.
Ge12:1 Now the LORD had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father's house, unto a land that I will shew thee:
Ge12:2 And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing:
Ge12:3 And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.
```

