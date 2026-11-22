// Brag document data and entry point. Edit this file to update content.
// Formatting functions are in functions.typ.
// Sample data is satirical - replace with your own career information.
// Tone: bragdoc may be unhinged; keep the resume sober (but facts in sync).

#import "functions.typ": cvinit, render-header, render-goals, render-work-accomplishments, render-accomplishments, render-collaboration, render-skills, render-feedback, render-bragdoc-projects, render-metrics, company-entry, role-entry, role-accomplishment, accomplishment, collaboration, feedback-entry, bragdoc-project-entry, metric-entry

// Personal info - update with your details
#let name = "YOUR NAME"
#let photo = "" // Optional image path relative to src, e.g. "headshot.jpg".
#let title = "Senior Full Stack Engineer"
#let review-period = "May 2011 – Present"

// Fictional interview stories. Replace the evidence references with private records.
#let interview-stories = (
  accomplishment(
    title: "Hiring and coaching — Growing the Web App Team",
    why: "The feed roadmap and on-call rotation depended on the same six engineers.",
    what: "Set hiring priorities and introduced onboarding milestones and paired on-call shifts.",
    collaborators: "Recruiting ran the hiring pipeline. Senior engineers coached new hires and signed off on on-call readiness.",
    impact: "Grew the Web App Team from *6 to 12 engineers* and expanded the on-call rotation.",
    evidence: "Headcount plan, onboarding checklists, and rotation roster.",
  ),
  accomplishment(
    title: "Prioritization — Delaying the orbital hosting rollout",
    why: "Finance wanted savings quickly, while Operations needed a safe rollback path.",
    what: "Chose a phased rollout and deferred wider deployment until the pilot met recovery and cost targets.",
    collaborators: "Operations owned recovery drills. Finance validated the savings model.",
    impact: "The phased rollout offset *$2M per year* in infrastructure costs.",
    evidence: "Rollout decision record and Finance's cost reconciliation.",
  ),
  accomplishment(
    title: "Delivery — Increasing deployment frequency",
    why: "Large release batches made it difficult to isolate failures.",
    what: "Set rollout criteria for smaller batches and automated rollback on the feed release pipeline.",
    collaborators: "Release Engineering built the automation. The Web App Team piloted the new release cadence.",
    impact: "Production deployments per week increased by *72%* after rollout.",
    evidence: "Release dashboard comparing deployment frequency before and after rollout.",
  ),
  accomplishment(
    title: "Setback — Pausing the first hosting pilot",
    why: "The pilot missed its recovery target when the team tested a failed deployment.",
    what: "Paused expansion, restored traffic to the original hosts, and assigned owners for the gaps before retrying.",
    collaborators: "Operations led recovery. The Web App Team reproduced the failure and updated the runbook.",
    impact: "The retry met the recovery target before additional traffic moved.",
    follow-up: "Made a timed rollback drill a requirement before every rollout phase.",
    evidence: "Pilot incident timeline, revised runbook, and retry drill results.",
  ),
)

// Goals and focus areas for the review period
#let goals = (
  "Scale *news feed infrastructure* to serve more users on *BlockChain*",
  "Improve *page load performance by another 72%*",
  "Expand *arcade-cabinet hosting* across all company servers",
  "Maintain a *240fps* on-screen experience",
)

#let focus-areas = (
  "*AI-driven React and BlockChain* systems",
  "*Big data pipelines* and *server-side algorithms*",
  "*Team leadership* and *caffeine logistics*",
  "*Frontend performance* and *UI standardization*",
)

