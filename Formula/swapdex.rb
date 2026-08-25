class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.99.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.99.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "96f93042d1142febc429a0d3dfb4967fe4ab86dc0235e86a1cf5ef7fddf8267a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.99.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "e8c5d60b8b00e1c5494facec914e07053f4d09a81ff50b1781d42cd52bfa5aef"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.99.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2ad0b25a017cd8512a3517582f18300067cdf3c042971777ff0bdf604fc12eb3"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.99.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fb9ced5aeb8650f6876fd495ed6b912939ed30c0b55ee0153f839d4ba941595e"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.99.0", shell_output("#{bin}/swapdex --version")
  end
end
