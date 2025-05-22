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
  columns: (10fr, 34pt, 6fr),

  // Left column.
  [
    === Professional Experience

    #entry(
      right: [*\@Microsoft* -- Cyberport, HK 🇭🇰],
      "2020 - now",
      "Senior Engineer",
      [
        #par(lorem(12))
        #list(
          lorem(20),
          lorem(6),
          lorem(16),
        )
      ],
    )
    #entry(
      theme: accent-theme,
      right: [*\@Supersoft* -- Seattle, US 🇺🇸],
      "2018 - now",
      "Co-Founder, CTO",
      [ #lorem(28) ],
    )
    #entry(
      right: [*\@Microsoft* -- Berlin, DE 🇩🇪],
      "2016 - 2020",
      "Software Engineer",
      [
        #par(lorem(12))
        #list(
          lorem(16),
          lorem(12),
        )
      ],
    )
    #entry(
      right: [*\@Microsoft* -- Redmond, US 🇺🇸],
      "2015 - 2016",
      "CS Intern",
      [ #lorem(12) ],
    )
    #entry(
      right: [*\@MIT* -- Cambridge, US 🇺🇸],
      "2013, 2 yrs",
      "Teaching Assistant",
      [ #lorem(10) ],
    )

    === Educational Background

    #entry(
      theme: accent-theme,
      right: [*\@SNU 서울대학교* -- Seoul, KR 🇰🇷],
      "2012, 6 mths",
      "Univ. Exchange",
      [ #lorem(16) ],
    )
    #entry(
      right: [*\@MIT* -- Cambridge, US 🇺🇸],
      "2010 - 2015",
      "Master of Engineering",
      [ #lorem(20) ],
    )
  ],

  // Empty space.
  {},

  // Right column.
  [
    #show: section.with(
      theme: (
        gutter-width: 46pt,
      )
    )

    #{
      show: section.with(
        theme: (
          accent-color: rgb("888"),
          gutter-body-color: rgb("888"),
          body-color: rgb("888"),
        )
      )

      heading(level: 3, "Contact")

      entry(
        "Home",
        "Hong Kong, China",
        none,
      )
      entry(
        "Phone",
        link("https://wa.me/85212345678", "+852 1234 5678"),
        none,
      )
      entry(
        "Email",
        link("mailto:contact@me.com", "contact@me.com"),
        none,
      )
      entry(
        "LinkedIn",
        link("https://www.linkedin.com/in/john-doe", "in/john-doe"),
        none,
      )
    }

    === Technology Stack

    #entry(
      "Web",
      "ASP.NET + Blazor",
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
    #entry(
      "Native",
      "WPF, Xamarin",
      progress-bar(50%),
    )
    #entry(
      "DBMS",
      "MS SQL",
      progress-bar(75%),
    )
    #entry(
      "Ops",
      "Hosting, CI/CD",
      [Azure, Pulumi],
    )
    #entry(
      none,
      "Scripting",
      [PowerShell, VBS/VBA],
    )
    #entry(
      "Other",
      "Gaming",
      [XNA, Godot],
    )
    #entry(
      none,
      "Graphics",
      [Paint 3D, MS Designer],
    )

    === Languages

    #entry(
      right: [_Full of beans_],
      "Fluent",
      "🇺🇸 English",
      none,
    )
    #entry(
      right: [_Doppelgänger_],
      "Proficient",
      "🇩🇪 German",
      none,
    )
    #entry(
      right: "恭喜發財",
      none,
      "🇨🇳 Mandarin",
      none,
    )
    #entry(
      right: "いただきます",
      "Basic",
      "🇯🇵 Japanese",
      none,
    )

    === Extracurricular Activities

    #entry(
      "Culture",
      none,
      [Traveling, photography],
    )
    #entry(
      "Sport",
      none,
      [Hiking, bodybuilding, chess],
    )
  ],
)
