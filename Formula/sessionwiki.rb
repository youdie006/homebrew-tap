class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.32.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.32.0/sessionwiki-v0.32.0-aarch64-apple-darwin.tar.gz"
      sha256 "d7c27ba50f26436c2c2fda3da04f893cd96b61182f07e21f87b9a4c0970aecbc"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.32.0/sessionwiki-v0.32.0-x86_64-apple-darwin.tar.gz"
      sha256 "9ab794a5c4369b6022ad8ea44d7c00482ba73acecbdba480ae7a26fbed23c788"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.32.0/sessionwiki-v0.32.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "963e1ae01678117dfca5af2c329a784b1ce5793fd09978ee0a872ef54e036b5c"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.32.0", shell_output("#{bin}/sessionwiki --version")
  end
end
