class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.3/sessionwiki-v0.34.3-aarch64-apple-darwin.tar.gz"
      sha256 "5c1f47ecf28ec0e5a7c75be54d7b33155d2949741872613a40f4998874bda476"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.3/sessionwiki-v0.34.3-x86_64-apple-darwin.tar.gz"
      sha256 "50deee35fbbf02e9fc74f2f0d3db32e31752592c99cf716924b2e112f6cffc74"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.3/sessionwiki-v0.34.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6307a6b0c48507375c70d5be5330ad50d3b02b36064390b922d1f192c32b4a29"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.3", shell_output("#{bin}/sessionwiki --version")
  end
end
