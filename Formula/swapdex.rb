class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, and Gemini CLI login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.5.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.5.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "02846c14adcf6a912f4028e8615c6be3bddb7399e39847973968db1a8e80f8df"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.5.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "4fddc30e7ca716ad8e325f5e6131847e32a16b0da18f0aae10f1cb5ec38d8e53"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.5.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f6b4ec7a35d31780d37fd743a55edd92b4963ffb49d17e298ba0cbc45903efba"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.5.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "41e4c047df72a612502124b1a50f5b9de95563b7097b0c3c5953823d7d67fcf0"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.5.0", shell_output("#{bin}/swapdex --version")
  end
end
