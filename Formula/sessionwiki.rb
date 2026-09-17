class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.29.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.29.0/sessionwiki-v0.29.0-aarch64-apple-darwin.tar.gz"
      sha256 "df76f4dc9bd69b99d0b607605b69fd9f00f910b47933c7e99ab0e37c5687d621"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.29.0/sessionwiki-v0.29.0-x86_64-apple-darwin.tar.gz"
      sha256 "0066c554a801ac1efa3b0793fa6586872594e8deb2df5c2df98572573c631bb1"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.29.0/sessionwiki-v0.29.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "31964024d7c89867636a10818452ae0c39e75e80990905a442747ad2287820c8"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.29.0", shell_output("#{bin}/sessionwiki --version")
  end
end
