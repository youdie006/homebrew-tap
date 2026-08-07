class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.38.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.38.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "d9d74dccfb48e88ee75700544fa4a372d38bc84f52a0fcef9f03503592866e09"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.38.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "c2477593d50d3f19a6e6e5f2e53b4888b0f4cad84322fcff64c8fb59db976a8a"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.38.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "719f387ccb0a7b2d22ea6e0aef72a6316fdec4780c3f54864eb4e886c16c73bb"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.38.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "04d390e07e7eeeb617d41bdec291e565cea606bcfded93be893264fb2a4ce890"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.38.0", shell_output("#{bin}/swapdex --version")
  end
end
