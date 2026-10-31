class Ibt < Formula
  desc "Agentic-first CLI successor to dd; human-first GUI/TUI successor to Etcher, Rufus, Ventoy"
  homepage "https://github.com/nervosys/IronBlockTransfer"
  url "https://github.com/nervosys/IronBlockTransfer/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "RELEASE_SHA256_PLACEHOLDER"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/nervosys/IronBlockTransfer.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    # Generate shell completions
    generate_completions_from_executable(bin/"ibt", "completions")
    # Generate man pages
    mkdir_p man1
    system bin/"ibt", "man", "--output-dir", man1
  end

  test do
    assert_match "ibt #{version}", shell_output("#{bin}/ibt --version")
    # Verify device listing runs (no root needed for listing)
    system bin/"ibt", "list", "--json"
    # Verify ontology output
    assert_match "IronBlockTransfer", shell_output("#{bin}/ibt ontology --full")
  end
end
