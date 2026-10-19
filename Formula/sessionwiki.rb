class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.5/sessionwiki-v0.34.5-aarch64-apple-darwin.tar.gz"
      sha256 "4b569031a1a62c07783f06ff23c7f0e74e96473d0eeec4895556dd11ad9215b7"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.5/sessionwiki-v0.34.5-x86_64-apple-darwin.tar.gz"
      sha256 "8f1ae070838622cde88b308072ae226d29a9e12f71d6d319dcd60641194f53ca"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.5/sessionwiki-v0.34.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "90a502201fd0b206807939a596ac993586c492cd19d815ad7790191b7319b220"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.5", shell_output("#{bin}/sessionwiki --version")
  end
end
