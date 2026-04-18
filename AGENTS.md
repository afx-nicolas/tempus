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
- After spec completion, it should be created a Pull Request on GitHub (Use GitHub CLI, references on `gh-cli` skill).
- Specs branches should start from `main` branch, always pull before create a new branch
- Specs branches should only start from another branch if it's related to another spec that has a open pull request.
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
