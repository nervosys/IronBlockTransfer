// Shell completion generation — bash, zsh, fish, PowerShell
//
// Usage:
//   ibt completions bash   > /etc/bash_completion.d/ibt
//   ibt completions zsh    > /usr/local/share/zsh/site-functions/_ibt
//   ibt completions fish   > ~/.config/fish/completions/ibt.fish
//   ibt completions powershell | Out-String | Invoke-Expression

use anyhow::Result;

use crate::cli::{Args, CompletionsOpts};

pub fn execute(opts: CompletionsOpts) -> Result<()> {
    let mut cmd = <Args as clap::CommandFactory>::command();
    clap_complete::generate(opts.shell, &mut cmd, "ibt", &mut std::io::stdout());
    Ok(())
}
