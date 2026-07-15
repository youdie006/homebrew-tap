class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.20.0/sessionwiki-v0.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "3757df0ba656535c2cdc0bfc80e0cd43d8ac31efc13679ac7d925f465f881d1f"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.20.0/sessionwiki-v0.20.0-x86_64-apple-darwin.tar.gz"
      sha256 "f49f62bb11170848268055082548cc567d6e100d1807a40cb1648be92883cc7f"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.20.0/sessionwiki-v0.20.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "af99f0c0ce967645fe7f9d88444b31c766296bc044fa634750674bba771900f6"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
