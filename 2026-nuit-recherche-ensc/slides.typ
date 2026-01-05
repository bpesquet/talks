#import "@preview/touying:0.6.1": *

#let main_title = [A cognitively plausible architecture for a metacognitive agent]


#import themes.simple: *
#show: simple-theme.with(
  aspect-ratio: "16-9",
  footer: [#main_title],
)

#title-slide[
  #title[
    #main_title
  ]

  #v(2em)

  #link("https://www.bpesquet.fr")[Baptiste Pesquet]

  #link("https://www.inria.fr")[INRIA], #link("https://ensc.bordeaux-inp.fr")[ENSC - Bordeaux INP]

  #datetime.today().display("[month repr:long] [day], [year repr:full]")
]

// #import themes.university: *
// #show: university-theme.with(
//   aspect-ratio: "16-9",
//   config-info(
//     title: [A cognitively plausible architecture for a metacognitive agent],
//     author: [#link("https://www.bpesquet.fr")[Baptiste Pesquet]],
//     date: datetime.today().display("[month repr:long] [day], [year repr:full]"),
//     institution: [#link("https://www.inria.fr")[INRIA], #link("https://ensc.bordeaux-inp.fr")[ENSC - Bordeaux INP]],
//   ),
// )

// #title-slide()

// ToC
#components.adaptive-columns(outline(title: none, indent: 1em))

= Literature review

== Decision-making as a sequential process

- A _decision_ is a deliberative process leading to a _choice_.
- Decision-makers need _time_ to collect and process informative cues.
- Decision-making is often modeled as an _accumulation-to-threshold_ process @goldNeuralBasisDecision2007.
- The balance between response time and accuracy (when available) is called the _Speed/Accuracy Trade-off_ [[Heitz, 2014](https://www.frontiersin.org/journals/neuroscience/articles/10.3389/fnins.2014.00150/full)].

== Models of sequential decision-making

= Experimental work

= References

#bibliography("../bibliography.bib", title: none)
