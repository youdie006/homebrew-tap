class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.65.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "2dfd5855befd91f1381d906b9e9072ee7d7cfa92ff27a8e93d7939c10cc8b449"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "43b9ad92db5b0ee349d249ba2817090dfc946b796a8430bd213fa3c40814dcb0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a4456154dcdbe73821fb925ba1019aa1c413cb79180bbc174132936eeb2bed42"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b4b368c71fc4bc061c04680a22c4b736098f87f698dac3c8fb3c6e7833814840"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.65.0", shell_output("#{bin}/swapdex --version")
  end
end
