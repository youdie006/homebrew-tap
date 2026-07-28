class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.31.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.31.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "e99e5e7b887b7f0ef4ea8255aa58531517d3464a4d3de7599cffe2332c3bec81"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.31.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "2b72ef99337815e34121f74e1c08acccc2bd32b7502be19c28003a27e2b0cd5b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.31.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "763fed29d3872809b0d02d653479d23c20e233485fd11667f2fb58fbe68d7d4c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.31.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "11f315917f72ef645b0408dacaa4440ce32cac0b8abcded6a0b9ebf92e881f7d"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.31.0", shell_output("#{bin}/swapdex --version")
  end
end
