// =============================================================================
// functions.typ - Shared Template Functions (Resume + Brag Document)
// =============================================================================
// Based on imprecv: https://github.com/jskherman/imprecv
// Single shared functions file for both resume and brag document templates.
// =============================================================================

// =============================================================================
// Date Range Formatter
// =============================================================================
// Displays start and end dates with an en dash (e.g., "Mar 2025 – Mar 2026")

#let daterange_short(start, end) = {
  if start != "" and end != "" {
    [#start #sym.dash.en #end]
  } else if start == "" and end != "" {
    [#end]
  } else if start != "" and end == "" {
    [#start]
  } else {
    []
  }
}

// =============================================================================
// Bold Markup Parser
// =============================================================================
// Converts *bold* syntax in strings to properly styled Typst content.
// Usage: #parse-bold("Drove a *69% improvement* in deployment")

#let parse-bold(text-str) = {
  let parts = text-str.split("*")
  let result = ()
  for i in range(parts.len()) {
    let part = parts.at(i)
    if part == "" { continue }
    if calc.rem(i, 2) == 1 {
      result.push(text(weight: "bold")[#part])
    } else {
      result.push([#part])
    }
  }
  result.join()
}

// =============================================================================
// Document Style Rules
// =============================================================================
// Global text, paragraph, and list styles

#let setrules(doc) = {
  set text(
    font: "Libertinus Serif",
    //font: "DejaVu Sans Mono", "New Computer Modern"
    size: 11pt,
    hyphenate: false,
  )

  set list(spacing: 7.5pt)

  set par(
    leading: 6pt,
    justify: true,
  )

  doc
}

// =============================================================================
// Show Rules (Heading Styles)
// =============================================================================
// Heading level 1 and 2 display rules

#let showrules(doc) = {
  show heading.where(level: 2): it => block(width: 100%)[
    #v(-2pt)
    #set align(left)
    #set text(
      font: "Libertinus Serif",
      size: 1em,
      weight: "bold",
      fill: rgb("#1f3a5f"),
    )
    #upper(it.body)
    #v(-0.75em) #line(length: 100%, stroke: 1pt + rgb("#1f3a5f"))
    #v(-2pt)
  ]

  show heading.where(level: 1): it => block(width: 100%)[
    #set text(
      font: "Libertinus Serif",
      size: 1.5em,
      weight: "bold",
      fill: rgb("#1f3a5f"),
    )
    #upper(it.body)
    #v(0pt)
  ]

  doc
}

// =============================================================================
// Document Initialization
// =============================================================================
// Usage: #show: cvinit.with(author: name, title: "...", numbering: "1")

#let cvinit(numbering: none, author: none, title: none, doc) = {
  set page(
    paper: "us-letter",
    flipped: false,
    margin: (
      top: 0.5in,
      bottom: 0.75in,
      left: 0.5in,
      right: 0.5in,
    ),
    numbering: numbering,
    footer: context {
      grid(
        columns: (1fr, 1fr, 1fr),
        align(left)[
          #set text(size: 8pt, fill: rgb("#555555"))
          #if author != none { author }
        ],
        align(center)[
          #set text(size: 8pt, fill: rgb("#555555"))
          #if title != none { title }
        ],
        align(right)[
          #set text(size: 8pt, fill: rgb("#555555"))
          #counter(page).display("1 / 1", both: true)
        ],
      )
    },
  )
  set document(author: author, title: title)
  doc = setrules(doc)
  doc = showrules(doc)
  doc
}

// =============================================================================
// HEADER / BASIC INFO
// =============================================================================
// Resume: Name, Title, Contact Info, LinkedIn/Profiles
// Bragdoc: Name, Title, Review Period

