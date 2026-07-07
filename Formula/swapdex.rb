class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.7.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.7.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "aad16efad634d09bcfc3b4c07e1d263788986e0813c583c43f598335c8423efe"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.7.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "60dfaccd516161f128e2c7a51c6b96383e4ed01dab4fd35c82f227538c0af00e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.7.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7a079012380b4e0962ce42090ab9588fa1b3b7a5c5adb3242a371645f5a4b70f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.7.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5d3b5247648a891b9adc96ea908bb7dcb17d9f1d96a0ef4b05df6045cdb749a3"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.7.0", shell_output("#{bin}/swapdex --version")
  end
end
