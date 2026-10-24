class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.10/sessionwiki-v0.34.10-aarch64-apple-darwin.tar.gz"
      sha256 "b361b4ac2cbd2c9df642d2e665535b56c3619b2da587f85de07a6680c9f02b0b"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.10/sessionwiki-v0.34.10-x86_64-apple-darwin.tar.gz"
      sha256 "c16960acc484986b36b5482d97b240047c553d20f2f613edb80c89089ece313f"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.10/sessionwiki-v0.34.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6eddc3b724b3bd7e0b9786cae28c383002cb890ba44f604784371a344609345d"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.10", shell_output("#{bin}/sessionwiki --version")
  end
end
