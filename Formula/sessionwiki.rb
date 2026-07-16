class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.21.0/sessionwiki-v0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "f50b6ba31947863d2b2c71ecfb203bfa3f74a63b4e7aac40fafcb935f16f07e1"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.21.0/sessionwiki-v0.21.0-x86_64-apple-darwin.tar.gz"
      sha256 "b21dca4477bbd81fd320007794c74dd32a11e31f05c75ac6e3a621410ed98387"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.21.0/sessionwiki-v0.21.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7bc2022df9fd818cf2fdc6d18ecb17ab4a9502a93b2a624b440d5579255904b6"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
