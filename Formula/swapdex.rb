class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.39.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.39.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "434d312f3715af6d23cf44afa5d143cb22cbc7ac10964ff30bb86bd5292f8a45"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.39.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "29ac1d47c987762119fdcc266a6fa75fdad4b92f6e55988db62de3f1007bd532"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.39.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8ed040f3d6c4dd75e9c3485bc864f14f911951d71613ce1f9797dff539aeea76"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.39.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6a0d4178939e3e39f462b18cb30aa6b9cdafe024ea450ee81e2ed20eafe89fe4"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.39.1", shell_output("#{bin}/swapdex --version")
  end
end
