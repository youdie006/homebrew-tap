class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.163.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.163.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "1f069102deff993a9b7695996640bd139141db3e6b99b3c60936d9138106908f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.163.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "3694f9fd8e2d84ba4002e208e83223ff40c32f936b45b7194990358617de61cb"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.163.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "79cd11f5bd87a83678a0f37c994b734457aced3794af638c4a89c17c2edb5e30"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.163.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6d758986f34a660b927fee962a938e72d3cda50724d4b6588ef5363f3e0b7795"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.163.0", shell_output("#{bin}/swapdex --version")
  end
end
