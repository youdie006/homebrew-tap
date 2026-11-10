class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.23/sessionwiki-v0.34.23-aarch64-apple-darwin.tar.gz"
      sha256 "49e1dafaf0e2892931125a3baca6dff4b9cf0b3b55b4e6727645b9631ce59d66"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.23/sessionwiki-v0.34.23-x86_64-apple-darwin.tar.gz"
      sha256 "e7d3a7e0b21c35e9587ffbc1fd95cf8c832a20dbd82fabd447b66c59fbf6f2d7"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.23/sessionwiki-v0.34.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3cae930c0d104e30eb01fee110b63373382136d121dc962f80c16033c9c3d24d"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.23", shell_output("#{bin}/sessionwiki --version")
  end
end
