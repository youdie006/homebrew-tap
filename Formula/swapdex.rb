class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.138.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.138.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "3d076696e3c6b900bb9abf3bf42731475b1217a4003730cd37f4eda90571b76f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.138.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "9075f149145d5fec1e84d155c0632aafff251863065d30e378ff271322cbb7c5"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.138.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9a02af27215851e516963c8d46be1fb5c8b4a18f441574107c0145d941e5d8b3"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.138.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "db97b8d9bda75267ab9b275c87846bfbb881d300f9c3a318735e7bcfcb78758b"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.138.0", shell_output("#{bin}/swapdex --version")
  end
end
