#import "../lib.typ": *

#show: setup.with(
  title: "Presentation Template",
  subtitle: "Some subtitle",
  authors: ("Some Author", "Some Co-Author"),
  date: "May 30, 2025",
  logo: image("logo_EN_basic.png", width: 8em),
)

#title-slide()

#section(title: "Section")

#slide(title: "Lists")[
  - *#lorem(3)* #lorem(5)
  - *#lorem(4)* #lorem(10)
  - *#lorem(5)* #lorem(15)
  - *#lorem(6)* #lorem(20)
]

#slide(title: "Enumerations")[
  1. *#lorem(3)* #lorem(5)
  2. *#lorem(4)* #lorem(10)
  3. *#lorem(5)* #lorem(15)
  4. *#lorem(6)* #lorem(20)
]

#slide(title: "Tables")[
  #table(
    columns: (1fr, 1fr, 1fr),
    inset: 5pt,
    align: horizon,
    [*Header 1*], [*Header 2*], [*Header 3*],
    [Data A], [Data B], [Data C],
    [A], [B1 \ B2], [C]
  )
]

#slide(title: "Grids")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    [*Left*], [*Center*], [*Right*],
    "Left",
    "Center",
    "Right",
  )
]

#slide(title: "Code blocks")[
  ```python
def fib(n):
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b
  ```
]

#slide(title: "Maths")[
  $ a^2 + b^2 = c^2 $
]

#qa(title: "Questions?")[]
