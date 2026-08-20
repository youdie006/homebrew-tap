class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.24.0/sessionwiki-v0.24.0-aarch64-apple-darwin.tar.gz"
      sha256 "f055c14b7a8bd039ecb19cced61faffe9d3ff38e5d6ea9b93adfea3ded43f71b"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.24.0/sessionwiki-v0.24.0-x86_64-apple-darwin.tar.gz"
      sha256 "4040c78629c1ed970c9f6156c0c39a0f950c166f39a999a9d8876a69b6212b0c"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.24.0/sessionwiki-v0.24.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9ff3b9cbc829a739dcb8db8c9f3ee8b12206419bb24ee10a6784235b9bf6e53a"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
