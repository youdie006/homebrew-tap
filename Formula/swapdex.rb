class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.127.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.127.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "4d0445184d17572811df3ffb2a583d865e5ac11c63d0d30233c0ce01d8544558"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.127.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "1a544fe64d568e1a69977acd4ee0df1032af8b89da1a9ebb2cdab7a7859486a0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.127.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0735f919a07289e58f912b993a0bada090f4e3c9a601634576d904bd91666e0f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.127.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1a0f0e562f5e0e6bada14980f44efe8a9557010d28bc3fc3f1ea7f2cfecff607"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.127.0", shell_output("#{bin}/swapdex --version")
  end
end
