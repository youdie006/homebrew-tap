class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.26.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.26.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "e4be830f3fb7db1a189aedd7aa398715c8575ee761ff066f7a23f816bc060b2b"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.26.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "4d6f4409d7387dd3d513b86e232a481844329e5bbf68fd91ec21923f38c6cd08"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.26.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3c692cf9495a8c1751a5855b18fce617fcce2e3d289280b550139648625be5de"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.26.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c833e58428b06c7e960e7fec7fbcae284bfe30e865edb8ceac87afefdb4a06e1"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.26.0", shell_output("#{bin}/swapdex --version")
  end
end
