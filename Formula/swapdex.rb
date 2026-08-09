class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.40.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.40.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "66ed52f4c9b0434462bc0bf73ed45896ec710117944abe1e8c46c9d1440009b8"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.40.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "7e49850b168910aa91c5c5b9656e5aa5621fc2a1ae4ea612c2edb64cd25b5cab"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.40.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "da95893e5143747171cb52fc49dad9d02378f251e0e27c0d23c01a7ce19fbad3"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.40.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "040072ff117dfb39da59f8f2e3da22232865a34810ae6b1b1efd5559ae0dc98c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.40.0", shell_output("#{bin}/swapdex --version")
  end
end
