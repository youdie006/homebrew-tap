class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.9.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.9.2/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "2a9524ae10103e186ce9e664cdaefe2ca76b2747ca7a19cce5486efb553d74be"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.9.2/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "5895aa9c581b6db8d71e78683705b32728b6c3c8a5db28e35ea89bb2800eb74c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.9.2/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1dc1ac2f26e3ee28af558ab6cf85df48d192cd2d5fcc7e8fd7a49a0677d8ade2"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.9.2/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "77017acd6fb634c86515f647b22eaf8138d1dea66c0a019981a0d66b407cad49"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.9.2", shell_output("#{bin}/swapdex --version")
  end
end
