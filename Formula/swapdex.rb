class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.129.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.129.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "08109022d62f2f1b166c38344500976bd8ef3f45db3e0527e8808db8833598c8"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.129.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "d358fb72ba4821403b7cb30617b62627a3c86fb9b0cfae54be8fa5eb9c36ded9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.129.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "57325f5809ee78e95a5ca4efb104c89542d33858c204090a3c1c3ee1dadc8182"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.129.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c3cf6311f6897f2339492cc245679fb2109b2f9ae04f1357a4583285236d77a5"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.129.0", shell_output("#{bin}/swapdex --version")
  end
end
