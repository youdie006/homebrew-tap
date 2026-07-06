class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.1.5"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.5/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "0128c9d468a44360488ab31a171e49e1c82241d646b20a0659174c1c648a0b9d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.5/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "ce4526f5f6c98715afbc8488dce96af758f6382af22b17bd2e87590645a6ddc9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.5/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0ae521661e1a5680d34a23df064d38c079b3026171100faca4809ade2d774d38"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.5/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "02aee27228b95cbeb5237a34b0a83d71320847a8b6d0609e2e423215b62491f8"
    end
  end
  def install
    bin.install "swapdex"
  end
  test do
    assert_match "swapdex 0.1.5", shell_output("#{bin}/swapdex --version")
  end
end
