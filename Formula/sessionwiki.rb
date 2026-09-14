class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.28.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.28.0/sessionwiki-v0.28.0-aarch64-apple-darwin.tar.gz"
      sha256 "1d844ae1582ab2e872f9d7af97836359362df69a8262a5007de3156fa0e5a455"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.28.0/sessionwiki-v0.28.0-x86_64-apple-darwin.tar.gz"
      sha256 "00b3111697146f07ebbd0e35ee3bab402a79a9a0cc8bc58be7d215515335faea"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.28.0/sessionwiki-v0.28.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "69e5135ced7c6a580b330e54e03970d401a7c093ae6160a08a0cc784b8301e84"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.28.0", shell_output("#{bin}/sessionwiki --version")
  end
end
