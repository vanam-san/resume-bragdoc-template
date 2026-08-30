# Resume & Brag Document Template

A professional resume and brag document template built with [Typst](https://typst.app).

## Features

- **Resume** (`src/resume.typ`) - Clean, professional resume with sections for experience, education, skills, and projects
- **Brag Document** (`src/bragdoc.typ`) - Comprehensive brag document for performance reviews, promotions, and career tracking
- **Shared Functions** (`src/functions.typ`) - Reusable formatting and layout functions
- **Automated Releases** - GitHub Actions workflow compiles PDFs on tag pushes (v1.*) and monthly schedule

## Quick Start

### Prerequisites

- [Typst](https://typst.app/docs/install/) installed locally, or use the GitHub Actions workflow

### Local Development

```bash
# Install Task (optional, for convenience)
# https://taskfile.dev/installation/

# Compile both documents
task compile

# Watch for changes (live preview)
task dev
```

Or compile manually:

```bash
typst compile src/resume.typ src/resume.pdf
typst compile src/bragdoc.typ src/bragdoc.pdf
```

### Step-by-Step: Make It Yours

1. **Install Typst** (or just rely on the GitHub Actions workflow to build PDFs for you).
2. **Open `src/resume.typ`** and replace the placeholder values at the top:
   - `name`, `title`, `location`, `email`, `phone`, `url`
   - `profiles` (LinkedIn, GitHub, etc.)
   - `summary`, `educations`, `works`, `skills_section`, `projects`
3. **Open `src/bragdoc.typ`** and update the matching data:
   - `goals`, `focus-areas`
   - `companies` (must mirror the same roles/companies as your resume)
   - `accomplishments`, `collaborations`, `skills`, `challenges`
   - `feedback-items`, `projects`, `metrics`
4. **Keep the two documents consistent.** Both files describe the *same person*, so company names, roles, dates, and impact numbers should match. Company placeholders are `Company Name 1/2/3` — rename them to real names in both files together.
5. **Preview locally** with `task dev` (or `typst watch`) and confirm the PDFs look right.
6. **Commit your changes.** No code changes are required — all content is plain Typst variables.

### Releases

The workflow automatically creates releases with compiled PDFs when you push tags matching `v1.*`:

```bash
git tag v1.0.0
git push origin v1.0.0
```

Releases also run monthly on the 1st at midnight UTC and can be triggered manually from the Actions tab.

**Versioning** — release tags follow `vMAJOR.MINOR.PATCH`:

- `MAJOR` (the leading digit, e.g. the `1` in `v1.0.0`) — bump for a complete refactor
- `MINOR` (the middle digit, e.g. the `.0.` in `v1.0.0`) — bump for feature changes
- `PATCH` (the trailing digit, e.g. the `.0` at the end of `v1.0.0`) — bump for incremental and minor changes

Examples: `v1.0.0` → `v2.0.0` (complete refactor), `v1.1.0` (new feature), `v1.0.1` (incremental/minor fix).

## Project Structure

```
├── .github/
│   ├── workflows/
│   │   └── release.yml      # Release automation
│   ├── CONTRIBUTING.md       # Contribution guidelines
│   └── CODE_OF_CONDUCT.md    # Code of conduct
├── src/
│   ├── functions.typ        # Shared layout/formatting functions
│   ├── resume.typ           # Resume data & entry point
│   └── bragdoc.typ          # Brag document data & entry point
├── TASKFILE.yml             # Task automation (optional)
└── README.md
```

## Template Notes

- Replace all placeholder values (`YOUR NAME`, `CITY, COUNTRY`, `company.com`, etc.) with your actual information
- The brag document uses builder helper functions (`company-entry`, `role-entry`, `role-accomplishment`, etc.) for structured data entry
- Metrics should be specific and measurable - quantify your impact wherever possible
- Keep summaries concise (2-3 sentences for resume, bullet points for brag doc)

## Code Review

### Observations

- **Consistent data model**: Both `resume.typ` and `bragdoc.typ` use the same company names, roles, and dates. This is critical — keep them in sync when editing.
- **No hardcoded styles in data files**: All formatting lives in `functions.typ`. Data files only define content, which is good separation of concerns.
- **Builder pattern for brag doc**: The brag document uses builder helper functions (`company-entry`, `role-entry`, etc.) instead of raw dictionaries. This makes data entry cleaner and more readable.
- **Empty array guards**: Most render functions check `if len == 0 { return }` before rendering sections, preventing empty headings in the output.
- **Unused fields in resume data**: The `score` and `courses` fields in `educations` are defined but not rendered by `render-education`. Consider removing them or adding rendering support.
- **Inconsistent indentation in bragdoc.typ**: Lines 341 and 376 use different indentation from surrounding code (extra leading spaces).
- **Hardcoded font**: The font `Libertinus Serif` is hardcoded in `setrules`. If you want to customize the font, edit `src/functions.typ:32`.

## Function Reference

All shared functions are in `src/functions.typ`.

### Utility

| Function | Description |
|----------|-------------|
| `daterange_short(start, end)` | Formats a date range with an en dash (e.g., "Mar 2025 – Mar 2026"). Handles empty start/end gracefully. |

### Document Setup

| Function | Description |
|----------|-------------|
| `cvinit(author, title, numbering)` | Initializes the document: sets page size (US Letter), margins, footer with author/title/page number, and applies text/list/heading styles. Use as `#show: cvinit.with(...)`. |
| `setrules(doc)` | Sets global text font (Libertinus Serif, 11pt), list spacing, and paragraph leading. Called internally by `cvinit`. |
| `showrules(doc)` | Defines heading display rules: level 1 headings are large uppercase, level 2 headings have a horizontal rule below. Called internally by `cvinit`. |

### Resume Renderers

| Function | Description |
|----------|-------------|
| `render-basic-info(name, title, location, phone, email, url, profiles)` | Renders centered header with name, title, and contact info separated by diamond symbols. |
| `render-summary(summary)` | Renders the "Summary" section with a 2-3 sentence professional overview. |
| `render-education(educations)` | Renders the "Education" section. Each entry shows institution, degree, date range, and optional courses. |
| `render-work(works)` | Renders the "Experience" section. Each company shows linked name, location, positions with date ranges, and bullet-point highlights. |
| `render-project(projects)` | Renders the "Projects" section. Each project shows linked name, roles, date range, and highlights. |
| `render-custom(custom_section)` | Renders a custom titled section with bold summary + description pairs. Used for skills/competencies. |

### Brag Document Renderers

| Function | Description |
|----------|-------------|
| `render-header(name, title, review-period)` | Renders the brag doc header with name, title, and review period. |
| `render-goals(goals, focus-areas)` | Renders "Goals & Focus Areas" with two bulleted lists. |
| `render-work-accomplishments(companies)` | Renders "Work Experience & Accomplishments" using `company-entry` data. Each role shows title, date range, and accomplishments with impact. |
| `render-accomplishments(accomplishments)` | Renders "Major Accomplishments" with structured what/why/impact/collaborators/date fields. |
| `render-collaboration(collaborations)` | Renders "Collaboration & Cross-Functional Work" with partner and contribution. |
| `render-skills(skills, challenges)` | Renders "Skills Developed & Growth" with two bulleted lists. |
| `render-feedback(feedback-items)` | Renders "Positive Feedback & Recognition" with quoted feedback, person, and date. |
| `render-bragdoc-projects(projects)` | Renders "Projects & Initiatives" with status, date, roles, highlights, and key metrics. |
| `render-metrics(metrics)` | Renders "Metrics & Impact" with label, value, and description. |

### Builder Helpers (Brag Document)

Use these to construct data entries for the brag document:

| Function | Fields | Description |
|----------|--------|-------------|
| `company-entry(name, url, location, roles)` | Company info + array of roles | Creates a company with nested roles. |
| `role-entry(title, startDate, endDate, accomplishments)` | Role info + array of accomplishments | Creates a role within a company. |
| `role-accomplishment(title, description, impact)` | Title, what you did, impact | Single accomplishment within a role. |
| `accomplishment(title, what, why, impact, collaborators, date)` | Full accomplishment details | Cross-company or standalone accomplishment. |
| `collaboration(partner, contribution)` | Partner name, what you contributed | Cross-functional collaboration entry. |
| `feedback-entry(quote, person, date)` | Quote, who said it, when | Positive feedback or recognition. |
| `bragdoc-project-entry(name, url, description, roles, highlights, metrics, status, date)` | Full project details | Project with metrics and status. |
| `metric-entry(label, value, description)` | Metric name, value, description | Quantified impact metric. |

## Community

- [Contributing Guidelines](.github/CONTRIBUTING.md)
- [Code of Conduct](.github/CODE_OF_CONDUCT.md)

## Acknowledgments

- [Jake's Resume](https://github.com/jakegut/resume) - Inspiration for the resume structure and Typst implementation
- [Typst](https://typst.app) - Modern typesetting system

## License

MIT License - feel free to use and modify for your own career documents.