#let render-basic-info(
  name: "",
  title: "",
  location: "",
  phone: "",
  email: "",
  url: "",
  profiles: (),
) = {
  align(center)[
    = #name
  ]

  if title != "" {
    block(width: 100%)[
      #set align(center)
      #set text(fill: rgb("#555555"))
      *#title*
      #v(-4pt)
    ]
  }

  block(width: 100%)[
    #set align(center)
    #let items = (
      if location != "" { location },
      if phone != "" { phone },
      if email != "" { link("mailto:" + email)[#email] },
      if url != "" { link("https://" + url)[#url] },
    )
    #(
      items
        .filter(x => x != none)
        .join([#sym.space.en #sym.diamond.filled #sym.space.en])
    )
    #if profiles.len() > 0 {
      sym.space.en
      sym.diamond.filled
      sym.space.en
      profiles
        .map(profile => {
          link("https://" + profile.url)[#profile.username]
        })
        .join([#sym.space.en #sym.diamond.filled #sym.space.en])
    }
  ]
}

#let render-header(
  name: "",
  title: "",
  review-period: "",
) = {
  set document(
    author: name,
    title: name + " - Brag Document",
  )

  align(center)[
    = #name
  ]

  if title != "" {
    block(width: 100%)[
      #set align(center)
      #set text(fill: rgb("#555555"))
      *#title*
      #v(-4pt)
    ]
  }

  if review-period != "" {
    block(width: 100%)[
      #set align(center)
      #set text(style: "italic", fill: rgb("#555555"))
      #review-period
      #v(-4pt)
    ]
  }
}

// =============================================================================
// SUMMARY SECTION (Resume)
// =============================================================================

#let render-summary(summary) = {
  if summary == "" { return }
  block[
    == Summary
    #par[#parse-bold(summary)]
  ]
}

// =============================================================================
// EDUCATION SECTION (Resume)
// =============================================================================

#let render-education(educations) = {
  if educations.len() == 0 { return }
  let valid-educations = educations.filter(e => e.institution != "" or e.area != "" or e.studyType != "")
  if valid-educations.len() == 0 { return }
  block[
    == Education
    #for edu in valid-educations {
      let area_str = if edu.area != "" { " in " + edu.area } else { "" }
      let study-display = if edu.studyType != "" or area_str != "" { [#text(style: "italic")[#edu.studyType#area_str] #h(1fr)] } else { [] }

      // Robust courses handling: supports "" , "single course", ("a","b"), or ()
      let courses-raw = edu.at("courses", default: ())
      let valid-courses = if type(courses-raw) == str {
        if courses-raw != "" { (courses-raw,) } else { () }
      } else {
        courses-raw.filter(c => c != "" and c != none)
      }
      let edu-items = ""
      if valid-courses.len() > 0 {
        edu-items = edu-items + "- *Courses*: " + valid-courses.join(", ")
      }
      // Optional score if present and non-empty
      let score-raw = edu.at("score", default: "")
      if score-raw != "" and score-raw != none {
        if edu-items != "" { edu-items = edu-items + "\n" }
        edu-items = edu-items + "- *Score*: " + score-raw
      }

      let date-line = daterange_short(edu.at("startDate", default: ""), edu.at("endDate", default: ""))

      block(width: 100%, above: 0.625em)[
        #if edu.at("url", default: "") != "" [
          *#link("https://" + edu.url)[#edu.institution]* #h(1fr) \
        ] else if edu.institution != "" [
          *#edu.institution* #h(1fr) \
        ]
        #if study-display != [] { study-display }
        #if date-line != [] { [#date-line \ ] }
        #if edu-items != "" { eval(edu-items, mode: "markup") }
      ]
    }
  ]
}

// =============================================================================
// WORK EXPERIENCE SECTION (Resume)
// =============================================================================

#let render-work(works) = {
  if works.len() == 0 { return }
  let valid-works = works.filter(w => w.at("name", default: "") != "")
  if valid-works.len() == 0 { return }
  block[
    == Experience
    #for w in valid-works {
      let company_block = block(width: 100%, above: 0.625em)[
        #if w.at("url", default: "") != "" [
          *#link("https://" + w.url)[#w.name]* #h(1fr)
        ] else [
          *#w.name* #h(1fr)
        ]
        #if w.at("location", default: "") != "" [#w.location]
        \
      ]

      let position_blocks = ()
      for p in w.positions {
        if p.at("position", default: "") == "" and p.at("highlights", default: ()).len() == 0 { continue }
        let valid-highlights = p.at("highlights", default: ()).filter(h => h != "" and h != none)
        let has-position = p.at("position", default: "") != ""
        let has-dates = p.at("startDate", default: "") != "" or p.at("endDate", default: "") != ""
        position_blocks.push(
          block(width: 100%, above: 0.375em, below: 1.25em)[
            #if has-position {
              text(
                style: "italic",
                weight: "bold",
                fill: rgb("#1f3a5f"),
              )[#p.position] 
              h(1fr)
            }
            #if has-position or has-dates { daterange_short(p.at("startDate", default: ""), p.at("endDate", default: "")) }
            #if has-position or has-dates { [\ ] }
            #for hi in valid-highlights [
              - #parse-bold(hi)
            ]
          ],
        )
      }

      company_block
      for pb in position_blocks { pb }
    }
  ]
}

