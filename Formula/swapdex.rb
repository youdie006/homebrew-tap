class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.32"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.32/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "0c4cfdcad6e42a20fd053af05a5f0f475fa4f8f8055015ddfa30de199bde56ef"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.32/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "123d78b7ae4072b831823ceb9d76436533737cd5a1567148a189a2cee249b93b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.32/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bdce58a57f6b200f8b9a0f298b2124426690cd34c6a2e66bbd25a159036c3855"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.32/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "32c3dee06ad0549f01d0e34e04ccfe96d46e50e78033ef3da818f31c5e8e07d9"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.32", shell_output("#{bin}/swapdex --version")
  end
end
