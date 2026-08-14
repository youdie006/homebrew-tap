class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.63.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.63.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "0c8c00397fa5184ed023063906faacec143506639d55cb91a549b023db24a69c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.63.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "ccba0b9999d9283adcb4d8c0ce7c8d3388b2363dbed927807eda3a88adf73b0b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.63.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7c6e0943607b46875c7cc4fb612e5d777f1fc18dcab2b1c481c39ead7932ee95"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.63.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d985494c6a60022529063d673412e05dfb8c379a60346bd6a0bd5376ba0d7ecc"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.63.0", shell_output("#{bin}/swapdex --version")
  end
end
