class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.75.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "109385a49fff5c23d42edf3836948eb90646643da4466e11b8e264728ec87c00"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "b29a5828e9544dfc447e4bb0d23654fa2cdd327a16dc4e53640b2dcbb35ada4b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d9bd779b29c01eb235a7108b7e7ed1ee46b1f57bfd85dc0c8053a211a4a20d27"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "26cde25bc698db0015d5425418943a440610980636fa94bd90337d0ae450ffd1"
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
