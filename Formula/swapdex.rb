class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.72.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.72.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "77e98e5a6e2659c50368302a890d23165db957aba5e88e9938f8f07ac5b4bd20"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.72.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "317e27cd14054cb311f64ea04c319c75ac1124728fa95d327ba08a656f58d2ca"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.72.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1515da34d8118fc470bccc269a2d1e7ccc258610d66279062314b519cbc9194c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.72.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a649a4d8a0f4ed766c8bb6fb8152b439c4fe3ef17c8d6ad5afa07c6e44b89a7e"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.72.0", shell_output("#{bin}/swapdex --version")
  end
end
