// resume.typ - Resume Data & Entry Point
// Edit data below to update resume. Formatting is in functions.typ.
//
// Content sourced (verbatim, satirical) from:
// https://www.reddit.com/r/recruitinghell/comments/qhg5jo/this_resume_got_me_an_interview/
// Replace placeholder contact info with your own if adapting.

#import "functions.typ": cvinit, render-basic-info, render-summary, render-education, render-work, render-project, render-custom

// =============================================================================
// Personal Information
// =============================================================================
#let name = "YOUR NAME"
#let title = "Senior Full Stack Engineer"
#let location = "Palo Alto, California, USA"
#let email = "your.name@example.com"
#let phone = "+1 (555) 123-4567"
#let url = "yourname.dev"

// Social profiles: network (platform), username, url
// Add more profiles by adding tuples to this array
#let profiles = (
  (
    network: "LinkedIn",
    username: "yourname",
    url: "linkedin.com/in/yourname",
  ),
  (
    network: "GitHub",
    username: "yourname",
    url: "github.com/yourname",
  ),
  (
    network: "Instagram",
    username: "yourname",
    url: "instagram.com/yourname",
  ),
)

// =============================================================================
// Summary - Brief professional overview
// =============================================================================
// Keep this concise - 2-3 sentences max
#let summary = "Experienced software engineer with a background of building scalable systems in the fintech, health, and media industries. Expert in JavaScript, TypeScript, Node.js, React AI, and C++ (and powered almost entirely by coffee and the occasional warp-core energy drink)."

// =============================================================================
// Education & Certifications
// =============================================================================
#let educations = (
  (
    institution: "University of California, Berkeley",
    location: "Berkeley, California",
    url: "berkeley.edu",
    area: "Computer Science",
    studyType: "B.S.",
    startDate: "August 2010",
    endDate: "May 2013",
    score: "GPA 3.94",
    courses: ("Graduated Summa Cum Laude", "Machine Learning at Berkeley Club (co-founder)"),
  ),
)

// =============================================================================
// Work Experience
// =============================================================================
#let works = (
  (
    name: "Instagram",
    location: "Palo Alto, California",
    url: "instagram.com",
    positions: (
      (
        position: "Engineering Manager - Web App Team",
        startDate: "October 2021",
        endDate: "Present",
        highlights: (
          "Promoted to Engineering Manager, leading the Web App Team of 6 engineers behind the BlockChain news feed",
          "Scaled the team to 12 engineers while sustaining a 420fps caffeine-driven delivery velocity",
          "Drove a 69% improvement in deployment frequency via AI based GraphQL and on-server Ethereum mining",
          "Managed cross-functional initiative to mine Ethereum on company servers in low Earth orbit, offsetting $2M/year in infrastructure costs",
          "Kept the entire org fully caffeinated with Antarctican beans ground to 14 nm particles",
        ),
      ),
      (
        position: "Senior Full Stack Engineer - Web App Team",
        startDate: "October 2018",
        endDate: "October 2021",
        highlights: (
          "Built news feed infrastructure using React for AI on BlockChain",
          "Optimized web app feed performance through new server-side React larceny AI algorithm to quickly resolve big data pipeline",
          "Led team of 6 engineers to mine Ethereum on company servers in low Earth orbit",
          "Team coffee maker - ensured team of 6 was fully caffeinated with Antarctican coffee beans ground to 14 nm particles using a miniature ion cannon",
        ),
      ),
    ),
  ),
  (
    name: "Zillow",
    location: "San Francisco, California",
    url: "zillow.com",
    positions: (
      (
        position: "Senior Full Stack Engineer - Web App Team",
        startDate: "June 2015",
        endDate: "September 2018",
        highlights: (
          "Added AI based GraphQL, resulting in 69% faster page loads",
          "Organized team bonding through company potato sack race resulting in increased team bonding and cohesity",
          "Rebuilt home display page with virtualized tables and map to provide a buttery-smooth 120fps on screen experience with the design team",
          "Evangelized and adopted an open-source React UI library",
        ),
      ),
    ),
  ),
  (
    name: "LinkedIn",
    location: "San Francisco, California",
    url: "linkedin.com",
    positions: (
      (
        position: "Software Engineer - Search Team",
        startDate: "June 2013",
        endDate: "September 2015",
        highlights: (
          "Improved LinkedIn search algorithm efficiency and accuracy through the usage of VoldemortDB, Charizard, and Hadoop",
          "Tracked down Richard Stallman on IRC and exchanged /msgs (he actually replied!)",
          "Implemented data quality improvements via deduplication and advanced profile ranking resulting in faster big data with React",
        ),
      ),
    ),
  ),
  (
    name: "Microsoft",
    location: "Redmond, Washington",
    url: "microsoft.com",
    positions: (
      (
        position: "Software Engineer Intern - Edge Team",
        startDate: "May 2011",
        endDate: "August 2012",
        highlights: (
          "Built React based big data pipeline to enhance deployment stability of Microsoft Edge browser on the Blockchain",
          "Spearheaded the company's annual Star Fleet recruitment rally (gold shirts optional)",
          "Organized an intern onboarding bootcamp (snacks provided) that improved ramp-up time by 60%",
        ),
      ),
    ),
  ),
  // Add more companies as needed
)

// =============================================================================
// Skills Section
// =============================================================================
#let skills_section = (
  title: "Technical & Core Competencies",
  highlights: (
    (
      summary: "Languages & Runtimes",
      description: "JavaScript, TypeScript, Node.js, C++",
    ),
    (
      summary: "Frontend & AI",
      description: "React, React AI, GraphQL",
    ),
    (
      summary: "Domains",
      description: "Fintech, Health, Media",
    ),
    (
      summary: "Notable Expertise",
      description: "Caffeine Logistics & Meetingology",
    ),
  ),
)

// =============================================================================
// Projects
// =============================================================================
#let projects = (
  (
    name: "News Feed Infrastructure",
    url: "instagram.com",
    roles: ("React", "AI", "BlockChain"),
    startDate: "2018",
    endDate: "Present",
    highlights: (
      "Server-side React larceny AI algorithm for big data pipeline",
      "Ethereum mining on company servers with a team of 6",
    ),
  ),
  // Add more projects as needed
)

// =============================================================================
// Render Resume
// =============================================================================
#show: cvinit.with(author: name, title: title)

#render-basic-info(name: name, title: title, location: location, email: email, phone: phone, url: url, profiles: profiles)
#v(1em)
#render-summary(summary)
#v(1em)
#render-work(works)
#v(1em)
#render-custom(skills_section)
#v(1em)
#render-project(projects)
#v(1em)
#render-education(educations)
