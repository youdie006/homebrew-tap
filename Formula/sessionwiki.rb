class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.23.0/sessionwiki-v0.23.0-aarch64-apple-darwin.tar.gz"
      sha256 "bb93145f27805ce96356718b6ee33af4111f38b904c125e49b25755f526ba3d5"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.23.0/sessionwiki-v0.23.0-x86_64-apple-darwin.tar.gz"
      sha256 "d3ff92cd6cb02119c9e2493133e575d2892d214434943caed339c7a999bc842d"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.23.0/sessionwiki-v0.23.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "45010dca60762d6b554fc11c596956d645cd58fb6dc42be0b2953d74a41cc46d"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
