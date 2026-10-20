class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.7/sessionwiki-v0.34.7-aarch64-apple-darwin.tar.gz"
      sha256 "7192ef5d6a710609e31f575ad736244b100747f948979257ff9bfd3977112f91"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.7/sessionwiki-v0.34.7-x86_64-apple-darwin.tar.gz"
      sha256 "11537ccea074a9c4edd9ebd3fcdfa0fbb2dd333d8fd91156c714d7c11058e8a2"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.7/sessionwiki-v0.34.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "354df12c6819d4bc68345e4f262dae8d2eafc840c3f7c5918deee102039d6b29"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.7", shell_output("#{bin}/sessionwiki --version")
  end
end
