class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.34.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.34.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "3314ca6ea5d30b3781c72126f241979b44d1bf161e2730a61d0a3867571d2a4e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.34.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "58c56bb1455c16ad1fcb5d28bfaa76ab0edc74f401fef13bbad4ee1a8c47d651"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.34.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4be9b876ac06c4c9bc569967df6e2beb1187557be7cff60cabd79241fb317708"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.34.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "949e9548d96b0d8fdf09bc50a7aef3d9bef06a30888acf7e9d249b5e9abcf1cc"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.34.1", shell_output("#{bin}/swapdex --version")
  end
end
