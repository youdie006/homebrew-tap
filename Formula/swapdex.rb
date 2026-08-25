class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.103.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.103.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "742a39a0ee1137f7d804b3efffca01d336b67cc8d2ec6ba797b5be48823df8da"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.103.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "a8ca27f92c02640941b9d98e307543b080a8d111eb371fdeb4396be0030fafcc"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.103.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e70699b4b2c91f97540d17e2f957fb456d46fbdf794d7d2eb8899efe64620d3d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.103.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3a62ef977c3260f702ff44838e03f8790bd253a628f7fb7706f4274ed06c9090"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.103.0", shell_output("#{bin}/swapdex --version")
  end
end
