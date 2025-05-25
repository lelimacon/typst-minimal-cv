#let default-theme = (
  gutter-width: 42pt,
  font: "Inria Sans",
  font-size: 11pt,
  accent-color: blue.darken(30%),
  body-color: rgb("222"),
  gutter-body-color: none, // inherit
)


#let inline(body) = {
  set text(top-edge: "bounds")
  body
}


#let display-size(size) = [
  #calc.round(size.width.pt())x#calc.round(size.height.pt())
]


#let chronology-fixed-height(
  height,
  start: [],
  end: [],
) = {
  let bullet-radius = 2pt
  let gap-height = 12pt
  let bar-spacing = 8pt
  let bar-width = 1pt

  block(inset: (right: 20pt), context [
    #let start-height = if (start == []) { 0pt } else { measure(start).height }
    #let end-height = if (end == []) { 0pt } else { measure(end).height }
    #let top-gap = if (end == []) { 0pt } else { gap-height + end-height / 2 }
    #let bot-gap = if (start == []) { 0pt } else { gap-height + start-height / 2 }

    // Bar.
    #place(
      top + right,
      dx: bar-spacing,
      dy: top-gap,
      rect(
        //fill: black,
        //stroke: red,
        height: height - top-gap - bot-gap,
        width: bar-width,
      )
    )
    // Bullet points.
    #if (end != []) {
      place(
        top + right,
        dx: bar-spacing - bar-width / 2 + bullet-radius,
        dy: end-height / 2 - bullet-radius,
        circle(
          radius: bullet-radius,
        )
      )
    }
    #if (start != []) {
      place(
        bottom + right,
        dx: bar-spacing - bar-width / 2 + bullet-radius,
        dy: -start-height / 2 + bullet-radius,
        circle(
          radius: bullet-radius,
        )
      )
    }

    #stack(
      end,
      v(height - start-height - end-height),
      start,
    )
    #label("cv-chronology")
  ])
}


#let chronology(
  start: [],
  end: [],
) = {
  set align(right)

  [
    #stack(
      end,
      [ // placeholder.
      ],
      start,
    )
    #label("cv-chronology-auto")
  ]
}


#let section(
  theme: (),
  body,
) = {
  set text(font: theme.font) if "font" in theme
  set text(size: theme.font-size) if "font-size" in theme
  set text(fill: theme.body-color) if "body-color" in theme

  show heading.where(level: 1): set text(size: 3.0 * theme.font-size) if "font-size" in theme
  show heading.where(level: 1): set text(fill: theme.accent-color) if "accent-color" in theme

  show heading.where(level: 2): set text(size: 1.6 * theme.font-size) if "font-size" in theme
  show heading.where(level: 2): set text(fill: theme.body-color.lighten(40%)) if "body-color" in theme
  show heading.where(level: 2): set block(above: 0pt, below: 2.6 * theme.font-size) if "font-size" in theme

  show heading.where(level: 3): set text(size: 1.2 * theme.font-size) if "font-size" in theme
  show heading.where(level: 3): set text(fill: theme.accent-color) if "accent-color" in theme
  show heading.where(level: 3): set block(
    above: 1.8 * theme.font-size,
    below: 0.6 * theme.font-size,
    spacing: 1 * theme.font-size,
  ) if "font-size" in theme

  show heading.where(level: 4): set text(size: theme.font-size) if "font-size" in theme
  show heading.where(level: 4): set text(fill: theme.body-color) if "body-color" in theme

  // Gutter.
  show label("cv-entry"): set grid(columns: (theme.gutter-width, 1fr)) if "gutter-width" in theme
  show label("cv-gutter"): set text(fill: theme.gutter-body-color) if "gutter-body-color" in theme and theme.gutter-body-color != none
  show label("cv-gutter"): set text(fill: theme.body-color.lighten(40%)) if ("gutter-body-color" not in theme or theme.gutter-body-color == none) and "body-color" in theme

  // Rect used for header 3 and progress bar.
  set rect(fill: theme.accent-color.lighten(40%)) if "accent-color" in theme
  set circle(fill: theme.accent-color.lighten(40%)) if "accent-color" in theme

  body
}


#let cv(
  theme: (),
  body,
) = {
  show heading.where(level: 2): set text(weight: "regular")

  show heading.where(level: 3): set block(above: 0pt, below: 0pt)
  show heading.where(level: 3): it => {
    {
      set block(below: 0pt)
      it
    }
    {
      set block(above: 6pt)
      rect(height: 2pt, width: 100%)
    }
  }

  show heading.where(level: 4): set block(above: 0pt, below: 0pt)

  set par(linebreaks: "simple", leading: 0.4em)
  set block(above: 10pt, below: 8pt, spacing: 10pt)

  show label("cv-gutter"): set text(tracking: -0.5pt, style: "italic")

  set list(marker: ([○], [•], [-]))

  // Chronology auto height.
  show label("cv-entry"): it-entry => {
    let child-grid = it-entry.child
    let right-cell = it-entry.child.children.at(1)

    layout(layout-entry => {
      show label("cv-chronology-auto"): it-bar => {
        let end = it-bar.children.at(0)
        let start = it-bar.children.at(2)

        layout(layout-chronology => {
          // Create dummy right cell to measure .
          let right-cell-width = layout-entry.width - layout-chronology.width
          let right-cell-dummy = align(left, box(
            width: right-cell-width,
            {
              // Revert gutter styling.
              set text(tracking: 0pt, style: "normal")
              right-cell
            }))
          let right-cell-height = measure(right-cell-dummy).height
          let debug-box = box(stroke: red, fill: white, width: right-cell-width, height: right-cell-height, right-cell-dummy)

          //#place(top + right, dx: 267pt, debug-box)
          //l1: #display-size(layout-entry)
          //l2: #display-size(layout-chronology)

          chronology-fixed-height(
            right-cell-height,
            start: start,
            end: end,
          )
        })
      }

    it-entry
  })
}


  // Apply section with first default theme then input theme.
  section(theme: default-theme, section(theme: theme, body))
}


#let entry(
  theme: (),
  right: none,
  gutter,
  title,
  body,
) = [#{
  show: section.with(theme: theme)

  grid(
    [
      #gutter
      #label("cv-gutter")
    ],
    {
      let has-title = title != none
      let has-right = right != none

      if has-title or has-right {
        grid(
          columns: (1fr, auto),
          block({
            heading(
              level: 4,
              title
            )
          }),
          block(right)
        )
      }

      if body != none {
        set par(justify: true)
        set block(above: 6pt)
        body
      }
    }
  )
}#label("cv-entry")]


#let progress-bar(
  progress,
) = {
  // Fix for https://github.com/typst/typst/issues/3826
  if progress == 0% {
    progress = 0.1%
  }

  set block(above: 6pt, below: 0pt, spacing: 0pt)
  set par(leading: 0em)

  context {
    let light-accent = rect.fill.lighten(30%)

    rect(
      height: 6pt,
      width: 100%,
      stroke: rect.fill,
      fill: gradient.linear(
        (light-accent, 0%),
        (light-accent, progress),
        (white, progress),
        (white, 100%),
      ),
    )
  }
}
