class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.1.7"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.7/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "5596413484a1317c472909a9fa94df0cb423cec28c7acc93f92b6f7c375d6706"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.7/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "f26c89760429db378f6d6a91afe0349de23baaaacc7d13dd970324342b3dda4f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.7/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f5b72658b9b87812b85b462493f11c8df32d91da90ab64d513a99d92773fe518"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.7/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "01bbf461670426b2d401c09d9f23a0733641d6abcc40f61391afc7521c615d86"
    end
  end
  def install
    bin.install "swapdex"
  end
  test do
    assert_match "swapdex 0.1.7", shell_output("#{bin}/swapdex --version")
  end
end
