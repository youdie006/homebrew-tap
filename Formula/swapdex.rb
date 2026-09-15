class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.165.4"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.4/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "9a18452570ca390501075f91c34c9621c476abf21b95b3ddbeaa042b50d14219"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.4/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "79218d440ed1b43038191f4aa254ff07876767c7652434deeff87fb5b213b959"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.4/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5a7b974d4a7c095186b941f933c25766e1a37c84c7813edc6b2341d9ebcdce90"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.4/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dbbdfbeab89f018c02975f8c5605dc33905a2216a0d4d676f817e86211423fef"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.165.4", shell_output("#{bin}/swapdex --version")
  end
end
