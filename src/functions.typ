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
    #set text(font: "Libertinus Serif", size: 1em, weight: "bold", fill: rgb("#1f3a5f"))
    #upper(it.body)
    #v(-0.75em) #line(length: 100%, stroke: 1pt + rgb("#1f3a5f"))
    #v(-2pt)
  ]

  show heading.where(level: 1): it => block(width: 100%)[
    #set text(font: "Libertinus Serif", size: 1.5em, weight: "bold", fill: rgb("#1f3a5f"))
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
    #items.filter(x => x != none).join([#sym.space.en #sym.diamond.filled #sym.space.en])
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
    #par[#summary]
  ]
}

// =============================================================================
// EDUCATION SECTION (Resume)
// =============================================================================

#let render-education(educations) = {
  if educations.len() == 0 { return }
  block[
    == Education
    #for edu in educations {
      let area_str = if edu.area != "" { " in " + edu.area } else { "" }

      let edu-items = ""
      if edu.courses.len() > 0 {
        edu-items = edu-items + "- *Courses*: " + edu.courses.join(", ")
      }

      block(width: 100%, above: 0.625em)[
        #if edu.url != "" [
          *#link("https://" + edu.url)[#edu.institution]* #h(1fr) \
        ] else [
          *#edu.institution* #h(1fr) \
        ]
        #text(style: "italic")[#edu.studyType#area_str] #h(1fr)
        #daterange_short(edu.startDate, edu.endDate) \
        #eval(edu-items, mode: "markup")
      ]
    }
  ]
}

// =============================================================================
// WORK EXPERIENCE SECTION (Resume)
// =============================================================================

#let render-work(works) = {
  if works.len() == 0 { return }
  block[
    == Experience
    #for w in works {
      let company_block = block(width: 100%, above: 0.625em)[
        #if w.url != "" [
          *#link("https://" + w.url)[#w.name]* #h(1fr)
        ] else [
          *#w.name* #h(1fr)
        ]
        #if w.location != "" [#w.location]
        \
      ]

      let position_blocks = ()
      for p in w.positions {
        position_blocks.push(
          block(width: 100%, above: 0.375em, below: 1.25em)[
            #text(style: "italic", weight: "bold", fill: rgb("#1f3a5f"))[#p.position] #h(1fr)
            #daterange_short(p.startDate, p.endDate) \
            #for hi in p.highlights [
              - #hi
            ]
          ]
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
  block[
    == Work Experience & Accomplishments

    #for company in companies {
      let company_block = block(width: 100%, above: 0.625em)[
        #if company.url != "" [
          *#link("https://" + company.url)[#company.name]* #h(1fr)
        ] else [
          *#company.name* #h(1fr)
        ]
        #if company.location != "" [#company.location]
        \
      ]

      let role_blocks = ()
      for role in company.roles {
        role_blocks.push(
          block(width: 100%, above: 0.375em, below: 1.25em)[
            #text(style: "italic", weight: "bold", fill: rgb("#1f3a5f"))[#role.title] #h(1fr)
            #daterange_short(role.startDate, role.endDate) \
            #for acc in role.accomplishments [
              #block(above: 0.75em)[
                - *#acc.title:* #acc.description #text(style: "italic")[(#acc.impact)]
              ]
            ]
          ]
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
  block[
    == Major Accomplishments

    #for acc in accomplishments {
      block(width: 100%, above: 0.25em, below: 1.25em)[
        #text(weight: "bold", fill: rgb("#1f3a5f"))[#acc.title] \
        - *What I did:* #acc.what
        - *Why it mattered:* #acc.why
        - *Impact:* #acc.impact
        - *Who I worked with:* #acc.collaborators
        - *Date:* #acc.date
      ]
    }
  ]
}

// =============================================================================
// GOALS & FOCUS AREAS SECTION (Bragdoc)
// =============================================================================

#let render-goals(goals, focus-areas) = {
  if goals.len() == 0 and focus-areas.len() == 0 { return }
  block[
    == Goals & Focus Areas

    *What were your main goals this period?*
    #for goal in goals [
      - #goal
    ]

    #v(6pt)

    *What areas did you focus on?*
    #for area in focus-areas [
      - #area
    ]
  ]
}

// =============================================================================
// COLLABORATION & CROSS-FUNCTIONAL WORK SECTION (Bragdoc)
// =============================================================================

#let render-collaboration(collaborations) = {
  if collaborations.len() == 0 { return }
  block[
    == Collaboration & Cross-Functional Work

    #for collab in collaborations [
      - *Partnered with #collab.partner:* #collab.contribution
    ]
  ]
}

// =============================================================================
// SKILLS & GROWTH SECTION (Bragdoc)
// =============================================================================

#let render-skills(skills, challenges) = {
  block[
    == Skills Developed & Growth

    *What new skills did you learn or improve?*
    #for skill in skills [
      - #skill
    ]

    #v(6pt)

    *What challenges did you overcome?*
    #for challenge in challenges [
      - #challenge
    ]
  ]
}

// =============================================================================
// FEEDBACK & RECOGNITION SECTION (Bragdoc)
// =============================================================================

#let render-feedback(feedback-items) = {
  if feedback-items.len() == 0 { return }
  block[
    == Positive Feedback & Recognition

    #for item in feedback-items [
      #block(above: 0.625em)[
        - "#item.quote" - #item.person, #item.date
      ]
    ]
  ]
}

// =============================================================================
// PROJECTS SECTION (Resume)
// =============================================================================

#let render-project(projects) = {
  if projects.len() == 0 { return }
  block[
    == Projects
    #for project in projects {
      block(width: 100%, above: 0.625em)[
        #if project.url != "" [
          *#link("https://" + project.url)[#project.name]* \
        ] else [
          *#project.name* \
        ]
        #if project.roles.len() > 0 [
          #text(style: "italic")[#project.roles.join(", ")] #h(1fr)
        ]
        #if project.startDate != "" or project.endDate != "" [
          #daterange_short(project.startDate, project.endDate) \
        ]
        #for hi in project.highlights [
          - #hi
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
  block[
    == Projects & Initiatives

    #for project in projects {
      block(width: 100%, above: 0.25em, below: 1.25em)[
        #if project.url != "" [
          *#link("https://" + project.url)[#project.name]* \
        ] else [
          *#project.name* \
        ]
        #text(fill: rgb("#555555"), size: 9pt)[#project.status #h(2pt) #project.date] \
        #if project.roles.len() > 0 [
          #text(style: "italic")[#project.roles.join(", ")] \
        ]
        #if project.description != "" [
          #project.description \
        ]
        #for hi in project.highlights [
          - #hi
        ]
        #if project.metrics.len() > 0 [
          - *Key Metrics:* #project.metrics.join(", ")
        ]
      ]
    }
  ]
}

// =============================================================================
// CUSTOM SECTION (Resume - Skills, Languages, etc.)
// =============================================================================

#let render-custom(custom_section) = {
  block[
    == #custom_section.title
    #for highlight in custom_section.highlights [
      - *#highlight.summary*: #highlight.description
    ]
  ]
}

// =============================================================================
// METRICS SECTION (Bragdoc)
// =============================================================================

#let render-metrics(metrics) = {
  if metrics.len() == 0 { return }
  block[
    == Metrics & Impact

    #for metric in metrics [
      #block(above: 0.625em)[
        - *#metric.label*: #metric.value #h(2pt) #text(style: "italic")[#metric.description]
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
