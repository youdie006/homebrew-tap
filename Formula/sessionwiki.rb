class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.24/sessionwiki-v0.34.24-aarch64-apple-darwin.tar.gz"
      sha256 "4608a80fc2bc00e49ef1937ca59448a27422b621070e011a0eee9e8b94c31d73"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.24/sessionwiki-v0.34.24-x86_64-apple-darwin.tar.gz"
      sha256 "5778093294c2865e94b2bbf496557ba360834350e9453b522bea132188f88e24"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.24/sessionwiki-v0.34.24-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "44e641598c9150b2e215b7e94e2cb124f72b54a41b6e5a28334d90a1b78c0f5c"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.24", shell_output("#{bin}/sessionwiki --version")
  end
end
