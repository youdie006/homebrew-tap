class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.65.3"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.3/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "d7d2c12b0262b6c5b5d0c9bf84b0cc2ae2c467d22bdc1d1a2e49f0ac873a6293"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.3/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "c1cb334b80ee648228eaebebeb20a6c947f8a26abe4b3bc1aca58d39e326c16f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.3/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6c649d191a1b9d43947b12666429ec37c94c4cde66d63b7d7e55d427f7ed8a78"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.3/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3ca4b44f1a799af09073dd0d212b74c2b966a76e6af7ea4402704d5f402cb9f3"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.65.3", shell_output("#{bin}/swapdex --version")
  end
end
