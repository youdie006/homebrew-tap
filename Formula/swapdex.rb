class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.166.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.166.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "185b4703d43fe2c0acbc96788252b07b38b0b67de6c68fd27784cd13b3d224b6"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.166.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "98f671f357259cd8e88ff38a8b5a1fb430aa775e661590c803e2e004a729f1fb"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.166.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "aabd6ff0f86bcf8ae2ad09ea39a7bd735b0cb5ba3baca4d59beb54db04208cb6"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.166.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3e9ab4a0febd327715ca34f56b3533666d312cd6335e80c32d791215237be5f5"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.166.0", shell_output("#{bin}/swapdex --version")
  end
end
