class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.13/sessionwiki-v0.34.13-aarch64-apple-darwin.tar.gz"
      sha256 "828a66d4ccf755e81b56d96519aa76161564bcc2240f66ff5e7b08ce710bc48c"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.13/sessionwiki-v0.34.13-x86_64-apple-darwin.tar.gz"
      sha256 "45311ea7d2b7b7edb6c0030b808e7a42b407f3672a2b1970a8a2a9feb5d94276"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.13/sessionwiki-v0.34.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "19588985097613add14c99ec79347214e88fe47afd02a142d6f3b554053c01eb"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.13", shell_output("#{bin}/sessionwiki --version")
  end
end
