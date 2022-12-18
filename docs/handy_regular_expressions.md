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

### Find Section Headers

```
^([A-Z0-9][a-z\.]+\s){3,}$
```

```
^(Example|Chapter)\s\d.{1,30}$
```

Example:

```
Application Protocol Design

In Chapter 7, we'll discuss the advantages of breaking complicated applications up into cooperating processes speaking an application-specific command set or protocol with each other. All the good reasons for data file formats to be textual apply to these application-specific protocols as well.

When your application protocol is textual and easily parsed by eyeball, many good things become easier. Transaction dumps become much easier to interpret. Test loads become easier to write.

Server processes are often invoked by harness programs such as inetd(8) in such a way that the server sees commands on standard input and ships responses to standard output. We describe this
"CLI server" pattern in more detail in Chapter 11.

Chapter 5. Textuality
```

It will match the first and the last lines because they are in title case. Titles are usually not grammatically correct so they tend to mess up the markov chain-fu.