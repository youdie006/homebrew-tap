class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.119.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.119.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "79f52d98184d42a6302c109a6e548500f338b5557564ebea29b791cbeba9045e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.119.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "06cc14964a55a2079346e8ce2e24484632bc7f4904be1f88164dde180e1e9327"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.119.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7d93a4853128f5e4f64bbb3c266c8b22a3d6c5a72351d902df09641a1d799f74"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.119.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4c064f2970d2a2b8f53772baf5e2ef4ff489ef5c9e095af9e8f35613ab771ffe"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.119.0", shell_output("#{bin}/swapdex --version")
  end
end
