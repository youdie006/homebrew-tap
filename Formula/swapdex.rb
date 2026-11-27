class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.45"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.45/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "4c3adeca58a324dfa58d331ff4fb94015802310aed391f986138d26976571096"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.45/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "98082faf7f974b21369d9ebd79342a3dea8a12128a817b836cb8daa7d4819db2"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.45/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5fee27eec89ce6ff96cfc6d7d76ebeda71212930deae0281e6a5e129a80819c6"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.45/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cebc5a0036fed208df65d4ba2035554e31668ab8193f0184c46f2bf3f580ea61"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.45", shell_output("#{bin}/swapdex --version")
  end
end
