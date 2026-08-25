class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.100.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.100.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "556f78207ceedc0907d41b610d7bf09a992b896f7781e7a5a630a6b513741ed6"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.100.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "eca805f5b946b09942f3c6fa0cda5aef10baf5e15ae2a1624bb9c566dcae677e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.100.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a90d8d832619de45930b141c0cdae6b2444123aa09ee9753593aff8dc8abc70d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.100.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "67cf7f65e8cb88e865abb1223256ff64ca84521f99f1f18b9469ab10d471d741"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.100.0", shell_output("#{bin}/swapdex --version")
  end
end
