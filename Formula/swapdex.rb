class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.165.8"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.8/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "83d09e63378d2ff30d82c8b68f4bf78f56b930b7727cc492f0974351d453d22f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.8/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "adc0440e589a2506f367f58f7f1983bcc162af470fc004cdeddf6fd25013d158"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.8/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "45e1d3c65a153598c7bd068ecd1514a433679a434d0a013a026fc2e530af5186"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.8/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3242af1f6371529837c522ce90c5b7a49c0b97a96e1a02c9b3650690cdc897a9"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.165.8", shell_output("#{bin}/swapdex --version")
  end
end
