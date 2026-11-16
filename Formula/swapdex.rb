class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.39"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.39/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "f54cfdc396b020185d4706d2569f963e5e150149d332c72c3d3a5691c5710227"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.39/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "c71b08b13626951bf0941f997a421ea070a6120c144d3ca0f5c2f5dde3ffe8e0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.39/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5a4161f67df87942c415b310c0b1182bbf55587d042cf20f1ffc7a5bce543165"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.39/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8bdf7e1533420a714c37003044d4f4e045293bd501f064e2184450afe7f0a567"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.39", shell_output("#{bin}/swapdex --version")
  end
end
