class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.33.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.33.1/sessionwiki-v0.33.1-aarch64-apple-darwin.tar.gz"
      sha256 "d6a5bd2e9d59bf89753da142672e53e7df34a7fd143f45bed6017b32a2e08597"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.33.1/sessionwiki-v0.33.1-x86_64-apple-darwin.tar.gz"
      sha256 "7dc1c46a01c5bdf943aa4bb9d4afe3d824cd84f9f65a6c8855b6b13c8f9c3b93"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.33.1/sessionwiki-v0.33.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dc0d3bb540e11104bcb7d0c232442fd78320abffa654ebfa823a97afbddb29c8"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.33.1", shell_output("#{bin}/sessionwiki --version")
  end
end
