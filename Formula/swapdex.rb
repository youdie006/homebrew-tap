class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.3"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.3/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "96e6d0a5895b523d13ff9d255a367468f1a35d50565855d8e0d23b6f4aa1f14f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.3/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "a26e52f6abd30ebc6e3d5029748a9cb1d20574fade506cc3ab34ccb8e33ad09d"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.3/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c4da1265c3e57322092e12998428e136150adc2570d52b9280f8704f1cfafc44"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.3/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "826f0048a932b0de93716fac00e3f1d33ed2f0fd87cf90ddda4191222844e819"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.3", shell_output("#{bin}/swapdex --version")
  end
end
