class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.6/sessionwiki-v0.34.6-aarch64-apple-darwin.tar.gz"
      sha256 "1edc37bccbbc7aebbccbd7c74001e0840a6bbc438519c2c356562a2a9f5f306d"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.6/sessionwiki-v0.34.6-x86_64-apple-darwin.tar.gz"
      sha256 "df76a0fce57f57ff143722f564b0fe8f3f744a41afd588d976089d872a7be359"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.6/sessionwiki-v0.34.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fddfa873643126f1f80832f7a6a6be2cad95b3fe6539e8418b165787fd5db7c3"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.6", shell_output("#{bin}/sessionwiki --version")
  end
end
