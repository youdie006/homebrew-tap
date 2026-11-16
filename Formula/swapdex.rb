class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.40"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.40/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "3789a341ad495e2184820633706168a6b238aa6ee2add43cda9d33786900d6b4"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.40/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "e4773bcb674f21ea6c81ad430cd1485f433a9341846675167a3cb192993d9ba6"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.40/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bb7e55aa369c2b914226a85cef55753296ea2dc2303f2b010249ed33c7f12da5"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.40/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "12c281738eee3b71add190524b2eaa6fc0a5e870abe5b92d6c630f6c1e827c0c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.40", shell_output("#{bin}/swapdex --version")
  end
end
