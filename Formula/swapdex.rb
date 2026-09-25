class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "225c28b2c12e342cdd2b02e2b777f45bdd329eeaa95abc780268765b2156691d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "94de8d6da85686edcdedcba3a87d069bc7463064cbdda6ea07e671c052d6832e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4c31ba170fd76c4293a40be7b9b6efaf060f09769424a79e00a9e23375e40088"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f41c6ab2d2d77326236f0cf06b7320768184bca246e534102adc61bb47e758dd"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.1", shell_output("#{bin}/swapdex --version")
  end
end
