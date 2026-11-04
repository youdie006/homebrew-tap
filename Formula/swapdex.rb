class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.36"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.36/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "32d43cb19cdaf9b5851773edddb73e883fcfc835d2f7f70aaec6c00a470fd36e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.36/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "d1610f83c4c8d2c8687c4a8af5b807a35a287c24b624a357df372942dd1ac591"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.36/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "589795930a7af9b167e1e3583bc84a5979caf6e399f98bccc49755bbfa112c0d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.36/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "aaae981272a0ac8ba5c42b0c0bf3d0543c95920b8f6c2ee290365b0f88cfdb57"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.36", shell_output("#{bin}/swapdex --version")
  end
end
