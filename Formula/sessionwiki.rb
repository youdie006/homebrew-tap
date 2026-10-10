class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.2/sessionwiki-v0.34.2-aarch64-apple-darwin.tar.gz"
      sha256 "4e2e47e4801cf22d6cb316041770614f2dd0c44bab14f38eb94197b2b9ccea47"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.2/sessionwiki-v0.34.2-x86_64-apple-darwin.tar.gz"
      sha256 "9e6760856c415a97a12dd83d284368d7165b79e6e107fc4962b3cdc25129e3bd"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.2/sessionwiki-v0.34.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "de039853884b241da2b2ec383133856354702333d0f67f56ff08e81bd974c335"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.2", shell_output("#{bin}/sessionwiki --version")
  end
end