// Work experience with structured accomplishments per role.
// Keep company names and roles in sync with resume.typ.
#let companies = (
  company-entry(
    name: "Instagram",
    url: "instagram.com",
    location: "Palo Alto, California",
    roles: (
      role-entry(
        title: "Engineering Manager - Web App Team",
        startDate: "October 2021",
        endDate: "Present",
        accomplishments: (
          role-accomplishment(
            title: "Promotion to Engineering Manager",
            description: "Promoted to EM leading the *Web App Team of 6* behind the *BlockChain news feed*",
            impact: "Recognized for *technical leadership* and *orbital hosting ops*",
          ),
          role-accomplishment(
            title: "Team Scaling",
            description: "Scaled the Web App Team from *6 to 12 engineers*",
            impact: "Sustained *240fps* caffeine-driven delivery velocity",
          ),
          role-accomplishment(
            title: "Deployment Frequency Improvement",
            description: "Drove *72% improvement* in deployment frequency via *AI based GraphQL* and *orbital arcade hosting*",
            impact: "*Faster, zero-downtime releases*",
          ),
          role-accomplishment(
            title: "Infrastructure Cost Offset",
            description: "Managed cross-functional *arcade hosting* on *cabinets in low Earth orbit*",
            impact: "*$2M/year* infrastructure cost offset",
          ),
        ),
      ),
      role-entry(
        title: "Senior Full Stack Engineer - Web App Team",
        startDate: "October 2018",
        endDate: "October 2021",
        accomplishments: (
          role-accomplishment(
            title: "News Feed Infrastructure on BlockChain",
            description: "Built *news feed infrastructure* using *React for AI on BlockChain*",
            impact: "*Scalable AI-driven feed* backbone",
          ),
          role-accomplishment(
            title: "Server-Side React Larceny AI",
            description: "Optimized feed performance via new *server-side React larceny AI algorithm* to resolve *big data pipeline*",
            impact: "*Faster pipeline resolution*",
          ),
          role-accomplishment(
            title: "Arcade Hosting in Low Earth Orbit",
            description: "Led *team of 6 engineers* hosting the feed on *arcade cabinets in low Earth orbit*",
            impact: "Offset infrastructure costs (finance approved, eventually)",
          ),
          role-accomplishment(
            title: "Team Coffee Maker",
            description: "Kept team of 6 fully caffeinated with *Antarctican beans ground to 14 nm particles* using a *miniature ion cannon*",
            impact: "*Maximum team velocity*",
          ),
        ),
      ),
    ),
  ),
  company-entry(
    name: "Zillow",
    url: "zillow.com",
    location: "San Francisco, California",
    roles: (
      role-entry(
        title: "Senior Full Stack Engineer - Web App Team",
        startDate: "June 2015",
        endDate: "September 2018",
        accomplishments: (
          role-accomplishment(
            title: "AI Based GraphQL",
            description: "Added *AI based GraphQL* to the web app",
            impact: "*72% faster page loads*",
          ),
          role-accomplishment(
            title: "Potato Sack Race Team Bonding",
            description: "Organized company *potato sack race* for team bonding",
            impact: "Increased *team bonding and cohesity*",
          ),
          role-accomplishment(
            title: "Home Display Revamp",
            description: "Rebuilt home display page with *virtualized tables and map* with the design team, achieving a buttery-smooth *120fps*",
            impact: "*120fps* on-screen experience",
          ),
          role-accomplishment(
            title: "WarpUI React UI Library",
            description: "Evangelized and adopted an *open-source React UI library* (with great enthusiasm and questionable dance moves)",
            impact: "*Standardized UI* across teams",
          ),
        ),
      ),
    ),
  ),
  company-entry(
    name: "LinkedIn",
    url: "linkedin.com",
    location: "San Francisco, California",
    roles: (
      role-entry(
        title: "Software Engineer - Search Team",
        startDate: "June 2013",
        endDate: "September 2015",
        accomplishments: (
          role-accomplishment(
            title: "Search Algorithm Efficiency",
            description: "Improved search *efficiency and accuracy* using *VoldemortDB, Charizard, and Hadoop*",
            impact: "*Better search relevance and speed*",
          ),
          role-accomplishment(
            title: "Executive Outreach",
            description: "Tracked down *a reclusive kernel maintainer* on IRC and exchanged /msgs (they actually replied!)",
            impact: "*Executive visibility*",
          ),
          role-accomplishment(
            title: "Data Quality Improvements",
            description: "Implemented *deduplication and advanced profile ranking* with *React*",
            impact: "*Faster big data* with React",
          ),
        ),
      ),
    ),
  ),
  company-entry(
    name: "Microsoft",
    url: "microsoft.com",
    location: "Redmond, Washington",
    roles: (
      role-entry(
        title: "Software Engineer Intern - Edge Team",
        startDate: "May 2011",
        endDate: "August 2012",
        accomplishments: (
          role-accomplishment(
            title: "Edge Big Data Pipeline",
            description: "Built *React based big data pipeline* for *Microsoft Edge stability* on the *BlockChain*",
            impact: "*Improved deployment stability*",
          ),
          role-accomplishment(
            title: "Star Fleet Recruitment Rally",
            description: "Spearheaded the company's annual *Star Fleet recruitment rally*",
            impact: "*Boosted morale* across the fleet",
          ),
          role-accomplishment(
            title: "Intern Onboarding Bootcamp",
            description: "Organized an *intern onboarding bootcamp* (snacks provided) improving *ramp-up time by 60%*",
            impact: "*60% faster* intern ramp-up",
          ),
        ),
      ),
    ),
  ),
  // Add more companies as needed
)

