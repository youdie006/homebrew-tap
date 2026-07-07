class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.9.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.9.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "1cf0fa39595989fd7261cd12e86a917e83a12171701128055a6acf8521bcd2d7"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.9.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "9ea2683d6d20f9d0ea5aa1cada22cd5f6eaccc4e07512c9117055b937bb429c3"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.9.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a2d45feae393002e0ec51c63764eb5474a543ddb3dd880cf3ef2d4b2e69daf09"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.9.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c691859b4d181b6412b41864765a36f574ac21bf37dcb0b237bf38c385be3a03"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.9.0", shell_output("#{bin}/swapdex --version")
  end
end
