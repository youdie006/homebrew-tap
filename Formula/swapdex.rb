class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.26.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.26.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "c8f2f4029201f8ea03c5fb7c37cdb1de339ac00b258b1f6ac70599174a6f949e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.26.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "6b4401d6c4b407c21e1ae8ea63ac95172705eb500dfe4fc289f563f3b4f011f6"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.26.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5de4c6cd20b297892c5bfcb95de2b7f5086c47612b8aba57fb8c3aede65b56f0"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.26.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f234dc3e2c8ce4f7978169bd5a704f0b156f5c6aa3e26303276b9b00b96e2626"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.26.1", shell_output("#{bin}/swapdex --version")
  end
end
