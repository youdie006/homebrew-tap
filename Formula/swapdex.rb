class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.2/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "6f4124076f1f4b30e49fb5649b2d810c094d5baefedb34857c87c3fc03ba3134"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.2/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "9751c1faf2731f47148d4c60adc5025683c673b69de8301d6c79b20a805d6b1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.2/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ed48105a1f7ed83ef6e8398792d76d856650da1e278c3389b520d160138a47e0"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.2/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2f85ce7a27352fe67c0db389b8e6cc6531801d467595e9d16598dbe9d8577679"
    end
  end

  def install
    bin.install "swapdex"
  end

  test do
    assert_match "swapdex 0.1.2", shell_output("#{bin}/swapdex --version")
  end
end
