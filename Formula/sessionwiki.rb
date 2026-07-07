class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.18.0/sessionwiki-v0.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "503b6af6b2cafbf1b3430ede79af5f856d0ff795ddd7c90d9bbcb26e2e9b0fd3"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.18.0/sessionwiki-v0.18.0-x86_64-apple-darwin.tar.gz"
      sha256 "321673df08aad3b9afc90487cdabfed8398d73beb778162dff479b29ff9cc690"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.18.0/sessionwiki-v0.18.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9fec76967b5a7ac8907c3d02b4480b999bf8e97313579227bc253846d7eb5b7d"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
