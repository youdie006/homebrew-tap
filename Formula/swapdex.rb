class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.139.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.139.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "9bce724b297deac06bdb6f8179e4c765691ca365cfac29d1bf2a68b3b2d24dc4"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.139.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "c9c60164af84cc22d3371998926b383ffae0fadc47f008c652a5daa901981e18"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.139.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6efa49b9f10c16b9527f84edb3bff6a67d711067994957071284393b4496b714"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.139.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2a14cd627e4fc9e3b1732185e670b5eb4a3031f2ad9cd6b98d6789aaa3343398"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.139.0", shell_output("#{bin}/swapdex --version")
  end
end
