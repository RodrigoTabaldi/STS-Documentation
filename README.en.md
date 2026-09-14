# STS Documentation Generator

[Versão em português](README.md)

STS Documentation Generator is a practical standard for producing software technical documentation that remains consistent, traceable, and useful throughout a product lifecycle. It provides two bilingual base models, one operational skill, and a script that initializes documentation in another project with verifiable integrity.

## Purpose and positioning

STS brings widely adopted industry and academic practices — such as traceable requirements, ADRs, integration contracts, security controls, and operational evidence — into one documentation model. It is not an official standard and does not imply endorsement, certification, or affiliation with any institution cited as a source of good practices.

External sources that inform a document must be cited in that project's documentation, including title, version, and access date. This repository neither replaces nor republishes those sources.

Under STS, documentation is the system's governing reference: it defines what will be built, why, under which constraints, and how to demonstrate the result. Code implements those decisions; material changes to requirements, interfaces, or operations should update both in the same change.

## Repository contents

- `assets/Model_STS.pdf` — canonical Portuguese base model.
- `assets/Model_STS_English.pdf` — canonical English base model.
- `SKILL.md` — one STS skill, with two operational flows: prepare the documentation baseline and generate project-specific documentation.
- `scripts/prepare-sts-project.ps1` — initializes a documentation baseline in another project and verifies copied models with SHA-256.

The PDFs under `assets/` are immutable reference artifacts. Do not edit, rename, translate, recompress, or overwrite them. Completed documentation for each system must be created as separate files.

## STS documentation structure

The models organize documentation around:

- context, objectives, scope, and owners;
- requirements, acceptance criteria, and traceability;
- architecture and architecture decision records (ADRs);
- data, integrations, and contracts;
- quality, security, and privacy;
- deployment, operations, and observability;
- references, evidence, and decision history.

If a section does not apply, retain it in the document with a short rationale. This makes boundaries and gaps explicit and auditable.

## Quick start

### Prerequisites

- PowerShell 5.1 or later;
- write permission in the destination project;
- access to this repository.

From the repository root, run the script in PowerShell and specify the project that will receive the documentation baseline:

```powershell
./scripts/prepare-sts-project.ps1 -Destination "C:\path\to\project" -Language both
```

Accepted `-Language` values:

- `pt` — copies the Portuguese model;
- `en` — copies the English model;
- `both` — copies both models (default).

The command creates `docs/sts-base/`, copies only the selected models, creates `DOCUMENTATION_CHARTER.md` at the destination project's root, and confirms that each copy has the same SHA-256 hash as its source. Files with the same name at the destination are replaced; confirm the destination path before running the command.

## The two STS skill flows

### 1. Prepare the documentation baseline

Use the script above to attach the immutable models and documentation charter to a project. The charter points to the selected models and records the documentation's preservation, traceability, and security rules.

### 2. Generate project documentation

1. Select the language model and read `DOCUMENTATION_CHARTER.md`.
2. Gather verified facts: scope, requirements, owners, architecture, contracts, risks, operations, and evidence.
3. Create a project-specific deliverable outside `docs/sts-base/`.
4. Preserve the model's section sequence and meaning; link IDs, ADRs, diagrams, contracts, tests, and evidence where available.
5. Review links, owners, references, and acceptance criteria before delivery.

Do not include secrets, tokens, credentials, or unnecessary personal data in documentation.

## Using the skill

`SKILL.md` holds the instructions a compatible tool should follow when working with this standard. To make it available in your environment, install or reference this directory through the tool's skill mechanism; keep `SKILL.md`, `assets/`, and `scripts/` together because the skill depends on those relative paths.

## Contribution and versioning

Preserve the repository's purpose: governing and generating technical documentation. A change to a base model requires a newly approved version and retention of prior models for traceability. Changes to the script or skill must keep the README, generated charter, and actual command behavior aligned.

Before distributing derived documentation or incorporating third-party material, confirm usage rights and record the source, version, and access date in the document that uses it.
