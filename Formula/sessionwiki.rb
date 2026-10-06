class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.30.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.30.2/sessionwiki-v0.30.2-aarch64-apple-darwin.tar.gz"
      sha256 "736b028a9947b2c1cc511c362cb2bf9e83d9fcc7920c5caf285aac962148665f"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.30.2/sessionwiki-v0.30.2-x86_64-apple-darwin.tar.gz"
      sha256 "a365ba60c391ba9ab77584b3ac3a8b45025a2d1ba17b74012d7f4fe24cc1a9cd"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.30.2/sessionwiki-v0.30.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "948990eb8f7d04ae59b08b344e7d883646c08511ff30ceb63ae1133bfb047cd2"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.30.2", shell_output("#{bin}/sessionwiki --version")
  end
end
