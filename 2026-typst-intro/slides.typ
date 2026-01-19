#import "@preview/touying:0.6.1": *

#let main_title = [Typst, a new tool for writing scientific documents]
#let main_author = [#link("https://www.bpesquet.fr")[Baptiste Pesquet]]

#import themes.simple: *
#show: simple-theme.with(
  aspect-ratio: "16-9",
  footer: [#main_title],
  // Uncomment the following line to obtain an animation-free version
  config-common(handout: true),
)

#set math.equation(numbering: "(1)")
#show figure.caption: set text(size: 16pt)

#title-slide[
  // Institution logos
  #place(
    bottom + left,
    dx: 10mm,
    link("https://www.inria.fr")[#image("images/inria_logo.jpg", width: 15%)],
  )
  #place(
    bottom + center,
    link("https://inria.fr/fr/mnemosyne")[#image("images/mnemosyne_logo.png", width: 15%)],
  )
  #place(
    bottom + right,
    dx: -10mm,
    link("https://ensc.bordeaux-inp.fr")[#image("images/ensc_logo.jpg", width: 15%)],
  )

  #title[
    #main_title
  ]

  #v(1em)

  #main_author

  #datetime.today().display("[month repr:long] [day], [year repr:full]")
  // Hard value for event date
  // #datetime(year: 2026, month: 01, day: 06).display("[month repr:long] [day], [year repr:full]")
]

== Outline <touying:hidden>

#show outline: set text(size: 20pt)

#components.adaptive-columns(outline(title: none, depth: 2, indent: 1em))

= Why Typst?

== Scientists: text is all you need #emoji.face

- For centuries, _text_ has been the dominant medium for scientific reporting.
- Main usages:
  - Publishing results.
  - Communicating and exchanging with colleagues.
- Why?
  - Universal
  - Precise
  - Easy to index, search and archivate

== What's in a scientific document

- Textual content
- Annotated figures
- Mathematical equations
- Algorithms
- Citations and bibliographies
- Footnotes
- And more!

== The king on the hill: (La)TeX

- #link("https://en.wikipedia.org/wiki/TeX")[TeX] is a typesetting system created en 1978 by #link("https://en.wikipedia.org/wiki/Donald_Knuth")[Donald Knuth].

- #link("https://en.wikipedia.org/wiki/LaTeX")[LaTeX] is a set of macros designed in 1984 by #link("https://en.wikipedia.org/wiki/Leslie_Lamport")[Leslie Lamport] to facilitate the usage of TeX.
  - Current version: LaTeX2e (1994)
  - LaTeX3 is in development since 1989

- Separate content from rendering, purely text-based, free software licence, rich ecosystem.

- Gold standard for authoring and publishing scientific material.

== A new contender: Typst

- New technology stack for creating scientific documents.
  - First public release: 2023
- Provides:
  - An #link("https://raw.githubusercontent.com/typst/typst/refs/heads/main/LICENSE")[open source] #link("https://github.com/typst/typst")[CLI compiler]
  - A #link("https://typst.app")[collaborative online editor] similar in spirit to LaTeX's #link("https://www.overleaf.com/")[Overleaf]

= Features

= Pros

```tex
The quadratic formula is $-b \pm \sqrt{b^2 - 4ac} \over 2a$
\bye
```

= Cons
