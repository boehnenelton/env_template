# Environment Template Repository (env_template)

Authoritative environment template repository providing sanitized BEJSON 104a templates and companions for system definitions and secure credentials.

## Overview

This repository provides zero-secret baseline environment files for bootstrap, deployment, and onboarding across devices.
- **`definitions.json` (and companion `.sh`, `.py`, `.env`)**: Contains system non-sensitive paths and canonical directory pointers per Policy §4.5. All path definitions and markers are fully populated.
- **`secureenv_file.json` (and companion `.sh`, `.py`, `.env`)**: Contains the complete roster of secure credential and API key variable definitions (Gemini, Groq, OpenRouter, Cloudflare, OpenAI, TokenRouter, Ollama, GitHub tokens, etc.). All keys, field names, and typing metadata are preserved, while secret values are wiped to empty strings (`""`).

## File Manifest

```
env_template/
├── definitions.json             # Canonical BEJSON 104a user definitions (path vars populated)
├── definitions.template.json    # Identical template alias
├── definitions.sh               # Bash export wrapper for definitions
├── definitions.py               # Python set_env_if_missing wrapper
├── definitions.env              # Flat KEY=VALUE definitions store
├── secureenv_file.json          # Sanitized BEJSON 104a credentials (values emptied)
├── secureenv_file.template.json # Identical template alias
├── secureenv_file.sh            # Bash export wrapper (empty secrets)
├── secureenv_file.py            # Python set_env_if_missing wrapper (empty secrets)
├── secureenv_file.env           # Flat KEY=VALUE secure store (empty secrets)
├── paths.json                   # Legacy paths store (transitional, usable through 2026)
├── paths.template.json          # Legacy template alias
├── paths.sh                     # Legacy bash paths export
├── paths.py                     # Legacy python paths loader
├── user/                        # Sourced mirror directory for /storage/emulated/0/.env/user
│   ├── definitions.*
│   └── paths.*
└── secure/                      # Sourced mirror directory for /storage/emulated/0/.env/secure
    └── secureenv_file.*
```

## Security & Policy Compliance

- **Policy §4.5 Compliance**: Never commit actual secrets or credentials to public or unencrypted repositories.
- **BEJSON 104a Compliance**: All `.json` configuration files adhere to Elton Boehnen's BEJSON 104a specification.
- **Generated On**: 2026-11-01
