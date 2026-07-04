class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "252fb9e6062a063c7ead1e65b2da41281a551ab0a015efc03061f8c76cd49f44"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "3220777daa00bdb63d0bd0e4001d58f8304750250250aaec6c1701f44ce6e93c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f66f3d637472ab80dec78a5273f64b4370427b68a3bc79b329482d96384e9c09"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e369e82739e35492ab6cb9e962b90704f0f9a696a8f3d55b2a4d074864e1b02a"
    end
  end

  def install
    bin.install "swapdex"
  end

  test do
    assert_match "swapdex 0.1.1", shell_output("#{bin}/swapdex --version")
  end
end
