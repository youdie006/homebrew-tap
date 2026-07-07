class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.9.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.9.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "412143cb53a85431e480ef0e9f7144821a66ce07b3b2e9e0df898ea14d586fff"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.9.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "6b7f753da5317ce3cf5de43bb26aa5dcd00e1f3bb1b75c22a955867bf786341e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.9.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b95e925274292e8e3748a76d0b927db7e74150130fae130d52c86d8484d3c89a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.9.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f65d90a8ec6e617b1fb0c9aaec62589c0d44c240e2c259ba9541bc79131c7730"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.9.1", shell_output("#{bin}/swapdex --version")
  end
end
