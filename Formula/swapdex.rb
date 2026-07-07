class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.14.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.14.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "9be9b82b8af75541e314b4f5abece099be80603c20f401738536a8e9113f75bf"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.14.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "2c52f707573730d1ebd270bf28eed1fff16f948050ab8a0cd39f4f56b8c4d782"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.14.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b2a85a9d0f98c2d72e1a5ac18946ac12473ebdbca7a823c62f0a38cb8c81702a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.14.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0155c0a9d9b9f27a911b67a6a5c3c9e36e422ec39e8053663440086108d7bc3c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.14.0", shell_output("#{bin}/swapdex --version")
  end
end
