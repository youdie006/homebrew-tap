class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.8/sessionwiki-v0.34.8-aarch64-apple-darwin.tar.gz"
      sha256 "54800cc2dad61af730c3fc00842fb53e314447b955dc9ca466600d5058a77360"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.8/sessionwiki-v0.34.8-x86_64-apple-darwin.tar.gz"
      sha256 "ed2cf7754624fea76300dc81bc1462c1728c9d06864e8997b4bf92bcc4f95e51"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.8/sessionwiki-v0.34.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b57fd914310c2b83ca013c1b0bf6ff007fed80cc88a5d3e3ce55faa81873894f"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.8", shell_output("#{bin}/sessionwiki --version")
  end
end
