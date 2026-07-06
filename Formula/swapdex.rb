class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.4.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.4.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "5be78c798660bc3a9daf401ad260f78b4dfacb1b00a0c631f20ff2a59d5a6ab4"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.4.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "bb6fcd68898da80ecf708b559ad9bc57b6974fe6ed08c81142533767df948821"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.4.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5112d37f5b6c711277dd47a9c862792ae010f4324f366db3120251d95f8359be"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.4.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8c08e08ecfbdec0f405c526377f848183d1168d89502d0752a88d49191d0287e"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.4.0", shell_output("#{bin}/swapdex --version")
  end
end
