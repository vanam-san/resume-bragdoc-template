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
│   └── workflows/
│       └── release.yml      # Release automation
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

## License

MIT License - feel free to use and modify for your own career documents.