class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.30.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.30.1/sessionwiki-v0.30.1-aarch64-apple-darwin.tar.gz"
      sha256 "29ae680d747b332eb0a8eee09da6aa9378355bf6e9ee7f12410edc89111b5de6"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.30.1/sessionwiki-v0.30.1-x86_64-apple-darwin.tar.gz"
      sha256 "e9a8ec9c09c6681dfff4de575682d96908fae67c81fc9ed87545e3d5db91fac7"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.30.1/sessionwiki-v0.30.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e7c26c259b048756acbe19fcbe61d2119ee54357158ebf85fdf24d9cffb1d30b"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.30.1", shell_output("#{bin}/sessionwiki --version")
  end
end
