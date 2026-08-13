class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.59.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.59.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "56d2944f4b2bdf705fa133482def00b3a8ba77ca3fbf6fb396c2567cda1225bd"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.59.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "67d8d24b96fd9b6214dbb1f5e0d0f389328a42cd0a16c0366f1a017639958f71"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.59.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d801d72619627ccedb2112c22729872c85b06224de3b696eca3b2559aa5547c1"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.59.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ba25b236b782bb71118cd6bb0d14a9f5d21ce8bd1324e0f18c444569e8aab4fe"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.59.0", shell_output("#{bin}/swapdex --version")
  end
end
