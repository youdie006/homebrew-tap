class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "002eb42f7f14c612cfe79d6ac3b8993b5cc8b7731b00ccd2c2d52706c2fa7425"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "e5f96b479e4b0b020d19a0d8972f4f5af1d1e61c0c18462a72dc5ec97ebc1669"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5c75a05d05214cb364b238afc13d8ff20cadbe4a00a2292e454841cf7a94e86a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dfa6f642d87091f25411cc71327eea85d89de4a17eaaa9ea2723db783c3cb7a4"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.0", shell_output("#{bin}/swapdex --version")
  end
end
