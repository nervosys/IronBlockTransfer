# AI Ontology

`ibt ontology --full` emits a complete [JSON-LD](https://json-ld.org/) capability schema using [schema.org](https://schema.org/) vocabulary.

## Purpose

An AI agent can call `ibt ontology --full` once to learn everything it needs to operate `ibt` — parameters, types, constraints, defaults, examples, exit codes, preconditions, postconditions — without reading documentation.

## Output Formats

| Format  | Command                   |
| ------- | ------------------------- |
| JSON-LD | `ibt ontology --full`     |
| JSON    | `ibt ontology -f json`    |
| YAML    | `ibt ontology -f yaml`    |
| OpenAPI | `ibt ontology -f openapi` |

## Schema Coverage

- **7 capabilities** — write, verify, list, info, checksum, format, ontology
- **Type definitions** — image formats, compression, device types, filesystems, hash algorithms
- **Platform matrix** — OS-specific device paths, elevation methods
- **Device scope** — 4 categories: microcontroller, removable, desktop, cloud
- **Exit codes** — structured error semantics for automation

## Example: Agent Workflow

```python
import subprocess, json

# 1. Discover capabilities
ontology = json.loads(subprocess.check_output(["ibt", "ontology", "-f", "json"]))

# 2. List devices
devices = json.loads(subprocess.check_output(["ibt", "list", "--json"]))

# 3. Write with safety token
target = devices["devices"][0]
subprocess.run([
    "ibt", "write",
    "-i", "image.iso",
    "-o", target["path"],
    "--confirm-token", target["confirm_token"],
    "--safety-level", "cautious",
    "--output", "json"
])
```
