class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.33.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.33.0/sessionwiki-v0.33.0-aarch64-apple-darwin.tar.gz"
      sha256 "b9a09a820ef3d6de35c4a59bd042d25aa88373c350c0968715cb6f6dbd8eb0e1"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.33.0/sessionwiki-v0.33.0-x86_64-apple-darwin.tar.gz"
      sha256 "c4c2531f21d383813743918af69764c2a5cd0ae14ec6972be7bd550194256cd0"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.33.0/sessionwiki-v0.33.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d49958bb8f34c88a7d5ee27e5644e0801a941585e1b5e9ff60be725241637967"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.33.0", shell_output("#{bin}/sessionwiki --version")
  end
end
