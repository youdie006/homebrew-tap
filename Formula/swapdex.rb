class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.15.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.15.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "e6562af78f4c2145accaad0592709088500376ba8e07356be810ede385987bd9"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.15.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "1105f4796e9f3264bced7a90395e867ee7bf6b55ac25b8114486567263d2ef13"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.15.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "172aa8720aa79e92263adfe41e9f81a4a3772cb41ba510c91a7fc3cdfd7ec79b"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.15.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d14ca90eae01448dfc93628ee39949216e67e32d462f630547a5a577d4346e2d"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.15.0", shell_output("#{bin}/swapdex --version")
  end
end
