#import "@preview/touying:0.6.3": *

#let main_title = [Decision-making via evidence accumulation and metacognitive self-regulation]
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
    link("https://www.inria.fr")[#image("../images/inria_logo.jpg", width: 15%)],
  )
  #place(
    bottom + center,
    link("https://inria.fr/fr/mnemosyne")[#image("../images/mnemosyne_logo.png", width: 15%)],
  )
  #place(
    bottom + right,
    dx: -10mm,
    link("https://ensc.bordeaux-inp.fr")[#image("../images/ensc_logo.jpg", width: 15%)],
  )

  #title[
    #main_title
  ]

  #v(1em)

  #main_author

  // Uncomment one of these lines to display either the current date,
  // or the hard value of event date
  // #datetime.today().display("[month repr:long] [day], [year repr:full]")
  #datetime(year: 2026, month: 06, day: 22).display("[month repr:long] [day], [year repr:full]")
]

== Outline <touying:hidden>

#show outline: set text(size: 20pt)

#components.adaptive-columns(outline(title: none, depth: 2, indent: 1em))

= Introduction

== Motivation

- Metacognition: key skill to adapt to one’s environment and goals.
- Current AI systems still limited in that area.
- Doorway to metacognition: _confidence_ (subjective estimate of a decision's quality).

$=>$ New, metacognitive models of decision-making and learning inspired by natural cognition.

== Related work

- Decision-making as sequential accumulation of evidence until a threshold is crossed @ratcliffDiffusionDecisionModel2008, @usherTimeCoursePerceptual2001, @brownSimplestCompleteModel2008, @vanravenzwaaijAccumulatingAdvantagesNew2020.
- Joint models of reinforcement learning and evidence accumulation @fontanesiReinforcementLearningDiffusion2019, @mileticNewModelDecision2021.
- Confidence as probability of decision correctness @pougetConfidenceCertaintyDistinct2016, distance from the decision criterion @greenSignalDetectionTheory1966 or between accumulators @kepecsComputationalFrameworkStudy2012.

#figure(
  image("images/pesquetDDMRace.png", width: 50%),
  caption: [Difference between single- and multi-accumulator models of sequential decision-making.],
)

= Methodology

== Architecture

#figure(
  image("images/pesquetDecisionMakingSelfRegulation_1.png", width: 70%),
  caption: [Proposed architecture for a metacognitive agent interacting with its environment.],
)

=== Learning

Action values estimations updated via Q-Learning (@eq:learning_q) using the reward prediction error $delta$ (@eq:learning_delta).

$ Q(S,a) arrow.l Q(S,a) + alpha dot delta $ <eq:learning_q>

$ delta = r + gamma dot max_a Q(S',a) -Q(S,a) $ <eq:learning_delta>

---
=== Decision-making

- Race between pairwise accumulators $X_(i,j)$ for each action $i$ over actions $j != i$.
- Drift rates $v_(i,j)$ (speed of evidence accumulation) defined as a weighted sums between the _advantage_ (difference) and _sum_ terms for action values (@eq:decision_drift).

$ "d"X_(i,j) (t) = v_(i,j)"d"t + sigma"d"W_(i,j) (t) $ <eq:addm_evidence>

$ v_(i,j) = w_d (Q(S,a_i)-Q(S,a_j)) + w_s (Q(S,a_i)+Q(S,a_j)) + v_0 $ <eq:decision_drift>

#figure(
  image("images/ard_accumulation.png", width: 80%),
  caption: [Illustration of the evidence accumulation dynamics for decision-making. Each of the three possible actions is associated with two accumulators representing the pairwise advantages over other actions. The confidence is computed as the normalised distance between winner’s and runner-up’s slowest accumulators at decision time.],
)

---

=== Metacognition

Exploits the confidence $c$ computed at decision time to dynamically adjust the decision threshold $theta$ (@eq:meta_theta) and the Q-value learning rate $alpha$ (@eq:meta_alpha).

$ theta arrow.l theta - eta_(theta) (c − c_"target") $ <eq:meta_theta>

$ alpha arrow.l alpha - eta_(alpha) (c − c_"target") $ <eq:meta_alpha>

== Test environment

#figure(
  image("images/collabsort_demo.gif", width: 50%),
  caption: [The collaborative object sorting task between a deterministic (top) and a cognitive (bottom) agent.],
)

== Preliminary results

#figure(
  image("images/results_ard_dqn.png", width: 45%),
  caption: [Cumulated rewards at the end of training for the metacognitive (magenta) and Q-Learning agents.],
)

#figure(
  image("images/results_ard_eps.png", width: 45%),
  caption: [Cumulated rewards at the end of training for the metacognitive (magenta) and DQN agents.],
)

= Conclusion

== Discussion

- Work at the crossroads of AI and cognitive computational neuroscience.
- Model for a metacognitive artificial agent using its own confidence levels to dynamically adjust its decision- making and learning functions.
- Dedicated testbed: collaborative object sorting task.
- Much work needed to refine architecture and test environment.

== References

#slide[
  #set text(size: 12pt)

  #bibliography("./bibliography.bib", title: none)
]
