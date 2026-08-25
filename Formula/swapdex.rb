class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.98.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.98.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "b7f0d2a94cbb5c32dc64961ea634545b145f37f198c556f5313bd83acea97c58"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.98.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "bbb43d27c7238f9d59162094b6c7bae437f917c57ca95b89992df189c67c1e01"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.98.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3449378687151e5a5e2a9fe883ebaf049af263bba6c754efa6fffff2ae4aa38d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.98.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "959e0c05725de4adde5deadd041da1a38c4fa779a35b79f99db27cc1f2a52d03"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.98.0", shell_output("#{bin}/swapdex --version")
  end
end