// =============================================================================
// WORK EXPERIENCE & ACCOMPLISHMENTS SECTION (Bragdoc)
// =============================================================================

#let render-work-accomplishments(companies) = {
  if companies.len() == 0 { return }
  let valid-companies = companies.filter(c => c.at("name", default: "") != "")
  if valid-companies.len() == 0 { return }
  block[
    == Work Experience & Accomplishments

    #for company in valid-companies {
      let company_block = block(width: 100%, above: 0.625em)[
        #if company.at("url", default: "") != "" [
          *#link("https://" + company.url)[#company.name]* #h(1fr)
        ] else [
          *#company.name* #h(1fr)
        ]
        #if company.at("location", default: "") != "" [#company.location]
        \
      ]

      let role_blocks = ()
      for role in company.roles {
        if role.at("title", default: "") == "" and role.at("accomplishments", default: ()).len() == 0 { continue }
        let valid-accs = role.at("accomplishments", default: ()).filter(a => a.at("title", default: "") != "" or a.at("description", default: "") != "" or a.at("impact", default: "") != "")
        role_blocks.push(
          block(width: 100%, above: 0.375em, below: 1.25em)[
            #if role.at("title", default: "") != "" {
              text(
                style: "italic",
                weight: "bold",
                fill: rgb("#1f3a5f"),
              )[#role.title] 
              h(1fr)
            }
            #daterange_short(role.at("startDate", default: ""), role.at("endDate", default: "")) \
            #for acc in valid-accs [
              #block(above: 0.75em)[
                - #if acc.at("title", default: "") != "" { text(weight: "bold")[#acc.title:] + [ ] }
                  #if acc.at("description", default: "") != "" { parse-bold(acc.description) + [ ] }
                  #if acc.at("impact", default: "") != "" { text(style: "italic")[(#parse-bold(acc.impact))] }
              ]
            ]
          ],
        )
      }

      company_block
      for rb in role_blocks { rb }
    }
  ]
}

// =============================================================================
// MAJOR ACCOMPLISHMENTS SECTION (Bragdoc)
// =============================================================================

#let render-accomplishments(accomplishments) = {
  if accomplishments.len() == 0 { return }
  let valid-accs = accomplishments.filter(a => a.at("title", default: "") != "" or a.at("what", default: "") != "" or a.at("impact", default: "") != "")
  if valid-accs.len() == 0 { return }
  block[
    == Major Accomplishments

    #for acc in valid-accs {
      block(width: 100%, above: 0.25em, below: 1.25em)[
        #if acc.at("title", default: "") != "" { text(weight: "bold", fill: rgb("#1f3a5f"))[#acc.title] + [\ ] }
        #if acc.at("what", default: "") != "" [ - *What I did:* #parse-bold(acc.what) ]
        #if acc.at("why", default: "") != "" [ - *Why it mattered:* #parse-bold(acc.why) ]
        #if acc.at("impact", default: "") != "" [ - *Impact:* #parse-bold(acc.impact) ]
        #if acc.at("collaborators", default: "") != "" [ - *Who I worked with:* #acc.collaborators ]
        #if acc.at("date", default: "") != "" [ - *Date:* #acc.date ]
      ]
    }
  ]
}

// =============================================================================
// GOALS & FOCUS AREAS SECTION (Bragdoc)
// =============================================================================

#let render-goals(goals, focus-areas) = {
  let valid-goals = goals.filter(g => g != "" and g != none)
  let valid-areas = focus-areas.filter(a => a != "" and a != none)
  if valid-goals.len() == 0 and valid-areas.len() == 0 { return }
  block[
    == Goals & Focus Areas

    #if valid-goals.len() > 0 {
      [*What were your main goals this period?*]
      for goal in valid-goals [
        - #parse-bold(goal)
      ]
    }

    #if valid-goals.len() > 0 and valid-areas.len() > 0 { v(6pt) }

    #if valid-areas.len() > 0 {
      [*What areas did you focus on?*]
      for area in valid-areas [
        - #parse-bold(area)
      ]
    }
  ]
}

