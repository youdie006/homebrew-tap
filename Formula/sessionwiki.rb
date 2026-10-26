class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.12/sessionwiki-v0.34.12-aarch64-apple-darwin.tar.gz"
      sha256 "e97fb50ccc300f894940ef4e39ae19e1e4e6c821d7a5a21f314c4929a9dd2cc3"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.12/sessionwiki-v0.34.12-x86_64-apple-darwin.tar.gz"
      sha256 "846dd2cee5389e882fff94d4d23717d653168526aaa1568f92c565dfc1dd2d56"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.12/sessionwiki-v0.34.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8f3fb4caa471d3ac358353d4c8090eda2c15bfd961de67c0959b41d1a919259a"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.12", shell_output("#{bin}/sessionwiki --version")
  end
end
