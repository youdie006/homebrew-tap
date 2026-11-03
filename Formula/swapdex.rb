class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.35"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.35/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "05f6fc1b39e178117242e2dab4d9c1c264dd105cc37f4c92e96e3112f9d12329"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.35/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "752f2d757bd0ad337b0962bc2afde5aa7a347742cc2fcf0fcef8c50a105e71de"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.35/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "25bf22473cf36ecf7802017997574cd77874096e1d50166146fd732d576a39bf"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.35/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d3e40cd3a86b35cf8c94db3541a20194870cd06256261d2cb5c2fd795020e8a0"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.35", shell_output("#{bin}/swapdex --version")
  end
end
