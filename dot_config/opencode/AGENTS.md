# Personal coding preferences

## Comments
- Do not add comments. Code should be self-documenting.
- Exception: comment when the solution is genuinely non-obvious, works around a bug, or violates a convention in a way a future reader would question. Explain *why*, never *what*.
- Never add "// added X" or "// TODO" style comments describing your own changes.

## Scope discipline
- Do only what was asked. Do not refactor adjacent code, reorganize imports, or "clean up" things I didn't mention.
- Do not create new files when editing an existing one would work. LLMs over-fragment; resist it.
- Never add README.md, docs, or example files unless I explicitly ask.

## Match the codebase
- Before writing new code, look at neighboring files to infer style, naming, and patterns. Match them even if you disagree.
- Do not introduce new dependencies without asking. Prefer stdlib / already-present libraries.
- Do not add abstractions (factories, managers, wrappers, interfaces) speculatively. Write the concrete thing; abstract only when a second caller exists.

## Error handling
- Only catch errors you can actually handle. Do not wrap everything in try/catch to "be safe" — let errors propagate.
- Do not swallow errors silently or log-and-continue. If it's truly recoverable, say so in the catch.
- No defensive `if (x)` guards against situations that can't happen given the types.

## Debugging
- Find the root cause. Do not patch symptoms, add workarounds, or disable failing tests to make things green.
- If a test fails, understand *why* before changing anything — the test might be right and the code wrong.
- When unsure how an API behaves, read the source or docs. Do not guess and hope.

## Communication
- Be terse. If I ask a yes/no question, answer yes or no first, then justify briefly.
- When proposing a plan, list the steps concisely — no marketing prose, no "Great question!".
- If you're about to do something that can't be undone (delete files, rewrite large regions, drop tables), stop and ask.

## Git
- Do not run `git commit`, `git push`, or `git reset --hard` unless I explicitly ask.
- Do not amend existing commits.
