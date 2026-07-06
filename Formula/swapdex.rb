class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.1.8"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.8/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "df7c9043cd48c359e2835729e00531b1b88cee89d849b2e0f31a8116563353e9"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.8/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "80cf3e2c81fd3d83fdb4fe63c122bab1b6daeec00e7481e9620f9cb66d95166e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.8/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "84ba41e8419edda01baa32e9f9b86ebbd63d0ac4c4a55f3260793b60140090ee"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.8/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "79b847bc86a12078abe02f0d608a1977323c51175f152e299da028bde27c65dd"
    end
  end
  def install
    bin.install "swapdex"
  end
  test do
    assert_match "swapdex 0.1.8", shell_output("#{bin}/swapdex --version")
  end
end
