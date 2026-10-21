class Sessionwiki < Formula
  desc "Find, search, and resume every AI coding session on your machine"
  homepage "https://github.com/youdie006/sessionwiki"
  version "0.34.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.9/sessionwiki-v0.34.9-aarch64-apple-darwin.tar.gz"
      sha256 "b76cc9f968d63956ef42e1856d0d4eca0dea1b7139b829e7408bb02d99f09cef"
    else
      url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.9/sessionwiki-v0.34.9-x86_64-apple-darwin.tar.gz"
      sha256 "c236a2f0630e4f3138c98fd903944153d7fb0c52d2b992898db8d78387fa05d3"
    end
  end

  on_linux do
    url "https://github.com/youdie006/sessionwiki/releases/download/v0.34.9/sessionwiki-v0.34.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "25957724a15b3aa87ffc4c961b0a5e320d4ac47f7ac2b1ffde7008e9ea585c13"
  end

  def install
    bin.install "sessionwiki"
  end

  test do
    assert_match "sessionwiki 0.34.9", shell_output("#{bin}/sessionwiki --version")
  end
end
