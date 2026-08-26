class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.109.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.109.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "f92d9afb7e207ad51bf193d767f8d781bd05d4e316dd821317cab6d7f7634e1c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.109.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "de6350553fde657e308f42389d4891bf07f57cb31ac90ccdf3fc5c1606004388"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.109.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1bd4f2d83ed42a3dbad91ccce1bfee512e0f1f10d77b8ddc8f1e8ae000d925bd"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.109.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6a46a89caf2c738d50829383edf383b602240c337cac240ba4aeb0278d55b6b6"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.109.0", shell_output("#{bin}/swapdex --version")
  end
end
