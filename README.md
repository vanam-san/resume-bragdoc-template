# Resume & Brag Document Template

A professional resume and brag document template built with [Typst](https://typst.app). Generate clean PDFs for your resume and career brag document from a single shared template system.

## What's Included

- **Resume** (`src/resume.typ`) - Traditional resume with sections for experience, education, skills, and projects
- **Brag Document** (`src/bragdoc.typ`) - Career tracking document for performance reviews and promotions with accomplishments, metrics, and feedback
- **Shared Functions** (`src/functions.typ`) - Reusable formatting and layout functions for both documents

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

### Make It Yours

1. Open `src/resume.typ` and replace the placeholder values (name, title, contact info, experience, education, skills, projects)
2. Open `src/bragdoc.typ` and update the matching data (goals, work accomplishments, collaborations, skills, feedback, metrics)
3. Keep company names, roles, and dates consistent between both files
4. Preview with `task dev` and commit when ready

## Project Structure

```
├── src/
│   ├── functions.typ        # Shared layout and formatting functions
│   ├── resume.typ           # Resume data and entry point
│   └── bragdoc.typ          # Brag document data and entry point
├── .github/
│   └── workflows/
│       └── release.yml      # Automated PDF release on tag push
├── TASKFILE.yml             # Task automation (optional)
└── README.md
```

## Releases

Push tags matching `v1.*` to trigger automated PDF compilation and release:

```bash
git tag v1.0.0
git push origin v1.0.0
```

## License

MIT License - feel free to use and modify for your own career documents.
