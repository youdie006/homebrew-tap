class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.133.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.133.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "62a47243ef7ed3f980b54dddad1c968b5f9e28c400da21d4c48dd0e76918d6cd"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.133.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "862e7001afbcbeef9cd250e92b2f819e1c93ec8b518b639bfb58b1d41bc1a372"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.133.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ed891c4ad4fb3ea2c81b9e16addeea4e96bf90338dc2cb3e00a3c29e8ad8f7b1"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.133.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "367eb4a236175e1d49f1a0b89515d3ecd50b1b019f3384b5b93fc13a274bdb58"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.133.0", shell_output("#{bin}/swapdex --version")
  end
end
