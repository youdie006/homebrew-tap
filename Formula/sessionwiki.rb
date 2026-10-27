class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.18/sessionwiki-v0.34.18-aarch64-apple-darwin.tar.gz"
      sha256 "6418d086655bea38f031ad0f393513fd92512883675906045b3e174c60f30e97"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.18/sessionwiki-v0.34.18-x86_64-apple-darwin.tar.gz"
      sha256 "916b0048acd8a465ef61a17fbcd67427443c817942d41bb9f6a2ac7dac555d07"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.18/sessionwiki-v0.34.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "07bc6fa8be1fa9393ca90ae21c2ee87038ac39e8c1cef68c50060cfb0f6f3dd9"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.18", shell_output("#{bin}/sessionwiki --version")
  end
end
