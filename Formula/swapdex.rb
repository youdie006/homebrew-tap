class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.97.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.97.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "81b7d94e94aef42ec243cc15a26449a15d61a8ec7f5731e40134dd3eb171b1a7"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.97.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "90e432dead0dc5ce7cf31b3db1ec29dd5d39d19938b5e58f806d43215a220180"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.97.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ed23ec46626850e5e6480839bc731aa9074fcaa255bd2adad045f570c84bb760"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.97.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "47406e1f403af2c2413b4f75bed0c803eba776fc682c925bfed9a13296d35b3f"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.97.0", shell_output("#{bin}/swapdex --version")
  end
end
