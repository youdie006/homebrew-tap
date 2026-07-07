class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.19.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.19.2/sessionwiki-v0.19.2-aarch64-apple-darwin.tar.gz"
      sha256 "2dc0dc2de87a8442f2eb1edf8dc21d6ced101f2bd0cb7e0d01bcdafb5fd6e28f"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.19.2/sessionwiki-v0.19.2-x86_64-apple-darwin.tar.gz"
      sha256 "8c622afd001636b7f05f3f868f1aa7d50f10bd5c9144ae299c090597f573a13a"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.19.2/sessionwiki-v0.19.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "11653c1a6599fdf3233965da092fb0b333c31d841dbe6638b1505b7961ab5931"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
