class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.16.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.16.1/sessionwiki-v0.16.1-aarch64-apple-darwin.tar.gz"
      sha256 "568fe9eb90a960c41f4eb4bd2401d22ffe089f9ecace256061c70b4258ca6ac6"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.16.1/sessionwiki-v0.16.1-x86_64-apple-darwin.tar.gz"
      sha256 "1966f71009532dbd31a7154cf0f6992ed698f2e6981526d0da83d2ef3361d025"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.16.1/sessionwiki-v0.16.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "01a69e2f0e4f81d99e22b90407fa89f014c3be3b7d38939d72c5176564706906"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
