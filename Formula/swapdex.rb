class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.37.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.37.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "12bb6f022cfacc025b9f7b49e0416f421ffd828b30136650af08e68c49e53a1a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.37.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "6c4b8503decd9632c2162b44b38649349e6c4e5b5b88faf6c93d2381dfc8626f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.37.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f3b29535d44ac17aafd34de5fe837a3daf51cab49a46273fb51d945565c9685d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.37.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4544e824b22494f43fb1e4f1c52b19d25a6b1f03e8fa7881f7fecb8ad3179236"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.37.0", shell_output("#{bin}/swapdex --version")
  end
end
