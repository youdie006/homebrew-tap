class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.165.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "dcc68a8a9757e84bd25701e9f14d415fa71266e130f096eab2f56a1b78616964"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "ddcb00705adc74bbe902936364a5cfa6fc1997c74a797d586686e872bb8f2d23"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "74ade4212bea4999be0d16c9569477c503d963c1c855a28443a0e6c52a24bc5c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "44a2b42f4d9806ad9dc1614ecfe3542181fa436fe8ee697473aff88016a8ad88"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.165.0", shell_output("#{bin}/swapdex --version")
  end
end
