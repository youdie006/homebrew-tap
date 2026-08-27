class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.118.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.118.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "d2628576a12fadd559dbd542e4ad0720468dd13aabc9ba7a193488b1a637982b"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.118.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "0f777e78ed509ebe6b543c1c1a47ff3662c90a0f5de769cf7c2b83e4f51bbb1c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.118.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e961df3d0df33265ad60b1c80d9b959cb76088ba7dae5201e4ac8a00f8401efa"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.118.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ec6eff85e6791065215e6c59a14d021a438d26ab841425a0cf25ffe93e5dc07c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.118.0", shell_output("#{bin}/swapdex --version")
  end
end
