class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.19.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.19.1/sessionwiki-v0.19.1-aarch64-apple-darwin.tar.gz"
      sha256 "94cfc16fb834c863242759635b6ecc688cee1ce1c71f5ed5f254778bafb417ea"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.19.1/sessionwiki-v0.19.1-x86_64-apple-darwin.tar.gz"
      sha256 "80e7a714c49107f462f85b848271fcc7baf60ebbaf4c3c4a94544d83d875292c"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.19.1/sessionwiki-v0.19.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "478a30b4683c54c0b76d91259a0eee58800eb7432a118bbdf78c8ba674922e77"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki", shell_output("#{bin}/sessionwiki --version")
  end
end
