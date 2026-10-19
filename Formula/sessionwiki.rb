class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.4/sessionwiki-v0.34.4-aarch64-apple-darwin.tar.gz"
      sha256 "e1f62749328b57f23a8fe2f1ec6595526f0c7815057a5fe08abe9a8ad8c75977"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.4/sessionwiki-v0.34.4-x86_64-apple-darwin.tar.gz"
      sha256 "3e0257b150a54728803fa9c8f05718cd5ddc5849e48d62fa27a9f92c4fc80d62"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.4/sessionwiki-v0.34.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4237d3fb72c54fe94d721f3d120f2b974d565d34bef7fe12107563a82a8f197b"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.4", shell_output("#{bin}/sessionwiki --version")
  end
end
