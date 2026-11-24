class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.26/sessionwiki-v0.34.26-aarch64-apple-darwin.tar.gz"
      sha256 "9d2a0bfcfc728199dd26d19c252f970b6b79967074b61c3ed63c3c9b072e4b62"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.26/sessionwiki-v0.34.26-x86_64-apple-darwin.tar.gz"
      sha256 "c9e4fa9fc25b9358b1d66e9a2a277e52dabd7405456fe802d0afef87dfbaf2dd"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.26/sessionwiki-v0.34.26-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5df387e35635e5a2bdc140b4af229801cffe01cbbcb406a8f20f38f289aaad0a"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.26", shell_output("#{bin}/sessionwiki --version")
  end
end
