class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.1.6"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.6/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "ef37704cdc0d860097de93676c83bce29ef80c102d41a4ca9220bfa7ea802385"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.6/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "6132335fb689d827c265be87d070c114a1e4116c6737d60423b9d324992ebae6"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.6/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a6f511f5791c62c24cf9491fb4dc6f27647421b18b0529051e5c0401317fe92e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.6/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "831d51f565f1b094a238023e99bd5b5092a6fa77e649d2a64825342aa623f35e"
    end
  end
  def install
    bin.install "swapdex"
  end
  test do
    assert_match "swapdex 0.1.6", shell_output("#{bin}/swapdex --version")
  end
end