// =============================================================================
// COLLABORATION & CROSS-FUNCTIONAL WORK SECTION (Bragdoc)
// =============================================================================

#let render-collaboration(collaborations) = {
  if collaborations.len() == 0 { return }
  let valid-collabs = collaborations.filter(c => c.at("partner", default: "") != "" or c.at("contribution", default: "") != "")
  if valid-collabs.len() == 0 { return }
  block[
    == Collaboration & Cross-Functional Work

    #for collab in valid-collabs [
      - #if collab.at("partner", default: "") != "" { text(weight: "bold")[Partnered with #collab.partner:] + [ ] }
        #if collab.at("contribution", default: "") != "" { parse-bold(collab.contribution) }
    ]
  ]
}

// =============================================================================
// SKILLS & GROWTH SECTION (Bragdoc)
// =============================================================================

#let render-skills(skills, challenges) = {
  let valid-skills = skills.filter(s => s != "" and s != none)
  let valid-challenges = challenges.filter(c => c != "" and c != none)
  if valid-skills.len() == 0 and valid-challenges.len() == 0 { return }
  block[
    == Skills Developed & Growth

    #if valid-skills.len() > 0 {
      [*What new skills did you learn or improve?*]
      for skill in valid-skills [
        - #parse-bold(skill)
      ]
    }

    #if valid-skills.len() > 0 and valid-challenges.len() > 0 { v(6pt) }

    #if valid-challenges.len() > 0 {
      [*What challenges did you overcome?*]
      for challenge in valid-challenges [
        - #parse-bold(challenge)
      ]
    }
  ]
}

// =============================================================================
// FEEDBACK & RECOGNITION SECTION (Bragdoc)
// =============================================================================

#let render-feedback(feedback-items) = {
  if feedback-items.len() == 0 { return }
  let valid-items = feedback-items.filter(i => i.at("quote", default: "") != "" or i.at("person", default: "") != "")
  if valid-items.len() == 0 { return }
  block[
    == Positive Feedback & Recognition

    #for item in valid-items [
      #block(above: 0.625em)[
        - #if item.at("quote", default: "") != "" { [#parse-bold(item.quote)] } else { [ ] }
          #if item.at("person", default: "") != "" or item.at("date", default: "") != "" {
            [ — ]
            if item.at("person", default: "") != "" { [#item.person] }
            if item.at("person", default: "") != "" and item.at("date", default: "") != "" { [, ] }
            if item.at("date", default: "") != "" { [#item.date] }
          }
      ]
    ]
  ]
}

// =============================================================================
// PROJECTS SECTION (Resume)
// =============================================================================

#let render-project(projects) = {
  if projects.len() == 0 { return }
  let valid-projects = projects.filter(p => p.at("name", default: "") != "")
  if valid-projects.len() == 0 { return }
  block[
    == Projects
    #for project in valid-projects {
      let valid-roles = project.at("roles", default: ()).filter(r => r != "" and r != none)
      let valid-highlights = project.at("highlights", default: ()).filter(h => h != "" and h != none)
      block(width: 100%, above: 0.625em)[
        #if project.at("url", default: "") != "" [
          *#link("https://" + project.url)[#project.name]* \
        ] else [
          *#project.name* \
        ]
        #if valid-roles.len() > 0 [
          #text(style: "italic")[#valid-roles.join(", ")] #h(1fr)
        ]
        #if project.at("startDate", default: "") != "" or project.at("endDate", default: "") != "" [
          #daterange_short(project.at("startDate", default: ""), project.at("endDate", default: "")) \
        ]
        #for hi in valid-highlights [
          - #parse-bold(hi)
        ]
      ]
    }
  ]
}

// =============================================================================
// PROJECTS SECTION (Bragdoc - extended with metrics)
// =============================================================================

