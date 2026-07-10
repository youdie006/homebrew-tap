class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.20.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.20.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "5b507ab96f5aac309b5a24cc0da03db0628452b1563f406f0f0975bc1413e7cd"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.20.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "15a1abb7c3ae2c192356bb560a8537885be07b285dc3175e093a61963a2560a8"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.20.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4bc8a728aa4bf912c79e38b0752a2265693e9422afd491a15c51536256d6a31f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.20.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "906029d9fe6edcfa39ae3e1c302590766baff687f708334efc55cc1c47cce7ca"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.20.0", shell_output("#{bin}/swapdex --version")
  end
end
