class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.18.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.18.1/sessionwiki-v0.18.1-aarch64-apple-darwin.tar.gz"
      sha256 "ce22443fe897822e6298f6f4ce80141341fb349c173de4f78bede34994d475b4"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.18.1/sessionwiki-v0.18.1-x86_64-apple-darwin.tar.gz"
      sha256 "860bfbf9b8e8ad6016bb38b429bfe822b3b8a2468e152bc7a856ca4f8745503a"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.18.1/sessionwiki-v0.18.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c917ea93dafdebf71e4da35a736cb83ead24e7e76b2cef49f6e484a5b297df42"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
