class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.22.0/sessionwiki-v0.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "90385a1cdec9397cdf0038be3cb7bfa52a57318731c2592de31228db8a222f9d"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.22.0/sessionwiki-v0.22.0-x86_64-apple-darwin.tar.gz"
      sha256 "8da212fa84518ba6f5b38be17c0cfa4331cc9e6b681217f13a8849d186af4976"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.22.0/sessionwiki-v0.22.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "998f4d80cc869f4bc0be3f9a8f9868b06ca6d820dea22108761be84ffb2845f2"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
