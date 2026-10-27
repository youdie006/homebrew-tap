class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.16/sessionwiki-v0.34.16-aarch64-apple-darwin.tar.gz"
      sha256 "8a8ca9d8b8a54e8a086835f02ec8dced26951721c569dc66da27939ef22536ae"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.16/sessionwiki-v0.34.16-x86_64-apple-darwin.tar.gz"
      sha256 "b1ad34d56ad2150d57a7441ac54e3dbad45d5887021dd27f92796651a40e3beb"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.16/sessionwiki-v0.34.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3fa7298d64bd7228de7e156258195108b2ce1c08cb84b7542b0bad014068c158"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.16", shell_output("#{bin}/sessionwiki --version")
  end
end
