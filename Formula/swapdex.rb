class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.19"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.19/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "5a94c32e1ddd90c2949e4d1562d4eef6d671783fa78979b8d43ac83f4313d1cc"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.19/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "d25e0cdb6de9ac1bd013d19dfbd3e11a1cb3ce67134e391ef67c35934f685c92"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.19/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7cf43314ca91eb453ec924c0cc8915d743d629808532ee43fab560987c3cf733"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.19/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5aca9fa9c16fe491376ae3f698431e75c1f7c9695a04dca9858195f2a5ee1b34"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.19", shell_output("#{bin}/swapdex --version")
  end
end
