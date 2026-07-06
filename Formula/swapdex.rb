class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.2.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.2.2/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "38f1610f9729d4f1ceac48f56efcf5e8412d251f3cb5e04d5cc76e71e5cb552b"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.2.2/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "6df548afee17c73ec1f406a267fcb5228560f6c0573ed782787e6232cffd9133"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.2.2/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7efbe1b206d1b4f01412b425940de22c9019ca7974eae9e9db847a9494cc4bf9"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.2.2/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b88f14f591e8f2e1e1f3794607b03030acabc801cf06f5e59a2cc9b6d9ee6202"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.2.2", shell_output("#{bin}/swapdex --version")
  end
end
