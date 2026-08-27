class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.125.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.125.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "2c99f36849844cb5f2555967f28d359ec68843c5b169f93cbd0f709d427467ec"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.125.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "ccbf3e95bb34b32ea958c776c7152d9365ca9b25dd24367063dafbc482bb8b96"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.125.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "89466541f1d9f39132300969cb38aae75295e79e2c65963b036c9a63df9bd5aa"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.125.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "30796574df5d235325a9edb67a44f12eaf0af144a74e23b316aed5f6c144bac2"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.125.0", shell_output("#{bin}/swapdex --version")
  end
end
