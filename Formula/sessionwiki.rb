class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.11/sessionwiki-v0.34.11-aarch64-apple-darwin.tar.gz"
      sha256 "e7dbbd8af6035badea4f984afa5b67967574d65fa623c9a313b6ae932741939c"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.11/sessionwiki-v0.34.11-x86_64-apple-darwin.tar.gz"
      sha256 "1e461652fa1f4ac36a75963ea07fd37d792af4687982d6d4cd701cb1ad6a404e"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.11/sessionwiki-v0.34.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "604bfb1bebe8fb8f603fddf36df85637f9de226dab9ed701c9e2ddba7b7c55ea"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.11", shell_output("#{bin}/sessionwiki --version")
  end
end
