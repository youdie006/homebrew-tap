class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.19.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.19.3/sessionwiki-v0.19.3-aarch64-apple-darwin.tar.gz"
      sha256 "c68d7ad521370b778b94d16a74ef69f056381d220a52b020430b2806086e99a1"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.19.3/sessionwiki-v0.19.3-x86_64-apple-darwin.tar.gz"
      sha256 "b490818b61478ebe6d53780b977728e180163502b2f290930b9c2dee668f9c29"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.19.3/sessionwiki-v0.19.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b0913d7621d3c586fbd450669672cd3ce879d9a2b6f057ceac2ef534d2efeec0"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
