class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.17.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.17.2/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "c83f173b6010bc300ec945af1bc4ddfd433bb2b20c80ad99d2b757815e3c981d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.17.2/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "56e1b2c18f13dfa75d0b1c81cb929a7d40d13b93a88238376e15e7f879510aa3"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.17.2/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "345f5b96b543f0913dfa93641e354d9f68bde335d8515a19c38e425fb43f4ffb"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.17.2/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0077bf3a91f6d88b5dcb6c446eaef6d79ecb8029b5ab6a3c55b102dfda5deeef"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.17.2", shell_output("#{bin}/swapdex --version")
  end
end
