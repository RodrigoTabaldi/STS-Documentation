# STS Documentation Generator

[Versão em português](README.md)

A foundation for producing software-development technical documentation that remains consistent, traceable, and useful throughout a product's lifecycle.

This project consolidates and organizes references and good practices from international contexts, including material associated with industry, academia, and organizations such as Google and the University of Zurich, into a bilingual STS model. Specific sources and their versions must be recorded in the generated documentation whenever applicable; this repository neither replaces nor republishes those sources.

## Documentation is the Code's Constitution

In this project, documentation is the system's governing reference. It establishes what must be built, why, under which constraints, and how to demonstrate that the result meets expectations. Code implements those decisions; it must not silently contradict them.

In practice, requirements, architecture decisions, integration contracts, data, security, operations, and acceptance criteria must remain clear, versioned, and traceable. Whenever a decision changes, the code and its documentation must evolve together.

## What is included

- `assets/Model_STS.pdf`: the canonical Portuguese base model.
- `assets/Model_STS_English.pdf`: the canonical English base model.
- `SKILL.md`: operational guidance for using the models and producing project documentation.
- `scripts/prepare-sts-project.ps1`: prepares the documentation structure in another project and verifies the integrity of copied models.

The PDFs under `assets/` are immutable reference artifacts: do not edit, rename, translate, recompress, or overwrite them. Each system's documentation must be created separately.

## Expected documentation structure

The STS models organize documentation around:

- context, objectives, and scope;
- requirements, acceptance criteria, and traceability;
- architecture and architecture decision records (ADRs);
- data, integrations, and contracts;
- quality, security, and privacy;
- deployment, operations, and observability;
- references, owners, and evidence.

A section that does not apply must still be recorded with a short rationale. This keeps gaps explicit and auditable.

## Start in a project

In PowerShell, run the script from this repository and point it to the project that will receive the documentation baseline:

```powershell
./scripts/prepare-sts-project.ps1 -Destination "C:\path\to\project" -Language both
```

Accepted `-Language` values:

- `pt` for Portuguese;
- `en` for English;
- `both` for bilingual projects.

The command creates `docs/sts-base/`, copies the selected models, creates `DOCUMENTATION_CHARTER.md`, and validates SHA-256 hashes for the copied files.

## Recommended workflow

1. Select the model for the document's language and read the project's `DOCUMENTATION_CHARTER.md`.
2. Gather verified facts: scope, owners, requirements, architecture, contracts, risks, operations, and evidence.
3. Produce the project-specific document without changing the base PDFs.
4. Preserve the sequence and meaning of the model's mandatory sections.
5. Update documentation in the same change that modifies material decisions, interfaces, or system behavior.

## Contributing

Preserve the repository's purpose: governing and generating technical documentation. Changes to base models require a newly approved model version, while previous files must be retained for traceability. Do not include secrets, tokens, or unnecessary personal data in documents, examples, or Git history.

## Licenses and references

Before distributing derived documentation or incorporating third-party material, confirm its usage rights and cite the source, version, and access date. Record those references in the project document that uses them.
