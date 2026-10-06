class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.12"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.12/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "4dead5051bcad05dc3b2cc8ff1393002ff798a12e17843ac7449df5a405e65a5"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.12/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "b40404487a49b55b659e7f620c63a9af3fdb239e242f787f471a7d86283e0d44"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.12/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "aa7cf52036b32940452c35606a3594f257407f11029b86f9cc18d1d846c3c6ee"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.12/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "942c7d88fb28f612a7219fba3c0a755617d41634ed93da52bf0c1929e1ae9917"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.12", shell_output("#{bin}/swapdex --version")
  end
end
