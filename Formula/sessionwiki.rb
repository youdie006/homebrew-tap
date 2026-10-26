class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.14/sessionwiki-v0.34.14-aarch64-apple-darwin.tar.gz"
      sha256 "d9347addf80106844df36d3c152e6d4c0ccc491f10d08fcf49e2531739a35dcb"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.14/sessionwiki-v0.34.14-x86_64-apple-darwin.tar.gz"
      sha256 "08a2ad46dfbd5cfb996e0ed2cc3616d5431d5efc98b063fa259948a07bf9f0c3"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.14/sessionwiki-v0.34.14-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "64970186c9cbc882c79992910432773ac569fed6ad11eac09a73693517fe26ef"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.14", shell_output("#{bin}/sessionwiki --version")
  end
end
