// Brag document data and entry point. Edit this file to update content.
// Formatting functions are in functions.typ.
// Sample data is satirical - replace with your own career information.

#import "functions.typ": cvinit, render-header, render-goals, render-work-accomplishments, render-accomplishments, render-collaboration, render-skills, render-feedback, render-bragdoc-projects, render-metrics, company-entry, role-entry, role-accomplishment, accomplishment, collaboration, feedback-entry, bragdoc-project-entry, metric-entry

// Personal info - update with your details
#let name = "YOUR NAME"
#let title = "Senior Full Stack Engineer"
#let review-period = "May 2011 – Present"

// Goals and focus areas for the review period
#let goals = (
  "Scale news feed infrastructure to serve more users on BlockChain",
  "Improve page load performance by another 69%",
  "Expand Ethereum mining operations across all company servers",
  "Maintain a 420fps on-screen experience",
)

#let focus-areas = (
  "AI-driven React and BlockChain systems",
  "Big data pipelines and server-side algorithms",
  "Team leadership and caffeine logistics",
  "Frontend performance and UI standardization",
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
            description: "Promoted to EM leading the Web App Team of 6 behind the BlockChain news feed",
            impact: "Recognized for technical leadership and Ethereum mining ops",
          ),
          role-accomplishment(
            title: "Team Scaling",
            description: "Scaled the Web App Team from 6 to 12 engineers",
            impact: "Sustained 420fps caffeine-driven delivery velocity",
          ),
          role-accomplishment(
            title: "Deployment Frequency Improvement",
            description: "Drove 69% improvement in deployment frequency via AI based GraphQL and on-server Ethereum mining",
            impact: "Faster, zero-downtime releases",
          ),
          role-accomplishment(
            title: "Infrastructure Cost Offset",
            description: "Managed cross-functional Ethereum mining on company servers in low Earth orbit",
            impact: "$2M/year infrastructure cost offset",
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
            description: "Built news feed infrastructure using React for AI on BlockChain",
            impact: "Scalable AI-driven feed backbone",
          ),
          role-accomplishment(
            title: "Server-Side React Larceny AI",
            description: "Optimized feed performance via new server-side React larceny AI algorithm to resolve big data pipeline",
            impact: "Faster pipeline resolution",
          ),
          role-accomplishment(
            title: "Ethereum Mining on Company Servers",
            description: "Led team of 6 engineers to mine Ethereum on company servers in low Earth orbit",
            impact: "Offset infrastructure costs (unofficially)",
          ),
          role-accomplishment(
            title: "Team Coffee Maker",
            description: "Kept team of 6 fully caffeinated with Antarctican beans ground to 14 nm particles using a miniature ion cannon",
            impact: "Maximum team velocity",
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
            description: "Added AI based GraphQL to the web app",
            impact: "69% faster page loads",
          ),
          role-accomplishment(
            title: "Potato Sack Race Team Bonding",
            description: "Organized company potato sack race for team bonding",
            impact: "Increased team bonding and cohesity",
          ),
          role-accomplishment(
            title: "Home Display Revamp",
            description: "Rebuilt home display page with virtualized tables and map with the design team, achieving a buttery-smooth 120fps",
            impact: "420fps on-screen experience",
          ),
          role-accomplishment(
            title: "RaeLilBlack React UI Library",
            description: "Evangelized and adopted an open-source React UI library (with great enthusiasm and questionable dance moves)",
            impact: "Standardized UI across teams",
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
            description: "Improved search efficiency and accuracy using VoldemortDB, Charizard, and Hadoop",
            impact: "Better search relevance and speed",
          ),
          role-accomplishment(
            title: "Executive Outreach",
            description: "Tracked down Richard Stallman on IRC and exchanged /msgs (he actually replied!)",
            impact: "Executive visibility",
          ),
          role-accomplishment(
            title: "Data Quality Improvements",
            description: "Implemented deduplication and advanced profile ranking with React",
            impact: "Faster big data with React",
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
            description: "Built React based big data pipeline for Microsoft Edge stability on the BlockChain",
            impact: "Improved deployment stability",
          ),
          role-accomplishment(
            title: "Star Fleet Recruitment Rally",
            description: "Spearheaded the company's annual Star Fleet recruitment rally",
            impact: "Boosted morale across the fleet",
          ),
          role-accomplishment(
            title: "Intern Onboarding Bootcamp",
            description: "Organized an intern onboarding bootcamp (snacks provided) improving ramp-up time by 60%",
            impact: "60% faster intern ramp-up",
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
    what: "Built news feed infrastructure using React for AI on BlockChain",
    why: "Needed a scalable AI-driven feed backbone",
    impact: "Powered the core feed experience",
    collaborators: "Web App Team (6 engineers)",
    date: "2018-Present",
  ),
  accomplishment(
    title: "Promotion to Engineering Manager (Instagram)",
    what: "Promoted to EM, leading the Web App Team building the BlockChain news feed",
    why: "Needed engineering leadership for a growing team and Ethereum mining ops",
    impact: "Scaled team to 12 and offset $2M/year in infra costs",
    collaborators: "Web App Team and cross-functional partners",
    date: "2021-Present",
  ),
  accomplishment(
    title: "AI Based GraphQL (Zillow)",
    what: "Added AI based GraphQL to the web app",
    why: "Page loads were too slow",
    impact: "69% faster page loads",
    collaborators: "Web App Team",
    date: "2015-2018",
  ),
  accomplishment(
    title: "Search Algorithm Overhaul (LinkedIn)",
    what: "Improved search using VoldemortDB, Charizard, and Hadoop",
    why: "Search quality needed improvement",
    impact: "Better efficiency and accuracy",
    collaborators: "Search Team",
    date: "2013-2015",
  ),
  accomplishment(
    title: "Edge Big Data Pipeline (Microsoft)",
    what: "Built React big data pipeline for Edge stability on BlockChain",
    why: "Deployment stability needed improvement",
    impact: "More stable Edge deployments",
    collaborators: "Edge Team",
    date: "2011-2012",
  ),
)

