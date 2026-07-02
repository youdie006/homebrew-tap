class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.17.0/sessionwiki-v0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "fd74cb7a0745500cd8264fffcde465d27c84bd3e234df3b755084e036ed17b39"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.17.0/sessionwiki-v0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "9cfcc43f2bcda2c0b54940e78eaf4c911d272a825cd9639bff7a930da69807da"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.17.0/sessionwiki-v0.17.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "81f2ed1b775a46e58f4d9756a2edc21f157f2a85e48bd85c80ef8645956d4516"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
