class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.61.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.61.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a656805f88d723f06cbb740b4a23846eb7e2ed93df1915e35ce028ac8e0b4140"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.61.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "e9bfce72a56bf2d970a43960d4700d475245ede324dca1362de536a7bf1f4343"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.61.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "31ecc78933ff3649799fe0862299aabde8767f4ba223bcf394ea41da1816220e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.61.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "28d5b0a1334839b679b6d3e11ff5ada7aac6db24d53f704ab6f2f9c93a7cc096"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.61.0", shell_output("#{bin}/swapdex --version")
  end
end