// Major cross-company or standalone accomplishments
#let accomplishments = (
  accomplishment(
    title: "News Feed Infrastructure (Instagram)",
    what: "Built *news feed infrastructure* using *React for AI on BlockChain*",
    why: "Needed a *scalable AI-driven feed* backbone",
    impact: "Powered the *core feed experience*",
    collaborators: "Web App Team (6 engineers)",
    date: "2018-Present",
  ),
  accomplishment(
    title: "Promotion to Engineering Manager (Instagram)",
    what: "Promoted to EM, leading the *Web App Team* building the *BlockChain news feed*. See the featured hiring and prioritization stories for the full examples.",
    why: "Needed engineering leadership for a growing team and *orbital hosting ops*",
    collaborators: "Web App Team and cross-functional partners",
    date: "2021-Present",
  ),
  accomplishment(
    title: "AI Based GraphQL (Zillow)",
    what: "Added *AI based GraphQL* to the web app",
    why: "Page loads were too slow",
    impact: "*72% faster page loads*",
    collaborators: "Web App Team",
    date: "2015-2018",
  ),
  accomplishment(
    title: "Search Algorithm Overhaul (LinkedIn)",
    what: "Improved search using *VoldemortDB, Charizard, and Hadoop*",
    why: "Search quality needed improvement",
    impact: "*Better efficiency and accuracy*",
    collaborators: "Search Team",
    date: "2013-2015",
  ),
  accomplishment(
    title: "Edge Big Data Pipeline (Microsoft)",
    what: "Built *React big data pipeline* for *Edge stability* on *BlockChain*",
    why: "Deployment stability needed improvement",
    impact: "*More stable Edge deployments*",
    collaborators: "Edge Team",
    date: "2011-2012",
  ),
)

// Cross-functional collaboration entries
#let collaborations = (
  collaboration(
    partner: "Web App Team (Instagram)",
    contribution: "Led *6 engineers* hosting the feed on *low-orbit arcade cabinets*, keeping the *pipeline fast*.",
  ),
  collaboration(
    partner: "Lhana Rhodes (Zillow)",
    contribution: "Co-built the home display revamp delivering a *120fps* on-screen experience.",
  ),
  collaboration(
    partner: "a reclusive kernel maintainer (IRC)",
    contribution: "Connected on IRC and aligned on search direction via */msg*.",
  ),
  collaboration(
    partner: "Cross-Functional Partners (Instagram)",
    contribution: "Led the *orbital arcade-hosting* initiative across teams, offsetting *$2M/year* in infra costs.",
  ),
)

