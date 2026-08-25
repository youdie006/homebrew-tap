class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.96.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.96.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "43353c46ac598a1f59268d9c23644d9f8eb878cf04a62bae7a5348801626c5c2"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.96.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "e67803833d4d216f604e9d7bdc867754c63c1f11fa71b2f1a977e86f0ffe834c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.96.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8a2fc253d281db191ff81bd973fcb9e58d9df8e58c93ebc0f386e4a1d58fd25a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.96.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e214b754f83a92bbd9ab293176ac57d0b33bf304bbb9db3b06dfbab28c68eece"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.96.0", shell_output("#{bin}/swapdex --version")
  end
end