#let render-bragdoc-projects(projects) = {
  if projects.len() == 0 { return }
  let valid-projects = projects.filter(p => p.at("name", default: "") != "")
  if valid-projects.len() == 0 { return }
  block[
    == Projects & Initiatives

    #for project in valid-projects {
      let valid-roles = project.at("roles", default: ()).filter(r => r != "" and r != none)
      let valid-highlights = project.at("highlights", default: ()).filter(h => h != "" and h != none)
      let valid-metrics = project.at("metrics", default: ()).filter(m => m != "" and m != none)
      let has-status = project.at("status", default: "") != ""
      let has-date = project.at("date", default: "") != ""
      block(width: 100%, above: 0.25em, below: 1.25em)[
        #if project.at("url", default: "") != "" [
          *#link("https://" + project.url)[#project.name]* \
        ] else [
          *#project.name* \
        ]
        #if has-status or has-date {
          text(fill: rgb("#555555"), size: 9pt)[
            #if has-status [#project.status]
            #if has-status and has-date [#h(2pt)]
            #if has-date [#project.date]
          ]
          [\ ]
        }
        #if valid-roles.len() > 0 [
          #text(style: "italic")[#valid-roles.join(", ")] \
        ]
        #if project.at("description", default: "") != "" [
          #project.description \
        ]
        #for hi in valid-highlights [
          - #parse-bold(hi)
        ]
        #if valid-metrics.len() > 0 [
          - #text(weight: "bold")[Key Metrics:] #parse-bold(
              valid-metrics.join(", "),
            )
        ]
      ]
    }
  ]
}

// =============================================================================
// CUSTOM SECTION (Resume - Skills, Languages, etc.)
// =============================================================================

#let render-custom(custom_section) = {
  if custom_section.at("title", default: "") == "" and custom_section.at("highlights", default: ()).len() == 0 { return }
  let valid-highlights = custom_section.at("highlights", default: ()).filter(h => h.at("summary", default: "") != "" or h.at("description", default: "") != "")
  if valid-highlights.len() == 0 and custom_section.at("title", default: "") == "" { return }
  block[
    #if custom_section.at("title", default: "") != "" [ == #custom_section.title ]
    #for highlight in valid-highlights [
      - #if highlight.at("summary", default: "") != "" { [*#highlight.summary*] }
        #if highlight.at("summary", default: "") != "" and highlight.at("description", default: "") != "" { [: ] }
        #if highlight.at("description", default: "") != "" { [#highlight.description] }
    ]
  ]
}

// =============================================================================
// METRICS SECTION (Bragdoc)
// =============================================================================

#let render-metrics(metrics) = {
  if metrics.len() == 0 { return }
  let valid-metrics = metrics.filter(m => m.at("label", default: "") != "" or m.at("value", default: "") != "" or m.at("description", default: "") != "")
  if valid-metrics.len() == 0 { return }
  block[
    == Metrics & Impact

    #for metric in valid-metrics [
      #block(above: 0.625em)[
        - #if metric.at("label", default: "") != "" { text(weight: "bold")[#metric.label:] + [ ] }
          #if metric.at("value", default: "") != "" { parse-bold(metric.value) + h(2pt) }
          #if metric.at("description", default: "") != "" { text(style: "italic")[#parse-bold(metric.description)] }
      ]
    ]
  ]
}

// =============================================================================
// BUILDER HELPERS (Bragdoc)
// =============================================================================

#let role-entry(
  title: "",
  startDate: "",
  endDate: "",
  accomplishments: (),
) = {
  (
    title: title,
    startDate: startDate,
    endDate: endDate,
    accomplishments: accomplishments,
  )
}

#let company-entry(
  name: "",
  url: "",
  location: "",
  roles: (),
) = {
  (
    name: name,
    url: url,
    location: location,
    roles: roles,
  )
}

#let role-accomplishment(
  title: "",
  description: "",
  impact: "",
) = {
  (
    title: title,
    description: description,
    impact: impact,
  )
}

#let accomplishment(
  title: "",
  what: "",
  why: "",
  impact: "",
  collaborators: "",
  date: "",
) = {
  (
    title: title,
    what: what,
    why: why,
    impact: impact,
    collaborators: collaborators,
    date: date,
  )
}

#let collaboration(
  partner: "",
  contribution: "",
) = {
  (
    partner: partner,
    contribution: contribution,
  )
}

#let feedback-entry(
  quote: "",
  person: "",
  date: "",
) = {
  (
    quote: quote,
    person: person,
    date: date,
  )
}

#let bragdoc-project-entry(
  name: "",
  url: "",
  description: "",
  roles: (),
  highlights: (),
  metrics: (),
  status: "",
  date: "",
) = {
  (
    name: name,
    url: url,
    description: description,
    roles: roles,
    highlights: highlights,
    metrics: metrics,
    status: status,
    date: date,
  )
}

#let metric-entry(
  label: "",
  value: "",
  description: "",
) = {
  (
    label: label,
    value: value,
    description: description,
  )
}
