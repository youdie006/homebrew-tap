class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.47.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.47.2/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "3aea465e3c71d53ebb9e3501a77a73380e23f5975ead42e943f95de7f94a1944"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.47.2/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "4a9855e5e69d721429a12f42ba1f76ab2a67b041075e5b661a9c8c3b22602e8c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.47.2/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cbea0f0d6814a834fdc78d6b6ff0675ddd12d654013a1e9c09d901a2fbb65a19"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.47.2/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c722efc5d890b2e14b30d2ca3f11ebd93ba3a2fac3480a7e866b1640269bd51e"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.47.2", shell_output("#{bin}/swapdex --version")
  end
end
