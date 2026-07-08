class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.17.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.17.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "94abc290b42a4964be6b7977e79130e8fd3eb554b5ac44c5524d7bf5a9fa201b"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.17.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "5f0965bc4fc91ea9f2dfc374deadf54214ea840af357a3548b388e2acf142184"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.17.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "263c695c0d19237e7cb0e6daf4954bc840b127db27c3a1b890646f49bf7f7601"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.17.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "23c15650b28edd762f99973e6fa3888cbc8734d72f27ff92b9985141cc308fd4"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.17.0", shell_output("#{bin}/swapdex --version")
  end
end
