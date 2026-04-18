# tempus

## Skills

This project uses the Agent Skills framework for domain-specific guidance.

### leanspec-sdd - Spec-Driven Development

- **Location**: See your skills directory (installed via `lean-spec skill install`, e.g., `.github/skills/leanspec-sdd/SKILL.md`)
- **Use when**: Working with specs, planning features, multi-step changes
- **Key principle**: Run `board` or `search` before creating specs

Read the skill file for complete SDD workflow guidance.

## Project-Specific Rules

### Workflow

- Every spec should be developed on it's own branch, never commit on main.
- After spec completion, you should push the spec branch and create a Pull Request on GitHub (Use GitHub CLI, references on `gh-cli` skill),
  then as the user for review.
- Specs branches should start from `main` branch, always pull before create a new branch.
- Always check for pending review pull requests, before starting a new spec, if there's comments requesting changes, you should fix and ask for review again,
  then you continue on the spec development, if the spec you're starting, depends on a pending pull request spec, you **SHOULD NOT** start the spec, ask for the user review
  and wait the approval of the pull request.
- If a pull request still open, but it's approved, you're allowed to merge and continue the workflow.
- Pull requests should include relevant information about what was developed.

### Stack

- Material UI
- Riverpod with code generation
- Freezed
- Go Router

### Code Standards

DRY - Don't Repeat Yourself, functions and widgets should be extracted in reusable code whenever they're needed in multiple scenarios.
KISS - Always prefer simple solutions and existent libraries (when available) over implementations from scratch, all the new dependencies should be discussed before added also including alternatives.
Code Split - Files should never include more logic than needed, concepts should be extracted to prevent massive files.

### Folder Structure

```
lib/
 core/
   app.dart
   ...
 controllers/
 widgets/
 providers/
 helpers/
 pages/
 main.dart
...
```
