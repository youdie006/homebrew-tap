class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.19.0/sessionwiki-v0.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "750cc38070761edb40defcb97e4527980ba8291e3592920335b61a6ac73b4979"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.19.0/sessionwiki-v0.19.0-x86_64-apple-darwin.tar.gz"
      sha256 "548bcfb45a44ba53edc419bb0b85d649bf6474c9e6a64a2bfcad35d4970f7534"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.19.0/sessionwiki-v0.19.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "04130a132d852fdd69d1651611aa1002895afa9dd4cccd19d0d1d42ef9950609"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
