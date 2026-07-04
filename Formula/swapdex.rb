class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.3/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "beb059456e5ab083cc4fd8643851d03226b3e1c743264e0321bbd211e6147b20"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.3/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "6145b3024347eb497dc09be333e3171075f7ae90f693f6f7f4704e4c53f67930"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.3/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e44cf4ad00fe614b74952fc3498a77bddd71bc31cdad0830d9629a9544b98da1"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.3/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d3d14f6e0c32952fca6eecc81774f67be57cea6b69cf20408ade63cce9df11f7"
    end
  end

  def install
    bin.install "swapdex"
  end

  test do
    assert_match "swapdex 0.1.3", shell_output("#{bin}/swapdex --version")
  end
end
