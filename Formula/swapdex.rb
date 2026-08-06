class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.35.6"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.6/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "c6c78b929407abfa1cd19e589664783bf886ceef08ff7575449ac8f159f55b2c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.6/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "21980ad8c7588e3c2b4a36370003f56cc7ff934475cd0cfcaaf9bfe8343dcb7c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.6/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4848e65ef7a65ff132644240e544bbf8af5e1c2113e5df995104f58e67b64990"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.6/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9ac14de22e5ba810ecac9d0bb01403c72b72a6b4f5bb0a7a0f710002bc76e87c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.35.6", shell_output("#{bin}/swapdex --version")
  end
end
