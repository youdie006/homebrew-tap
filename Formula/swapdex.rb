class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.33.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.33.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "9684f570cca0ce555301bab44e691ac8b69f6b074368f0d192f956728a66dc28"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.33.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "b08f947d73b4aa4d0811eed693ea8b7e469a36c36f69cc72c5cf5d9547fd56ec"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.33.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8fcd0a8410c784b383015f418893162bdd3220009adefbe119a2647466c89736"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.33.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a839b26faf52dc55323afa433fa40b4ce9d6f3d513e85b5fa87abeea49ffe620"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.33.0", shell_output("#{bin}/swapdex --version")
  end
end