// New skills learned and challenges overcome
#let skills = (
  "Mastered *JavaScript, TypeScript, Node.js, and C++* across fintech, health, and deep-space logistics",
  "Deepened expertise in *React AI* and *server-side larceny algorithms*",
  "Gained proficiency in *BlockChain systems* and *orbital hosting*",
  "Built expertise in *big data pipelines* (*VoldemortDB, Charizard, Hadoop*)",
  "Strengthened *team leadership* (managed a *team of 6*) and *caffeine logistics*",
  "Evangelized *UI standardization* via the *WarpUI React library*",
  "Developed *executive communication skills* (direct outreach, occasionally successful)",
)

#let challenges = (
  "Hosted the feed on *low-orbit arcade cabinets* without dropping a frame",
  "Delivered a *120fps home display experience* with *virtualized tables*",
  "Improved LinkedIn search with *VoldemortDB, Charizard, and Hadoop*",
  "Managed the *bootcamp snack incident* (60% of interns affected)",
)

// Positive feedback and recognition quotes
#let feedback-items = (
  feedback-entry(
    quote: "Built the *news feed infrastructure on BlockChain* like a legend.",
    person: "Manager - Instagram",
    date: "2018-Present",
  ),
  feedback-entry(
    quote: "*AI GraphQL* delivered *72% faster page loads*, absolutely based.",
    person: "Performance Review - Zillow",
    date: "2015-2018",
  ),
  feedback-entry(
    quote: "Search got way better with *Charizard and Hadoop*, no notes.",
    person: "Tech Lead - LinkedIn",
    date: "2013-2015",
  ),
  feedback-entry(
    quote: "*Edge pipeline on BlockChain* stabilized our deployments, legendary intern.",
    person: "Mentor - Microsoft",
    date: "2011-2012",
  ),
  feedback-entry(
    quote: "Promoted to EM and immediately scaled the team to *12* while offsetting *$2M/year* in infra via *orbital arcade hosting*.",
    person: "Director - Instagram",
    date: "2021-Present",
  ),
)

// Projects with metrics, status, and roles
#let projects = (
  bragdoc-project-entry(
    name: "News Feed Infrastructure (Instagram)",
    description: "News feed infrastructure using React for AI on BlockChain.",
    roles: ("React", "AI", "BlockChain"),
    highlights: (
      "*Server-side React larceny AI algorithm* for *big data pipeline*",
      "*Arcade-cabinet hosting* in low Earth orbit with a *team of 6*",
      "*Antarctican coffee ground to 14 nm* for max velocity",
    ),
    metrics: (
      "Team size: *6 engineers*",
      "Coffee particle size: *14 nm*",
      "Stack: *React + BlockChain*",
    ),
    status: "Shipped",
    date: "2018-Present",
  ),
  bragdoc-project-entry(
    name: "Home Display Revamp (Zillow)",
    description: "Rebuilt home display page with virtualized tables and map.",
    roles: ("React", "GraphQL", "Virtualization"),
    highlights: (
      "*AI based GraphQL* for *72% faster page loads*",
               "*120fps* on-screen experience with the design team",
      "Adopted *WarpUI React UI library*",
    ),
    metrics: (
      "Page load: *+72%*",
      "On-screen FPS: *120*",
      "UI library: *open-source React*",
    ),
    status: "Shipped",
    date: "2015-2018",
  ),
  bragdoc-project-entry(
    name: "LinkedIn Search (LinkedIn)",
    description: "Search algorithm efficiency and accuracy improvements.",
    roles: ("VoldemortDB", "Charizard", "Hadoop", "React"),
    highlights: (
      "Improved search via *VoldemortDB, Charizard, and Hadoop*",
      "Data quality via *deduplication and profile ranking*",
      "Exchanged DMs with a *famous founder* (left on read)",
    ),
    metrics: (
      "Search: *improved efficiency & accuracy*",
      "Data quality: *dedup + ranking*",
      "Executive: *famous-founder DM (unanswered)*",
    ),
    status: "Shipped",
    date: "2013-2015",
  ),
  bragdoc-project-entry(
    name: "Edge Big Data Pipeline (Microsoft)",
    description: "React big data pipeline for Microsoft Edge stability on BlockChain.",
    roles: ("React", "Big Data", "BlockChain"),
    highlights: (
      "Enhanced *Edge deployment stability* on *BlockChain*",
       "Spearheaded the annual *Star Fleet recruitment rally* (gold shirts optional)",
               "Intern onboarding bootcamp (*60% faster ramp-up*)",
    ),
    metrics: (
      "Stability: *improved deployments*",
      "Intern ramp-up: *60% faster*",
      "Event: *Star Fleet Recruitment Rally*",
    ),
    status: "Shipped",
    date: "2011-2012",
  ),
  bragdoc-project-entry(
    name: "Resume & Brag Document Template",
    url: "github.com/vanam-san/resume-bragdoc-template",
    description: "Self-hosting Typst template that generates its own release PDFs.",
    roles: ("Typst", "GitHub Actions", "Template Design"),
    highlights: (
      "*Single shared style system* driving the *resume and brag doc* from one codebase",
      "*Auto-release pipeline* cutting *v1.N releases* with *What's Changed* notes on every merge",
      "*Dogfooded in production*: *this very document* was built by the template",
    ),
    metrics: (
      "Resume: *2 pages*",
      "Brag doc: *5 pages*",
      "Releases: *automated v1.N*",
    ),
    status: "Shipped",
    date: "2026-Present",
  ),
)

