class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.15"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.15/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a77d67bfc2644f33db2fa4389fd5aaafd6e97d1befe9448c5087631f66e8c798"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.15/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "a61b54e563bfbca276e2d9b59e9cdfbc97098e219a81431160b1a02f7b115bd2"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.15/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "54158d32208928a8f6a359bf8a729c82cbd95a03c41f2b0fffd44249a5dc23a3"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.15/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c84130628b6db2c1c1156b5e213ccf0af19ef011854c1ab219487b3fbcfb836a"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.15", shell_output("#{bin}/swapdex --version")
  end
end
