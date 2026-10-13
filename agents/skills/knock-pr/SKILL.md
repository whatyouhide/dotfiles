---
name: knock-pr
description: "Commit, push, and open a draft PR with Knock conventions."
# Claude:
disable-model-invocation: true
# Codex:
policy:
  allow_implicit_invocation: false
---

You're usually not supposed to commit or interface with GitHub without my consent, but this is the exception, as I've explicitly invoked this skill.

Before starting, check if there's a Linear ticket in context: mentioned in the conversation or part of the branch name.

1. If on `main`, stop and ask the user what to do. Otherwise, ensure the current branch is named one of the following, renaming it if necessary (only if it has no upstream):
   * `andrea-<short-title>` if you have no Linear ticket.
   * `andrea-pla-<ticket>-<short-title>` if there is a Linear ticket.
2. We use conventional commits. Prefix with `fix`, `feat`, `chore`, `tests`, `deps`, `ci` (nothing else). If there's a Linear ticket, we put that in parens, like `feat(PLA-XXX): <title>`. Without a Linear ticket, it's `feat: <title>`.
3. Commit code in one commit. Leave the commit body empty. Commit all the changes relevant to the task at hand (most often, that means all unstaged changes and untracked files); if there are no changes, skip to the next step. **Do not** add attribution lines to the commit body or title.
4. Push to a corresponding upstream branch in GitHub.
5. Create a **draft** PR in GitHub. If the branch already has a PR, do not create a second one. Go to step 6.
   * *Always* use the PR template in the current repository as the PR body (essentially, mimicking what would happen if I were to open a PR manually on the web). Use the template file as the body, with one change: check every checkbox (replace each `[ ]` with `[x]`). I uncheck the ones I have not done. Other than that, do not fill the template in, and do not add text to it.
   * Use the commit title as the PR title.
   * No attribution lines in the PR, anywhere.
6. Print the PR URL.
