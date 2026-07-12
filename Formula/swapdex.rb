class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.23.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.23.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "dabfe5bf35f41d70ffd3a7682822527e63b86293d6552094b10ca4103d97005a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.23.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "94da72e97eb8359d4a845b2894d8f76f9797d9fd5f5d95c542734764c72f1102"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.23.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4a73ff4666dcfe739d391557f4b69919ef09e4c95df5593c7b3f58fe3b831c19"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.23.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "142547b7ad83c408e0972a12d915e1749327ca0ccfa688927a70671a1191e669"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.23.1", shell_output("#{bin}/swapdex --version")
  end
end
