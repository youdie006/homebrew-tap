class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.22.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.22.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "aa314df2cf8f2ff46475768d44f9c0c15fe22de307362a817911bd4ea1c23062"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.22.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "4d667a0287bb3f01f8867488dbffba4b1727c9e5916b5ec3c39bb890ecd1e595"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.22.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b44602c974d6afe85fb9e82c8db496f0f89f7ee30184e70f3b252fa7d18d616a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.22.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "76161097420759bfdf99ba385933627c5fbf412c2f4856064ebe25b440ab516b"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.22.0", shell_output("#{bin}/swapdex --version")
  end
end
