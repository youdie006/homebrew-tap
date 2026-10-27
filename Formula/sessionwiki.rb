class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.17/sessionwiki-v0.34.17-aarch64-apple-darwin.tar.gz"
      sha256 "f4ad6d48dee0bdcf99e62c88f3c16067cc10fc93997f8bee6be6715fc0d247da"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.17/sessionwiki-v0.34.17-x86_64-apple-darwin.tar.gz"
      sha256 "4b761a860dfea96a3353066d98c0f119415c7f9d570b6ed1f13978c6d7afaa18"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.17/sessionwiki-v0.34.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6f3093ca6ca5a7cc3d38a6479aa48ebc6992201d5336d5daac3818f2dcb40120"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.17", shell_output("#{bin}/sessionwiki --version")
  end
end
