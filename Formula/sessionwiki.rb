class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.31.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.31.0/sessionwiki-v0.31.0-aarch64-apple-darwin.tar.gz"
      sha256 "e8a8331b51e3fd6f7e11ff8b5e57a674a1b152c3bf7a63a701cc4e66c9f8b7af"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.31.0/sessionwiki-v0.31.0-x86_64-apple-darwin.tar.gz"
      sha256 "86e7812b7f0d76e413febfd2ee4747ea6d3c328c1ca2c7c43bfabc0fe5b23a66"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.31.0/sessionwiki-v0.31.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b2e0fbee573ca633f80041646ad5a1f06076414ccaf20317bf3495a34290105b"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.31.0", shell_output("#{bin}/sessionwiki --version")
  end
end
