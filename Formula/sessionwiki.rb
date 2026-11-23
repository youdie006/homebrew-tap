class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.25/sessionwiki-v0.34.25-aarch64-apple-darwin.tar.gz"
      sha256 "7289efe6d05ab7aa33d225d484386b0f2f47ea251645181ed328ed0f115d6cd8"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.25/sessionwiki-v0.34.25-x86_64-apple-darwin.tar.gz"
      sha256 "47cf66482d5461bafa181b11cad44619e1f18d9dc0a8dc961870d297dcbd8130"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.25/sessionwiki-v0.34.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "77c566908d347ad57ecd34c5d99deb2bf89f7a9257376a4937c15acd2240ac81"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.25", shell_output("#{bin}/sessionwiki --version")
  end
end
