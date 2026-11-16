class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.38"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.38/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a9eeeb9073cffbc20bc0caad924d44e7bf0d50db4abf991707bf5e4a408e21ef"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.38/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "5ca90b2e7414af2d4a88c897a9d1ab534e287acb277ffa0b2ee24ecc9841aa49"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.38/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6e91f5063c806c23373ed2a4659f068461911bdc678a304e80d68ea2deede79c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.38/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "55f1db16a8e3ee2b431a91ca21c924d684adafb622e034b5c9fe7a729c11e29f"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.38", shell_output("#{bin}/swapdex --version")
  end
end
