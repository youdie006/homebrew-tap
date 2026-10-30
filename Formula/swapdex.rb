class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.31"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.31/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "ef52c58904faf6852cf5394fafc72f72e0a595c40d6a8e611d449c103b807534"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.31/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "4ef73d1b5ef3c4946ff8742233e5663a44779b5ae64b021ced41dc1b5a679b89"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.31/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d3e5369e40bb3fa4ff94fd6ec260d23f4891f90fd27b819c66baaf5e1a7f9197"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.31/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3466d1758fde6e4485c05b4a2dae2a6309ea737a761e214fab3fcd8712ff8da3"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.31", shell_output("#{bin}/swapdex --version")
  end
end
