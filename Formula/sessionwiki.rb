class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.0/sessionwiki-v0.34.0-aarch64-apple-darwin.tar.gz"
      sha256 "bcb5650bb2accb1173eefd7939bafbd58cb6fbb8d2f50c8c856ea2fd3a4f557e"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.0/sessionwiki-v0.34.0-x86_64-apple-darwin.tar.gz"
      sha256 "ae6d61735f914b2462f4d323ca758045e2218540c36348fa59f47a3079db0640"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.0/sessionwiki-v0.34.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7a4bef73e6c409b2eb06fcdf7569dfcae1a459e86bfa01d73dbded5431a33924"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.0", shell_output("#{bin}/sessionwiki --version")
  end
end
