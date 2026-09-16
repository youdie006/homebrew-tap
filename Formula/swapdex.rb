class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.165.6"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.6/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "14fd36411dcc11c8b7afe1ae6d2cbc6bbb9affe55aaed82584fa18438b61ae81"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.6/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "bb5976ab46d2c21a1987b0dd7fa4263ea2b49f302a23b0caaa08df6c7fa6782b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.6/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7a8c207a4867189b77fed767ce4b116bc37383aa2a81b36de1bf217e33854107"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.6/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "be148ae6217493a4f1bd3c15b11e4b6e1e05eef1fb74a14d9f9811d35a14d477"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.165.6", shell_output("#{bin}/swapdex --version")
  end
end
