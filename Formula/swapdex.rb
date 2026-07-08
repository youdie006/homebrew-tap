class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.16.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "63fd92f328a100bb8f5dc026c73988769f47d63d5343ed469a2465e03b0fb759"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "223ebe22a90e8dba51043c91813c3543eb4273e8d86f726d56b4c79b82068e92"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "33385fb6f27723f87b10a0a06d09b4610c97fe11a36e253b1e19a324c24473c8"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "35ceafa67e0f74d8dad1cd518f953af788a712ccd17c4993bd6b6b5099bba68a"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.16.1", shell_output("#{bin}/swapdex --version")
  end
end
