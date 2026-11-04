# Personal skills

My agent skills. Third-party skills go in the `Skillfile`
(fetched from GitHub); these live here in the repo and are the source of truth.

## Layout

One directory per skill, each with a `SKILL.md`:

```
skills/
  my-skill/
    SKILL.md        # required: frontmatter (name, description) + instructions
    <extra files>   # optional: scripts, references, templates
```

## Authoring

`cd agents/skills && npx skills init my-skill` scaffolds `my-skill/SKILL.md`,
or just create the file by hand:

```markdown
---
name: my-skill
description: One line the agent uses to decide when to load this skill.
---

Instructions for the skill go here.
```

## Installing

`bash agents/install.sh` installs these globally for Claude Code and Codex
(`--agent claude-code codex`) via `npx skills add`. That copies each skill
into `~/.agents/skills`, so edits here take effect only after you run
`install.sh` again.
