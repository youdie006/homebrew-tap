class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.35.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "575b9db57c079444f25f78186244b3563d2e3635b70e209597a259074dfec43a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "96c18b74759504497a01f8c0092fc8c940eecd3e347f694b281ee50329e3f05b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "114fc40264adca99a9f240107509e3fdddafc40565fffc0913e73eac9cb62b88"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b8bb20b9d8f18ace8cc119f45f73200ddc30fd210d0b35e9eef1d23a44823dbc"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.35.0", shell_output("#{bin}/swapdex --version")
  end
end
