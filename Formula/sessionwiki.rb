class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.15/sessionwiki-v0.34.15-aarch64-apple-darwin.tar.gz"
      sha256 "a97ff6836e8cf082aad0e3e65ef036775ffa09b539da939bd96bd3aedcaa5ef8"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.15/sessionwiki-v0.34.15-x86_64-apple-darwin.tar.gz"
      sha256 "1e65252e01180e7a70b0a37155fb948026fc67fb561d86b22f37ab1232edde2e"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.15/sessionwiki-v0.34.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c1be64c907a2943ebd89ece2b03cf93bdaf248cf602845ac1460fe162796ae6e"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.15", shell_output("#{bin}/sessionwiki --version")
  end
end
