class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.62.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.62.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "e6427db1e543672ddc49f5bd016a162ae5ee2896398dcf57b201aa208a6037ca"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.62.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "45c6f33bc2e405edcf983e88f34caf870a4fd11be04257fc13741b806bc01f7d"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.62.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c77dff755d8740470b0affd630a8b16a31b45a1e7d02cb3ce2be68fb898c2452"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.62.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "76811b3b60bd99183763b5f2b4edcebceec9cd3156c3e7ff72720ac7f8ad7509"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.62.0", shell_output("#{bin}/swapdex --version")
  end
end
