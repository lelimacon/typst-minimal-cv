#import "../package.typ": *


#let accent-theme = (
  accent-color: maroon,
  body-color: maroon,
)


#set page(
  margin: (
    left: 42pt,
    right: 42pt,
  ),
)


// Learn about theming at https://github.com/lelimacon/typst-minimal-cv
#show: cv.with(
  theme: (
    //font: "Roboto",
    //font-size: 12pt,
  )
)


= John Doe
== Developer, Developer, Developer


#grid(
  columns: (9fr, 34pt, 6fr),

  // Left column.
  {
    section(
      [Professional Experience],
      {
        entry(
          right: [*\@Microsoft* -- Cyberport, HK #inline[🇭🇰]],
          chronology(start: "2020", end: "now"),
          [Senior Engineer],
          [
            #par(lorem(12))
            #list(
              lorem(20),
              lorem(6),
              lorem(16),
            )
          ]
        )
        entry(
          theme: accent-theme,
          right: [*\@Supersoft* -- Seattle, US #inline[🇺🇸]],
          chronology(start: "2018"),
          [Co-Founder, CTO],
          [ #lorem(28) ],
        )
        entry(
          right: [*\@Microsoft* -- Berlin, DE #inline[🇩🇪]],
          chronology(start: "2015"),
          [Software Engineer],
          [
            #par(lorem(12))
            #list(
              lorem(16),
              lorem(12),
            )
          ],
        )
        entry(
          right: [*\@MIT* -- Cambridge, US #inline[🇺🇸]],
          //"2013, 2 yrs",
          chronology(start: "2013"),
          [Teaching Assistant],
          [ #lorem(18) ],
        )
        entry(
          right: [*\@Microsoft* -- Redmond, US #inline[🇺🇸]],
          [2014\ 6 mths],
          [CS Intern],
          [ #lorem(12) ],
        )
      }
    )

    section(
      [Educational Background],
      {
        entry(
          theme: accent-theme,
          right: [*\@SNU 서울대학교* -- Seoul, KR #inline[🇰🇷]],
          [2012\ 6 mths],
          [Univ. Exchange],
          [ #lorem(16) ],
        )
        entry(
          right: [*\@MIT* -- Cambridge, US #inline[🇺🇸]],
          chronology(start: "2010", end: "2015"),
          [Master of Engineering],
          [ #lorem(20) ],
        )
      }
    )

  },

  // Empty space.
  {},

  // Right column.
  {
    show: theme.with(
      gutter-width: 48pt,
      section-style: "underlined",
    )

    section(
      theme: (
        accent-color: rgb("888"),
        gutter-body-color: rgb("888"),
        body-color: rgb("888"),
        section-style: "outlined",
      ),
      [Contact],
      {
        entry(
          [Home],
          [Hong Kong, China],
          none,
        )
        entry(
          [Phone],
          link("https://wa.me/85212345678", "+852 1234 5678"),
          none,
        )
        entry(
          [Email],
          link("mailto:contact@me.com", "contact@me.com"),
          none,
        )
        entry(
          [LinkedIn],
          link("https://www.linkedin.com/in/john-doe", "in/john-doe"),
          none,
        )
      }
    )

    section(
      theme: (
        section-style: "outlined",
      ),
      [Technology Stack],
      {
        entry(
          [Web],
          [ASP.NET + Blazor],
          [
            Server & WebAssembly
            #progress-bar(100%)
          ],
        )
        //#entry(
        //  none,
        //  "Express + React",
        //  progress-bar(50%),
        //)
        entry(
          [Native],
          [WPF, Xamarin],
          progress-bar(50%),
        )
        entry(
          [DBMS],
          [MS SQL],
          progress-bar(75%),
        )
        entry(
          [Ops],
          [Hosting, CI/CD],
          [Azure, Pulumi],
        )
        entry(
          none,
          [Scripting],
          [PowerShell, VBS/VBA],
        )
        entry(
          [Other],
          [Gaming],
          [XNA, Godot],
        )
        entry(
          none,
          [Graphics],
          [Paint 3D, MS Designer],
        )
      }
    )

    section(
      [Languages],
      {
        entry(
          right: [_Full of beans_],
          [Fluent],
          [#inline[🇺🇸] English],
          none,
        )
        entry(
          right: [_Doppelgänger_],
          [Proficient],
          [#inline[🇩🇪] German],
          none,
        )
        entry(
          right: [恭喜發財],
          none,
          [#inline[🇨🇳] Mandarin],
          none,
        )
        entry(
          right: [いただきます],
          [Basic],
          [#inline[🇯🇵] Japanese],
          none,
        )
      }
    )

    section(
      [Extracurricular Activities],
      {
        entry(
          [Culture],
          none,
          [Traveling, photography],
        )
        entry(
          [Sport],
          none,
          [Hiking, bodybuilding, chess],
        )
      }
    )

  },

)
