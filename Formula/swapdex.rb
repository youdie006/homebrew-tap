class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.24.4"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.4/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "84dec2ca22ed0fc9b4db640950575d8a6691fc72a83904d5161e3ea23c4a6cff"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.4/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "d62a7398182d3bf19e206d5df31c228f9ec0d292e31997194ed4b9717e7fdce7"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.4/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bef825d974f2a04b0a203e2fa9ca9f9902cb5c8b466c8a1b521a4c2ee54fb2a7"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.4/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3e8f3a30e99cde8808d71dcbb858efd762055132249f952fc38815b7d7f36e4a"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.24.4", shell_output("#{bin}/swapdex --version")
  end
end
