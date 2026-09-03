class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.142.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.142.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "6116d269effeda65f7f85dc28952b5818f966547ff743f8cebe6f51eac758073"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.142.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "0e9b0823baabd71423c410a8c0866d2732654f1b27c4987ae2da47af1a496d7e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.142.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7b1c635a0977c962a389a8a4c436289ce73968fbdb08c3b62fb1faf2a602f75e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.142.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a485113fd0f23748858325e96c0c64839a2b6dab23ebb2a0e29f64729257b689"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.142.0", shell_output("#{bin}/swapdex --version")
  end
end
