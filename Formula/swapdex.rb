class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.152.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.152.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "47569ef332a62c9078bf4a21dddf40524ef5475c9a91dacbc062253782cd9b91"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.152.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "9d247c80f952a9985055b6c67434cf027599afc3a982c3e76bc97aa237a08162"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.152.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "185b0af3f96a4f8789fe58c6a0c40e4550f6ecc8ba8ab88736b9401c540082cb"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.152.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "21a8363e16d9d895e4cbe43732e1688ce43b327389cd48e3418581abbe07d7b2"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.152.0", shell_output("#{bin}/swapdex --version")
  end
end
