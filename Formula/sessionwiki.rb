class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.27.0/sessionwiki-v0.27.0-aarch64-apple-darwin.tar.gz"
      sha256 "fda24dd17da26afa01abae5e70ba0b2753da7dc1d0b1140cb0f7e595e7b208bb"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.27.0/sessionwiki-v0.27.0-x86_64-apple-darwin.tar.gz"
      sha256 "0b952562e16c7f84a87600fe37c2e56df3dabeed4b98ab2804a3d13b7b42c997"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.27.0/sessionwiki-v0.27.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b5f9c3984a5cc00ba8e035da31c3ed29893f0f681f467233d49fd4e254f29838"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
