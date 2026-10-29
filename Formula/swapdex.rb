class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.30"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.30/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "e3a770f7fe8c1c0986d67dfc22387b7079127dd9cc87b2bc13b7eda586d1dc8b"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.30/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "1375abfcf6a40de9bec9611f8efa65d5efe37b5c3663f56425b679ae0cafc4eb"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.30/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "813d44b2cde1bba82dc1035538e4416f8d4a83a6b2b4b418ea7ccc262fd0c89d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.30/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0e31e201f9d95b6b0f685f7224b9d20f66f3c5c45ce439b7dcf3630973527abe"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.30", shell_output("#{bin}/swapdex --version")
  end
end
