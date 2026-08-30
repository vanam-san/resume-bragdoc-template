# Contributing

Thanks for your interest in contributing to this template! Here are some guidelines to help you get started.

## How to Contribute

1. **Fork the repository**
2. **Create a branch** for your feature or fix
3. **Make your changes**
4. **Test locally** with `task compile` or `task dev`
5. **Submit a pull request**

## Getting Started

### Prerequisites

- [Typst](https://typst.app/docs/install/) installed locally
- [Task](https://taskfile.dev/installation/) (optional, for convenience)

### Local Development

```bash
# Clone your fork
git clone https://github.com/<your-username>/Resume-Bragdoc-Template.git
cd Resume-Bragdoc-Template

# Watch for changes (live preview)
task dev

# Or compile manually
typst compile src/resume.typ src/resume.pdf
typst compile src/bragdoc.typ src/bragdoc.pdf
```

## Guidelines

### Code Style

- Keep formatting functions in `src/functions.typ`
- Data files (`resume.typ`, `bragdoc.typ`) should only contain content, not styling
- Follow existing patterns for new functions
- Use builder helpers (`company-entry`, `role-entry`, etc.) for brag doc data

### Commit Messages

- Use clear, descriptive commit messages
- Start with a verb in imperative mood (e.g., "Add", "Fix", "Update")
- Keep the subject line under 72 characters

Examples:
- `Add render-metrics function for bragdoc`
- `Fix date range formatting for empty end dates`
- `Update README with function reference`

### Pull Requests

- Keep PRs focused on a single change
- Describe what you changed and why
- Test your changes locally before submitting
- Update documentation if adding new features

### Issues

- Use issues to report bugs or suggest features
- Include steps to reproduce for bug reports
- Check existing issues before creating a new one

## What Can I Contribute?

- **Bug fixes** - Fix rendering issues or broken layouts
- **New features** - Add new section types or formatting options
- **Documentation** - Improve README or add examples
- **Templates** - Create variants for different industries or roles
- **Accessibility** - Improve PDF accessibility or screen reader support

## Style Guide for New Sections

If adding a new section to the resume or brag document:

1. Create a `render-{section-name}` function in `functions.typ`
2. Add an empty array guard: `if items.len() == 0 { return }`
3. Follow the existing heading style (level 2 with horizontal rule)
4. Document the function in this file or the README

## Questions?

If you have questions about contributing, feel free to open an issue asking for clarification.
