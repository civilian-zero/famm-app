# Claude Code Instructions

You are working in famm-app.

Famm is the fitness-specific application built on top of a broader platform.

You may use fitness-specific terminology in the user experience layer, including:

- trainer
- client
- session
- package
- membership
- gym
- workout

However, do not duplicate platform behavior that belongs in platform-core.

When implementing features:

1. Identify whether the capability belongs in platform-core or famm-app.

2. Use platform primitives when possible.

3. Keep fitness-specific language at the UI and application workflow layer.

4. Do not create local models that duplicate platform-core models.

5. Before building a feature, run:

.ai/prompts/feature-review.md

6. Before opening a pull request, run:

.ai/prompts/pr-review.md

If a feature could support three or more non-fitness industries, recommend a platform abstraction.