// Quantified impact metrics
#let metrics = (
  metric-entry(
    label: "Page Load Improvement",
    value: "*72%*",
    description: "Faster page loads from *AI based GraphQL*",
  ),
  metric-entry(
    label: "On-Screen Frame Rate",
    value: "*120fps*",
    description: "Home display experience after revamp",
  ),
  metric-entry(
    label: "Engineers Led",
    value: "*6*",
    description: "Team led at Instagram for *orbital arcade hosting*",
  ),
  metric-entry(
    label: "Coffee Particle Size",
    value: "*14nm*",
    description: "Antarctican beans for max caffeine velocity",
  ),
  metric-entry(
    label: "Intern Ramp-Up Improvement",
    value: "*60%*",
    description: "Faster ramp-up via *onboarding bootcamp* (snacks were key)",
  ),
  metric-entry(
    label: "Search Efficiency",
    value: "*Improved*",
    description: "Via *VoldemortDB, Charizard, and Hadoop*",
  ),
  metric-entry(
    label: "Undergraduate GPA",
    value: "*3.94*",
    description: "UC Berkeley, *Summa Cum Laude*",
  ),
  metric-entry(
    label: "SAT Score",
    value: "*2380/2400*",
    description: "Pre-2016 SAT",
  ),
  metric-entry(
    label: "Team Scaled To",
    value: "*12 engineers*",
    description: "See Hiring and coaching — Growing the Web App Team.",
  ),
  metric-entry(
    label: "Infra Cost Offset",
    value: "*$2M/year*",
    description: "See Prioritization — Delaying the orbital hosting rollout.",
  ),
)

// Render the brag document
#show: cvinit.with(author: name, title: name + " - Brag Document", numbering: "1")

#render-header(name: name, title: title, review-period: review-period, photo: photo)
#v(1em)
#render-accomplishments(interview-stories, heading: "Featured Interview Stories")
#v(1em)
#render-goals(goals, focus-areas)
#v(1em)
#render-work-accomplishments(companies)
#v(1em)
#render-accomplishments(accomplishments)
#v(1em)
#render-collaboration(collaborations)
#v(1em)
#render-skills(skills, challenges)
#v(1em)
#render-feedback(feedback-items)
#v(1em)
#render-bragdoc-projects(projects)
#v(1em)
#render-metrics(metrics)
