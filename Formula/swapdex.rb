class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.14"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.14/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "952eae6e2c642084bbef59838f3fc16b991302fe1b2269387f8261084b0eedb6"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.14/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "1d1757ca402318d2ed848ea147cae23fdfb9c323a9ad971d1c04a8962d2b1020"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.14/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9b13ecc10bee8000d846bb0376a86012dac8f825b33f5b06c3038c5729ac0a57"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.14/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5427b4bb9afef560f437c52fa6b9a42041b4830781919a8bfda49b980b53ba45"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.14", shell_output("#{bin}/swapdex --version")
  end
end
