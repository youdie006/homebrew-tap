class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.67.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.67.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "59bbff32e84042dad5e07a7d706839f6d038669b33fc6376aece900a2c397db5"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.67.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "a18251f34659f433e9c036f5d1abe0cc67f232ca92483dfc74dcc917df9d90f8"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.67.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c09bf0eac179acb58fc59ce229bea1ca1af96f4b9e557a144618a4867bd86854"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.67.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "86c4e0f38643bdd2e6f8b92598a5dc5dc7b61478f206261de17d1f2025364f13"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.67.1", shell_output("#{bin}/swapdex --version")
  end
end
