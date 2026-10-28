class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.21/sessionwiki-v0.34.21-aarch64-apple-darwin.tar.gz"
      sha256 "95ecfa5449ea23fd8e00f47bc6a5220a6185f4e8b88f8b548a5ad702764ecf9e"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.21/sessionwiki-v0.34.21-x86_64-apple-darwin.tar.gz"
      sha256 "e2ad6199d3cf77f4ce45525b5552fc5cf5cc5ed321a14c6c32f0aa4c916c82c7"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.21/sessionwiki-v0.34.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0f70aa807ce1cc72af89b3c5a3113f4781b54b1b1f4335bb8cd085d679bbec08"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.21", shell_output("#{bin}/sessionwiki --version")
  end
end
