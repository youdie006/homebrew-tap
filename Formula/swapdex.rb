class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.122.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.122.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "df7f5db8f9cb32097039437a7e16867b5438297ca05c814838d6de66c59e62a2"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.122.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "64028db454db2f2c0eefd56ff6cb97e638de05bef2a96d8bf0052203cd7023af"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.122.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "364cc0b3c6a12193ce11f10fdf78adb413ea9c3ec1be8b9018afe0e82123389b"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.122.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f30b2dc59afc1179434e955ed056119d3ac1dc9d078c537f0e20f7e07d04aca7"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.122.0", shell_output("#{bin}/swapdex --version")
  end
end
