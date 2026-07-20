class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.29.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.29.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "6285136db9de39b7f0f7e148fd5c386ed70e4975e7374f0eb67552c08b572fa4"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.29.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "99693c8aea06cef9b5675c9d0d79f319d6d9fd46a57ae20cf6812854550c6f40"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.29.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5d9a241bcd38eb560339d11164de1c6e5aea7f33c7d5d1645f14ddd9c97a8455"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.29.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "099635e1762696fa85e588e2200b04625d9040e4bffe1fdcea1f555d7b0c9225"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.29.0", shell_output("#{bin}/swapdex --version")
  end
end
