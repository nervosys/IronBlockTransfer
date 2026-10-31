# Installation

## From Source (Recommended)

Requires Rust 1.75+.

```bash
git clone https://github.com/nervosys/IronBlockTransfer.git
cd IronBlockTransfer
cargo build --release
```

Binary: `target/release/ibt` (`ibt.exe` on Windows).

## Package Managers

### Cargo (crates.io)

```bash
cargo install ibt
```

### Homebrew (macOS/Linux)

```bash
brew tap nervosys/tap
brew install ibt
```

### Winget (Windows)

```powershell
winget install nervosys.ibt
```

### Arch Linux (AUR)

```bash
yay -S ibt
```

### Debian/Ubuntu

```bash
sudo dpkg -i ibt_1.0.0_amd64.deb
```

### Fedora/RHEL

```bash
sudo rpm -i ibt-1.0.0-1.x86_64.rpm
```

## Feature Flags

| Feature | Default | Description                               |
| ------- | ------- | ----------------------------------------- |
| `cli`   | ✅       | Command-line interface (always available) |
| `tui`   | ✅       | Terminal UI via ratatui + crossterm       |
| `gui`   | ✅       | Native GUI via egui/eframe                |

CLI-only build (smaller binary):

```bash
cargo build --release --no-default-features --features cli
```

## Shell Completions

```bash
# Bash
ibt completions bash > /etc/bash_completion.d/ibt

# Zsh
ibt completions zsh > ~/.zsh/completions/_ibt

# Fish
ibt completions fish > ~/.config/fish/completions/ibt.fish

# PowerShell
ibt completions powershell | Out-String | Invoke-Expression
```

## Man Pages

```bash
ibt man --output-dir /usr/local/share/man/man1/
```
