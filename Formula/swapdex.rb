class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.166.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.166.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "fc10264529f88737be56b1dd2dd3e212829dc3380255ee7975d61931d6b18e9a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.166.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "cb421b561415571315c951118992201dd7560ca40ab2ac2ee03701b79fb73dd2"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.166.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cfcf7e5fd69d25d97658caba6a1ebc104534c5e630e7c2e0513cc5df93adddf1"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.166.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1fb1c9819a5435dff5139ae2f47878cb996e4c7d37197ac7b201047d9b67e063"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.166.1", shell_output("#{bin}/swapdex --version")
  end
end
