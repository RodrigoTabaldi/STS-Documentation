---
name: sts-documentation-generator
description: Prepare and generate software technical documentation governed by the STS Portuguese and English base models. Use for project documentation, architecture specifications, or documentation charters; not for unrelated PDFs.
---

# STS Documentation Generator

## Purpose

The PDF models in `assets/` are the project's **Base Manual** and **Base Charter** for software technical documentation:

- `Model_STS.pdf` is the canonical Portuguese model.
- `Model_STS_English.pdf` is the canonical English model.

They define the required documentation structure: context and scope, requirements and traceability, architecture, data and integrations, quality and security, operations, ADRs, and references.

## Non-negotiable baseline

- Keep both baseline PDFs byte-for-byte unchanged. Do not edit, re-export, compress, translate, or rename them.
- Select the Portuguese or English model according to the requested document language. Keep both when the project is bilingual.
- Create generated project documentation separately from the baseline files.
- Preserve the model's section order and the meaning of its mandatory sections. Record a short reason for any section that is not applicable.
- Treat `DOCUMENTATION_CHARTER.md`, created by the terminal helper, as the project's documentation charter. It points to the selected immutable model(s).

## Terminal preparation

Run the helper from this skill directory to initialize a project's documentation base:

```powershell
./scripts/prepare-sts-project.ps1 -Destination "C:\path\to\project" -Language both
```

Use `pt` for Portuguese, `en` for English, or `both` for a bilingual project. The helper copies only the selected canonical PDFs to `docs/sts-base/`, creates `DOCUMENTATION_CHARTER.md`, and verifies their SHA-256 hashes after copying.

## Generating a project document

1. Read the selected base model and the project's `DOCUMENTATION_CHARTER.md`.
2. Gather verified project facts: scope, stakeholders, requirements, architecture, contracts, quality controls, deployment, operations, ADRs, and references.
3. Generate a new project-specific deliverable in a separate location. Do not overwrite either baseline PDF.
4. Keep IDs, links, acceptance evidence, diagrams, and decisions traceable. Never include secrets, tokens, or personal data that is not required.
5. Before delivery, check that the document follows the selected model's section sequence and that links, owners, evidence, and references are present.

The baseline PDFs are static reference models. If a filled PDF is required, build it as a separate output and preserve the original page structure and visual hierarchy; do not modify the baseline assets.
