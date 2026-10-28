class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.20/sessionwiki-v0.34.20-aarch64-apple-darwin.tar.gz"
      sha256 "d612915433b32eb7dc05dc85bc7378874ceac59243da331b7a24e3ba2608139d"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.20/sessionwiki-v0.34.20-x86_64-apple-darwin.tar.gz"
      sha256 "a297022ce2b883a9a2b15fd126fb2dfbab201e45d9bc7d98231af209d170b460"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.20/sessionwiki-v0.34.20-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "38ba153140f473911fd4c4b5d769c24560fc3addc2032016f3ac4f0e6c97f695"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.20", shell_output("#{bin}/sessionwiki --version")
  end
end
