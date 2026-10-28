class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.29"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.29/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "f4e3cf579f0a91cf0c2b5c35f417822db031918493c6e4e61c4456f279a8853f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.29/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "671f5c408e0b6283ba233ed0e3295793f5a4f8b0e2df7c8734b1a10b10834698"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.29/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0d1761dc192c11813ed1cd8613591f55e69bf43c33dbbc893aa061b429c1f20e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.29/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "03f1101a4b7b68a78392b8f270081d5e2a3e8cfa3210b152b5a59314779eb9a3"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.29", shell_output("#{bin}/swapdex --version")
  end
end
