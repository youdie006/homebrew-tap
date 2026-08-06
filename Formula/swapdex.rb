class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.35.5"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.5/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "e458f5d7cb78b002602938e09816d083cc5eaecea89bdb45995326c6cbb33e0b"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.5/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "15e012daaf6c047a715078efa5eb90683091771801f68f25b14bc41c80e80a98"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.5/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3bbd0fe4444108df0fcb9ca64f16cf456f9491f710c4e01efa9dc28bdb99ba22"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.5/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9bf7e7a09d13c6cc449219fcfce46933b81ed795ba81fe56e84628aec5f5269b"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.35.5", shell_output("#{bin}/swapdex --version")
  end
end
