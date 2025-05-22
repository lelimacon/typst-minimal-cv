#let default-theme = (
  gutter-width: 60pt,
  font: "Inria Sans",
  font-size: 11pt,
  accent-color: navy.lighten(10%),
  body-color: rgb("222"),
  gutter-body-color: none, // inherit
)


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
    {
      // Align line for emoji and different fonts.
      // https://forum.typst.app/t/how-to-set-an-exact-line-height-no-matter-which-font-is-used-in-the-line/1426
      set text(top-edge: 1em)

      [#gutter #label("cv-gutter")]
    },
    {
      let has-title = title != none
      let has-right = right != none

      if has-title or has-right {
        // Align line for emoji and different fonts.
        set text(top-edge: 1em)

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

  set block(above: 0pt, below: 0pt, spacing: 0pt)
  set par(leading: 0em)

  context {
    let light-accent = rect.fill.lighten(30%)

    rect(
      height: 6pt,
      width: 100%,
      stroke: light-accent,
      fill: gradient.linear(
        (light-accent, 0%),
        (light-accent, progress),
        (white, progress),
        (white, 100%),
      ),
    )
  }
}
