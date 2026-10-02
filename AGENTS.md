# AI guidance for this Neovim configuration

## Purpose and scope

Build a reliable, cohesive Neovim development environment around the owner's workflows: Zig, TypeScript, Git, and GitHub Copilot. The owner is accustomed to VS Code; aim for comparable discoverability and integrated tooling without sacrificing Neovim's modal editing.

- The active rebuild lives in [lua/CharlesTheIX/](lua/CharlesTheIX/), loaded by the root [init.lua](init.lua). Put new configuration in this namespace unless an existing shared module is intentionally reused.
- [lua/mac/](lua/mac/) is historical reference only. Do not modify it, wire it into the active configuration, or migrate it wholesale unless explicitly requested.
- [lua/plugins/](lua/plugins/) contains older plugin specifications. Their presence does not mean they are loaded or suitable for the rebuild. Inspect the actual require/import chain before claiming a feature is available.
- This is an incremental rebuild, not a request to install an entire editor distribution. Implement the requested step completely without expanding its scope.

## How to work

- Inspect the current configuration and Git diff before editing. Preserve uncommitted work, deliberate deletions, existing mappings, and unrelated files.
- Explain meaningful trade-offs briefly. Ask before making major architectural choices, replacing established workflows, or introducing competing implementations of the same feature.
- Prefer simple, readable Lua and focused modules. Follow conventions in the active CharlesTheIX code rather than assuming the historical configuration sets the standard.
- Reuse appropriate existing helpers and plugin capabilities. Avoid duplicate plugins, unnecessary abstractions, and speculative configuration.
- Keep configuration portable. Do not hard-code personal absolute paths, machine-specific executables, credentials, or OS assumptions.
- Use APIs supported by the installed Neovim and selected plugin versions. Check current documentation when compatibility is uncertain; do not copy outdated configuration blindly.
- Finish the wiring: an added module or plugin specification must be reachable from the active entrypoint, with its dependencies and setup order accounted for.
- Surface failures clearly. Do not hide missing dependencies or configuration errors behind broad protected calls or silent fallbacks.
- Do not commit, push, reset, remove user data, or install/update external tools and plugins unless the task explicitly authorizes it.

## Development experience

Treat the following as goals for requested features, not as features already implemented or permission to add them all at once:

- **Zig:** syntax support, `zls` language intelligence, diagnostics, completion, navigation, and formatting using the project's Zig toolchain. Respect compatibility between Zig and `zls`.
- **TypeScript:** TypeScript/TSX and JavaScript support, language intelligence, diagnostics, completion, navigation, and project-appropriate formatting and linting. Respect the project's package manager and configuration.
- **Projects and tasks:** predictable project-root detection, file browsing, fuzzy file search, text search, buffer navigation, and terminal/build/test workflows. Use project-defined commands instead of global assumptions.
- **Git:** accessible status, diffs, hunks, staging, history, and conflict workflows. Keep destructive or remote-changing actions explicit; never stage unrelated changes automatically.
- **GitHub Copilot:** intentional authentication and useful AI assistance without conflicting with normal completion. Never place tokens in the repository or send repository contents to another service without authorization.
- **VS Code familiarity:** make navigation, rename, code actions, diagnostics, search, formatting, and task execution easy to discover. Preserve useful Vim-native behavior rather than blindly copying every VS Code shortcut.

## Plugins, mappings, and editor behavior

- Before adding a plugin, identify the workflow it serves and whether Neovim or an existing dependency already handles it. Prefer maintained plugins with a clear benefit and modest startup/runtime cost.
- Keep plugin installation and startup side effects explicit. Do not make a validation run silently clone repositories or install language servers.
- Do not assume the historical plugin manager is the chosen architecture. When a manager is selected, follow its dependency, lazy-loading, and lockfile conventions; do not gratuitously refresh versions.
- Preserve the existing space leader/local leader unless a change is requested. Check mappings across modes for collisions.
- Give new mappings meaningful descriptions and keep related actions consistent. Explain intentional remappings or behavior changes.
- Coordinate LSP completion, snippets, and Copilot so accept, dismiss, and navigation keys behave predictably.
- Avoid duplicate language servers, diagnostics, or format-on-save handlers. Respect project-local formatter/linter configuration and make formatter selection deterministic.
- Do not assume a Nerd Font, clipboard provider, search utility, compiler, or language server is available merely because a setting references it. Document required tools and expose missing requirements clearly.

## Validation and documentation

- Use the smallest relevant check. This repository currently has no dedicated automated test, lint, or formatting harness; do not invent successful checks.
- For Lua syntax checks, use an available Lua parser or Neovim's embedded Lua to compile changed files without executing them. Syntax success does not prove module loading or plugin integration.
- For behavior changes, validate the actual active configuration and the affected workflow when feasible. A clean Neovim session alone does not verify installed plugins, LSP attachment, or mappings.
- Isolate startup checks from personal configuration/data and inspect bootstrap behavior first. Ask before validation that would download dependencies, modify the user's Neovim installation, or contact external services.
- When relevant, verify filetype detection, project roots, LSP attachment, mapping availability, formatter selection, and completion/Copilot interactions in representative Zig or TypeScript files.
- Run `git diff --check` for whitespace issues. Review the final diff and report exactly what was tested, what passed, and anything that remains unverified.
- Document user-visible mappings, dependency requirements, setup steps, and changed behavior alongside the feature. Keep these instructions current as the active architecture evolves.
- End with a concise summary of changes and validation, including any manual steps the owner needs to take.
