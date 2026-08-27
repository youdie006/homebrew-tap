class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.113.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.113.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "41e6d68588597f3b108b3318b329b0fc67a25c0375c8c1ad9aa3102074c7f49a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.113.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "eefae6d7706c4cc49fcc2f1c30de1e219000d66bdebc5ecf2b8cc74536af90fd"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.113.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a446d7b66b4ff15094af027e103c232a0c883f404ec94bd110084f9ee1cd3186"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.113.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c4b4cd3c88950caaa6be568937ae41c3e10fa1f40b5ad68a1925d7e4c6222f88"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.113.0", shell_output("#{bin}/swapdex --version")
  end
end
