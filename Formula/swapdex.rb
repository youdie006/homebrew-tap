class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.24.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a125e5b8ff3ba2945ace0159af007a1135411f8c9e9d85256c7c71f0f6ef375b"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "7f0ff68730141f3f3395a0524306c5045e51b34e7c841fc7bf01e3ab9ee9be3e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bfee54d787d1a4b5234410f80d14d58917aef4d4a8f5b94b204d2100cd114387"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8ec277718e52d9a97b81d41820d66d9fbf5e680e8b9e7c5b704305cf6fd8aac9"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.24.1", shell_output("#{bin}/swapdex --version")
  end
end
