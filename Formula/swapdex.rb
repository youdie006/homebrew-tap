class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.4/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "2001e4f831784ded58b45245bb6907899e54dc9542baad43c0f74ebf815d012a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.4/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "007dbd1d267cf79dc6a2117b9dd18f99ed7459a18e44ffb1dffb3ce73b020a4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.4/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "caa0ba8bf9f1a48296ce0c4b238d71cea815c2424ff22d3562502fc6913d54be"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.4/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "75b8d8d016f521a7611d4cf2f2bb26f40022cf9b65f38bcb0acc011fe61179a0"
    end
  end

  def install
    bin.install "swapdex"
  end

  test do
    assert_match "swapdex 0.1.4", shell_output("#{bin}/swapdex --version")
  end
end
