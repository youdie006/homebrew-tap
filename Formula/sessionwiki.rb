class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.19/sessionwiki-v0.34.19-aarch64-apple-darwin.tar.gz"
      sha256 "2398a3c720c7f1a27066fdcf50fc294be50fe54c4e401aa953086c0e82ff7601"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.19/sessionwiki-v0.34.19-x86_64-apple-darwin.tar.gz"
      sha256 "185d3d46f383034ed34815c06dba38a6097f2ee903a9d3e1ac1b81d8591daf48"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.19/sessionwiki-v0.34.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9fa8e3f6be8d205e690a5231d19439f49c010db8bcb0a2710824e011fc5bfe5c"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.19", shell_output("#{bin}/sessionwiki --version")
  end
end
