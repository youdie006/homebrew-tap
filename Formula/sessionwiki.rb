class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.20.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.20.2/sessionwiki-v0.20.2-aarch64-apple-darwin.tar.gz"
      sha256 "908b404c0db770df93d25cdeb7f08eb79849853e9c9a5efdb4692ac49e80f1f6"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.20.2/sessionwiki-v0.20.2-x86_64-apple-darwin.tar.gz"
      sha256 "3a352756e92ab3d3d100556961af90996eb5993aa86aba642e600127f3c061b2"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.20.2/sessionwiki-v0.20.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "58cebb6eb0f48ff16ecc22c312cd2f0a3b6b40895c75de9a60b0c471b28105ee"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
