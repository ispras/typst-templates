#let colors = (
  blue: rgb("#055aaa"),
  white: rgb("#fafafa"),
  black: rgb("#23373a"),
)

#let font-sizes = (
  normal: 17pt,
  title: 20pt,
  subtitle: 18pt,
  authors: 14pt,
  date: 14pt,
  slide-title: 22pt,
  section-title: 24pt,
  counter: 12pt,
  qa: 24pt,
)

#let _title = state("title")
#let _subtitle = state("subtitle")
#let _authors = state("authors")
#let _date = state("date")
#let _logo = state("logo")

#let setup(
  title: none,
  subtitle: none,
  authors: (),
  date: none,
  logo: none,
  content,
) = {
  assert(title != none, message: "Title is required")
  assert(authors != (), message: "At least one author is required")

  _title.update(title)
  _subtitle.update(subtitle)
  _authors.update(authors)
  _date.update(date)
  _logo.update(logo)

  set document(title: title, author: authors.join(", "))
  set align(horizon)
  set text(font-sizes.normal, fill: colors.black, font: "DejaVu Sans")

  set page(
    paper: "presentation-16-9",
    margin: 0pt,
    background: block(fill: colors.white, width: 100%, height: 100%),
    header: none,
    footer: none,
  )

  content
}

#let title-slide() = context {
  align(center + horizon)[
    #block(width: 85%, align(left)[
      #text(size: font-sizes.title, weight: "bold")[#_title.get()]

      #if _subtitle.get() != none {
        v(0em)
        text(size: font-sizes.subtitle)[#_subtitle.get()]
      }

      #v(2em)
      #text(size: font-sizes.authors)[#(_authors.get().join(", "))]
      #v(0em)

      #if _date.get() != none {
        text(size: font-sizes.date)[#_date.get()]
        v(0em)
      }

      #if _logo.get() != none { _logo.get() }
    ])
  ]
}

#let section(title: none) = {
  pagebreak()
  set page(header: none)
  set align(center + horizon)
  text(font-sizes.section-title, weight: "bold")[#title]
}

#let slide(title: none, body) = {
  counter(heading).update(c => c + 1)
  pagebreak()
  set page(
    margin: 0pt,
    header: [
      #align(top)[
        #box(width: 100%, height: 3em, fill: colors.blue, place(
          horizon + left,
          text(font-sizes.slide-title, weight: "bold", fill: colors.white)[
            #pad(left: 1em)[#title]
          ],
        ))
      ]
    ],
    footer: [
      #context {
        align(right + bottom)[
          #box(width: 100%, height: 1.5em, place(bottom + right, text(
            font-sizes.counter,
          )[
            #pad(right: 1em)[
              #context counter(heading).display(
                (cur, total) => [#cur/#total],
                both: true,
              )
            ]
          ]))
          #v(1em)
        ]
      }
    ],
  )

  align(center + horizon)[#block(width: 90%, height: auto)[#align(left)[#body]]]
}

#let qa(title: "Q&A", body) = {
  pagebreak()
  set page(margin: 0pt, header: none, footer: none, background: block(
    fill: colors.blue,
    width: 100%,
    height: 100%,
  ))
  align(center + horizon)[#text(
      font-sizes.qa,
      weight: "bold",
      fill: colors.white,
    )[#title]]
  body
}

#show list.item: it => {
  set align(left)
  it
}

#show enum.item: it => {
  set align(left)
  it
}