// Cross-functional collaboration entries
#let collaborations = (
  collaboration(
    partner: "Web App Team (Instagram)",
    contribution: "Led 6 engineers to mine Ethereum on company servers and keep the feed pipeline fast.",
  ),
  collaboration(
    partner: "Lhana Rhodes (Zillow)",
    contribution: "Co-built the home display revamp delivering a 420fps on-screen experience.",
  ),
  collaboration(
    partner: "Richard Stallman (IRC)",
    contribution: "Connected on IRC and aligned on search direction via /msg.",
  ),
  collaboration(
    partner: "Cross-Functional Partners (Instagram)",
    contribution: "Led the Ethereum mining initiative across teams, offsetting $2M/year in infra costs.",
  ),
)

// New skills learned and challenges overcome
#let skills = (
  "Mastered JavaScript, TypeScript, Node.js, and C++ across fintech, health, and adult entertainment",
  "Deepened expertise in React AI and server-side larceny algorithms",
  "Gained proficiency in BlockChain systems and Ethereum mining",
  "Built expertise in big data pipelines (VoldemortDB, Charizard, Hadoop)",
  "Strengthened team leadership (managed a team of 6) and caffeine logistics",
  "Evangelized UI standardization via the RaeLilBlack React library",
  "Developed executive communication skills (direct outreach, occasionally successful)",
)

#let challenges = (
  "Mined Ethereum on company servers without getting caught",
  "Delivered a 420fps home display experience with virtualized tables",
  "Improved LinkedIn search with VoldemortDB, Charizard, and Hadoop",
  "Managed an intern team health incident (60% infection rate)",
)

