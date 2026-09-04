class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.145.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.145.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "2ee0f1783f9765341859df01e56a2abca868d08c7f9b8a6ec6aaae0c6d973b8a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.145.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "38a6ad60882fb5d26afdbf8f8c3b66a77c5116aeee1b6abd2d58bfaac9b7026d"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.145.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "75f22025fb889a2c546b5f0bbd2ac0917e416470018990368a70add249d29925"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.145.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a6e1f8bee3e373c95aa192f12f5701eb2f10bc20e6e25fa10b6de34da3d9936b"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.145.0", shell_output("#{bin}/swapdex --version")
  end
end
