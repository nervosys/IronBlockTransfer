# Quick Start

## Write an Image

```bash
# Auto-detects format, decompresses, writes, and verifies
ibt write -i ubuntu-24.04.iso -o /dev/sdb

# Windows
ibt write -i image.img -o \\.\PhysicalDrive1

# From a URL (streamed download → write)
ibt write -i https://releases.ubuntu.com/24.04/ubuntu-24.04-desktop-amd64.iso -o /dev/sdb

# Sparse write (skip zero blocks for faster writes)
ibt write -i image.raw -o /dev/sdb --sparse
```

## List Devices

```bash
ibt list                 # removable devices
ibt list --all           # all including system drives
ibt list --type usb      # filter by type
ibt list --json          # JSON output with fingerprints
```

## Verify

```bash
ibt verify -i ubuntu-24.04.iso -o /dev/sdb
ibt verify -o /dev/sdb --expected-hash sha256:abc123...
```

## Checksum

```bash
ibt checksum image.iso
ibt checksum image.iso -a sha256 -a sha512 -a crc32
```

## Safety: Dry-Run

```bash
# See exactly what will happen without writing anything
ibt write -i ubuntu.iso -o /dev/sdb --dry-run

# Agent-safe write with device token
ibt write -i image.iso -o /dev/sdb --safety-level cautious --confirm-token <token>
```

## Interactive Modes

```bash
# Terminal UI
ibt tui

# Graphical UI
ibt gui
```

## AI Integration

```bash
# Export ontology for AI agents
ibt ontology --full

# Start MCP server
ibt mcp
```
