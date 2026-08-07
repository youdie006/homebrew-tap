class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.36.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.36.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "f8003f3d615c7e097ef248a936dababfd05ef1e229e8779a22a7de77dafdfccd"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.36.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "162deae52d32553e98d157f39d5031d2ada1ac0fd2d10fd4a5f5c655008e9e40"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.36.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2c607bc591eb162b77a63e2fab1f4497834faaa27fb52dc272180381eafa0f3f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.36.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "572934e4f1c05d706a1f6c9089313901a5be1be8e17822f96bb7042e5c4efed1"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.36.0", shell_output("#{bin}/swapdex --version")
  end
end
