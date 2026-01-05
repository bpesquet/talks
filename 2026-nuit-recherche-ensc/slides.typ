#import "@preview/touying:0.6.1": *

#let main_title = [A cognitively plausible architecture for a metacognitive agent]
#let main_author = [#link("https://www.bpesquet.fr")[Baptiste Pesquet]]

#import themes.simple: *
#show: simple-theme.with(
  aspect-ratio: "16-9",
  footer: [#main_title],
)

#show figure.caption: set text(size: 16pt)

#title-slide[
  #title[
    #main_title
  ]

  #v(2em)

  #main_author

  #link("https://www.inria.fr")[INRIA], #link("https://ensc.bordeaux-inp.fr")[ENSC - Bordeaux INP]

  #datetime.today().display("[month repr:long] [day], [year repr:full]")
]

== Outline <touying:hidden>

#show outline: set text(size: 20pt)

#components.adaptive-columns(outline(title: none, depth: 2, indent: 1em))

// = Literature review
= Decision-making, learning and confidence in natural cognition

== Decision-making as a sequential process

#pause

- A _decision_ is a deliberative process leading to a _choice_.

#pause

- Decision-makers need _time_ to collect and process informative cues.

#pause

- Decision-making is often modeled as an _accumulation-to-threshold_ process @goldNeuralBasisDecision2007.

#pause

- The balance between response time and accuracy (when available) is called the _Speed/Accuracy Trade-off_ @heitzSpeedaccuracyTradeoffHistory2014.

== Models of sequential decision-making

A popular model for binary decisions is the _Diffusion Decision Model_ @ratcliffDiffusionDecisionModel2008.

#figure(
  image("images/forstmannSequentialSamplingModels2016_1.png", width: 55%),
  caption: [Illustration of the DDM model @forstmannSequentialSamplingModels2016.],
)

=== <touying:hidden>

Multi-alternative decisions are often modeled as a _race_ between accumulators for each possible choice.

#figure(
  image("images/race_model_example.gif", width: 49%),
  caption: [Illustration of a race model. (#link("https://github.com/itsdfish/SequentialSamplingModels.jl")[Source])],
)

== Learning and decision-making

#pause

- Decisions followed by _rewards_ produce _learning effects_.

#pause

- Joint models of decision-making combine evidence accumulation and Reinforcement Learning, using Q-values to drive accumulators @fontanesiReinforcementLearningDiffusion2019, @mileticNewModelDecision2021.

$ Q_(i,t+1) = Q_(i,t) + alpha(r_t - Q_(i,t)) $

- $Q_(i,t)$: value representation of choice $i$ on trial $t$.
- $r_t$: reward received on trial $t$.
- $alpha in [0,1]$: learning rate.

== Confidence in decision-making

#pause

- _Uncertainty_ is inherent to all stages of neural computation @flemingMetacognitionConfidenceReview.
  - Refers to probabilistic representations of information in the brain.

#pause

- _Confidence_ quantifies the degree of _certainty_ associated with a decision.
  - Refers to scalar values derived from those distributions @meynielConfidenceBayesianProbability2015.

#pause

- More formally, confidence can be defined as the _probability_ that a choice is correct given the available evidence @pougetConfidenceCertaintyDistinct2016.

== Computing confidence in sequential decision-making

In _decisional focus models_, confidence is directly indexed by the state of evidence at the time of choice.

#figure(
  image("images/kepecsNeuralCorrelatesComputation2008_1.png", width: 37%),
  caption: [Computation of confidence based on the difference between accumulators at choice time @kepecsNeuralCorrelatesComputation2008.],
)

===

_Post-decisional focus models_ posit that evidence accumulation goes on after decision time to account for confidence.

#figure(
  image("images/pleskacTwostageDynamicSignal2010_1.png", width: 62%),
  caption: [Computation of confidence based on post-choice accumulation.],
)

== Confidence as a doorway to metacognition

#pause

- _Metacognition_ is the ability to monitor and regulate one's cognitive processes @flavellMetacognitionCognitiveMonitoring1979.
  - Example: should I study more or differently for an upcoming exam?

#pause

- As part of metacognitive monitoring, confidence judgments may inform the processes of _cognitive control_ @flemingHowMeasureMetacognition2014.

= Building a cognitively plausible metacognitive agent #emoji.construction

== Core ideas

#pause

- Use evidence accumulation to model sequential decision-making.

#pause

-

== Perceptual task: Random Dot Motion discrimination

#slide[
  #figure(
    image("images/pesquetAlexandre2025_high_coherence.gif"),
    caption: [Evidence integration with high motion coherence @pesquetMetacognitiveAgentsIntegrating.],
  )
][
  #figure(
    image("images/pesquetAlexandre2025_low_coherence.gif"),
    caption: [Evidence integration with low motion coherence @pesquetMetacognitiveAgentsIntegrating.],
  )
]

== Value-based task: collaborative sorting

= References

---

#set text(size: 16pt)

#bibliography("../bibliography.bib", title: none)
