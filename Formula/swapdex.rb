class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.51.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.51.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a08650f72d7b3921e1031d4f5bd9b0b4168e7c2a2b8baf69e1b455c011fc0818"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.51.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "c288e6c71791b3aa3cc675ee1559df5df487b7c70c9ca975ea8a6a718bcbea26"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.51.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b4c4c3864665d72186c82208ff3550c3fd2c8b9f7efcf23a641f2985bfeed538"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.51.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "10ef4ac072848f7f81e4f03810e17ae6267abf12cd27bb399056317887a43c4f"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.51.0", shell_output("#{bin}/swapdex --version")
  end
end
