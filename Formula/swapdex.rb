class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.8"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.8/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "6a809a99527ec4aedca444cbb5576c3d5c6e5abce6643c19c77869ab8b8d02e8"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.8/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "f3ca06f6b53c955d61303318bab636a89eef96acc07dddb52024874071bf0d33"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.8/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "832d8516cc958e52da64cb2da0eff748dc2fdbfc8f51e9fbe6f31b38a92e0202"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.8/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2d5cfd4669d4ebf67c4dc7aebf204ffdcde20d277945e4dd8adf7ed0cb319cf1"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.8", shell_output("#{bin}/swapdex --version")
  end
end
