class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.39.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.39.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "b1a5d531d7099356bc6222a470e5bdd995b0430eb805f5562fc43c3d823baf07"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.39.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "53550afba76b2dcbc1e3dd457cb4e78b7c265298a2af4b39b94a3625c3b4d077"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.39.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0804db91cf7543fa10bcf5ef9a95f0d64eb3d798cd681e9ea2b7c1605f69b6a5"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.39.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4931b16f0d1b766753e2d77a57c0b00f67ee8734b49f72005d78b53ad6103114"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.39.0", shell_output("#{bin}/swapdex --version")
  end
end
