class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.75.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "137c9a6ff064424d573d655b9423d4d8e0d62e69188a1997610d9f564b942533"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "34452820201af2a4c2177b2ecde67418b09af0b1105cb1efc9c7bc39234836d9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d98bbf7811194eb4fb61e56983e6a379182ee3246f7d3a205b0ef1eb95207fd8"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "33f0f0dde812aa765499e9dc213e9030ea032e14461eba6fdc0c027301916796"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.75.0", shell_output("#{bin}/swapdex --version")
  end
end
