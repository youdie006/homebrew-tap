class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.71.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.71.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "3ea3245a57ee93a6512469967d33817667abb3dbc1001e7c69b794d75d3d4aba"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.71.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "838d9f09d68b0852f489c7d5f71dfd1da0f5411115d88ef5a05c23f46db7f2da"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.71.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "01bdda1398754b00eb88effd1c45ca6f5ecce3dd20313cd244473a66abeebbaf"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.71.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4fbc28e184f9fd2c4ea81fdd5128dcbc00be8e89070b210cfe5414d25c30c339"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.71.0", shell_output("#{bin}/swapdex --version")
  end
end
