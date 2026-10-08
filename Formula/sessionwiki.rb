class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.33.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.33.2/sessionwiki-v0.33.2-aarch64-apple-darwin.tar.gz"
      sha256 "495d9adb14b33de502492a92b0f54b403c22ebf75a45d2fde496d67d36f8c065"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.33.2/sessionwiki-v0.33.2-x86_64-apple-darwin.tar.gz"
      sha256 "8b506310fd9e03d25a041e6035e50270a84265e8df2582c1675e07b1f714d559"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.33.2/sessionwiki-v0.33.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "413c526680550b46b950df69f5ddd47b31359e17f43b0649e0a7b2182fcf2586"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.33.2", shell_output("#{bin}/sessionwiki --version")
  end
end
