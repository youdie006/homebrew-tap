class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.20.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.20.1/sessionwiki-v0.20.1-aarch64-apple-darwin.tar.gz"
      sha256 "fca7967ae799d79ef304b0e89760a50713b21a9b327ad37ecad52282e41c6daa"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.20.1/sessionwiki-v0.20.1-x86_64-apple-darwin.tar.gz"
      sha256 "1a2296e7f0b7a85cfe1c7eafbc1c1ef366d596dcc0009bb2480cba10cceb5c39"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.20.1/sessionwiki-v0.20.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fdd87a1d9c185ac7112850faec742bf7f84778ed6f23ecffd94ea4011eae3bcf"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
