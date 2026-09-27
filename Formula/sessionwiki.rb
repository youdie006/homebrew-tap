class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.30.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.30.0/sessionwiki-v0.30.0-aarch64-apple-darwin.tar.gz"
      sha256 "b8f941c5d00b9864ce53e11da9b7704395b7889f411c19585a5c4dfe2fea3a73"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.30.0/sessionwiki-v0.30.0-x86_64-apple-darwin.tar.gz"
      sha256 "a86bbc5669144410551cb2ea069fee932fe16749aa52ce93534c900798a88139"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.30.0/sessionwiki-v0.30.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fc851140085cb7d26941a83630b5a4f34671b206037564f56f44f362962078b0"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.30.0", shell_output("#{bin}/sessionwiki --version")
  end
end
