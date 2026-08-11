class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.45.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.45.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "da48acb7d8abbd6f417c21ff811bd7067905508bdd3376e8031071db60d6c0d2"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.45.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "48a062f1ef7fb635a38a5b0dc90abc03ac1c2f5921d1129e8a3f8a054403354f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.45.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b9292bf4add0a9f57f86cfccbeb7fc28455d0b7254e0a0c5613a815682600aeb"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.45.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "33563a8f5dc31aef2364167a1dde0bd3027e454652e35a78ca9d82fc2393ea63"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.45.0", shell_output("#{bin}/swapdex --version")
  end
end