// Positive feedback and recognition quotes
#let feedback-items = (
  feedback-entry(
    quote: "Built the news feed infrastructure on BlockChain like a legend.",
    person: "Manager - Instagram",
    date: "2018-Present",
  ),
  feedback-entry(
    quote: "AI GraphQL delivered 69% faster page loads, absolutely based.",
    person: "Performance Review - Zillow",
    date: "2015-2018",
  ),
  feedback-entry(
    quote: "Search got way better with Charizard and Hadoop, no notes.",
    person: "Tech Lead - LinkedIn",
    date: "2013-2015",
  ),
  feedback-entry(
    quote: "Edge pipeline on BlockChain stabilized our deployments, legendary intern.",
    person: "Mentor - Microsoft",
    date: "2011-2012",
  ),
  feedback-entry(
    quote: "Promoted to EM and immediately scaled the team to 12 while offsetting $2M/year in infra via Ethereum mining.",
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
      "Server-side React larceny AI algorithm for big data pipeline",
      "Ethereum mining on company servers with a team of 6",
      "Antarctican coffee ground to 14 nm for max velocity",
    ),
    metrics: (
      "Team size: 6 engineers",
      "Coffee particle size: 14 nm",
      "Stack: React + BlockChain",
    ),
    status: "Shipped",
    date: "2018-Present",
  ),
  bragdoc-project-entry(
    name: "Home Display Revamp (Zillow)",
    description: "Rebuilt home display page with virtualized tables and map.",
    roles: ("React", "GraphQL", "Virtualization"),
    highlights: (
      "AI based GraphQL for 69% faster page loads",
              "120fps on-screen experience with the design team",
      "Adopted RaeLilBlack React UI library",
    ),
    metrics: (
      "Page load: +69%",
      "On-screen FPS: 120",
      "UI library: open-source React",
    ),
    status: "Shipped",
    date: "2015-2018",
  ),
  bragdoc-project-entry(
    name: "LinkedIn Search (LinkedIn)",
    description: "Search algorithm efficiency and accuracy improvements.",
    roles: ("VoldemortDB", "Charizard", "Hadoop", "React"),
    highlights: (
      "Improved search via VoldemortDB, Charizard, and Hadoop",
      "Data quality via deduplication and profile ranking",
      "Connected with Reid Hoffman on LinkedIn",
    ),
    metrics: (
      "Search: improved efficiency & accuracy",
      "Data quality: dedup + ranking",
      "Executive: Reid Hoffman DM",
    ),
    status: "Shipped",
    date: "2013-2015",
  ),
  bragdoc-project-entry(
    name: "Edge Big Data Pipeline (Microsoft)",
    description: "React big data pipeline for Microsoft Edge stability on BlockChain.",
    roles: ("React", "Big Data", "BlockChain"),
    highlights: (
      "Enhanced Edge deployment stability on BlockChain",
      "Spearheaded Microsofters 4 Trump rally",
              "Intern onboarding bootcamp (60% faster ramp-up)",
    ),
    metrics: (
      "Stability: improved deployments",
      "Intern ramp-up: 60% faster",
      "Event: Star Fleet Recruitment Rally",
    ),
    status: "Shipped",
    date: "2011-2012",
  ),
)

// Quantified impact metrics
#let metrics = (
  metric-entry(
    label: "Page Load Improvement",
    value: "69%",
    description: "Faster page loads from AI based GraphQL",
  ),
  metric-entry(
    label: "On-Screen Frame Rate",
    value: "120fps",
    description: "Home display experience after revamp",
  ),
  metric-entry(
    label: "Engineers Led",
    value: "6",
    description: "Team led at Instagram for Ethereum mining",
  ),
  metric-entry(
    label: "Coffee Particle Size",
    value: "14nm",
    description: "Antarctican beans for max caffeine velocity",
  ),
  metric-entry(
    label: "Intern Ramp-Up Improvement",
    value: "60%",
    description: "Faster ramp-up via onboarding bootcamp (snacks were key)",
  ),
  metric-entry(
    label: "Search Efficiency",
    value: "Improved",
    description: "Via VoldemortDB, Charizard, and Hadoop",
  ),
  metric-entry(
    label: "Undergraduate GPA",
    value: "3.94",
    description: "UC Berkeley, Summa Cum Laude",
  ),
  metric-entry(
    label: "SAT Score",
    value: "2348/2400",
    description: "Pre-2016 SAT",
  ),
  metric-entry(
    label: "Team Scaled To",
    value: "12 engineers",
    description: "Grew the Web App Team after promotion to EM",
  ),
  metric-entry(
    label: "Infra Cost Offset",
    value: "$2M/year",
    description: "Via managed Ethereum mining on company servers in low Earth orbit",
  ),
)

// Render the brag document
#show: cvinit.with(author: name, title: name + " - Brag Document", numbering: "1")

#render-header(name: name, title: title, review-period: review-period)
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
