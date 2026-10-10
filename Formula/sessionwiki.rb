class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.1/sessionwiki-v0.34.1-aarch64-apple-darwin.tar.gz"
      sha256 "3a35eba9a03ff7c4771f6d007ef00172649b5a20f471884ca6bf3cc8a0f08d10"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.1/sessionwiki-v0.34.1-x86_64-apple-darwin.tar.gz"
      sha256 "c173e76117cd32abae7fb3673e3862aa782bec1f15a6126ac0aa04f624118f61"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.1/sessionwiki-v0.34.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "51bda27dd0dec54db9e26b349a3febf6b2bc5e1cfde14e5e6632b03ad2f0fde5"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.1", shell_output("#{bin}/sessionwiki --version")
  end
end
