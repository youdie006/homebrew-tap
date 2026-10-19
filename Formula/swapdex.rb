class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.17"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.17/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "0602fdb5a4e74156335276c39618e457372b6e655e0bc7582624120640e4675f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.17/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "6688b214ee33f7d87e55643e88f90c13c77d6a31bac12169c017cf8052ae6f99"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.17/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5fbecd8f9594b67ce993d909c6f0398ebde46dd02bc9c74a83962f1600a81086"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.17/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a3578fb4959f0fc6d268d5c34e850ae8a5f921e4da517af4f6e45b35e2eebac8"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.17", shell_output("#{bin}/swapdex --version")
  end
end
