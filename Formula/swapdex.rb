class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.155.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.155.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "195ee2c0f9cad0706a767e99d7c983f6d7572ca87994257a85528d319f705459"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.155.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "dc7d6db9ab3364de4899fb649f5cf047d3179afd6ee8a78f996b2347f5636085"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.155.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "618946698222933874d1ba9167971dc69ea5a3eee06902bff31fe7ccc5264d5d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.155.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a3a55f8af6f6c259ba1ca9236c2a1c5ce743e68deb6c1544253fa87a81e9ff9b"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.155.0", shell_output("#{bin}/swapdex --version")
  end
end
