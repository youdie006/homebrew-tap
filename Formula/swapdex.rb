class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.16"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.16/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "c60adedc359a92ce6716689839e6c25f457bf11ae5738487450d8efb036b9395"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.16/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "db50aaf5b07988d1bd341e20f635106beb2b804c76a2b6c6c34c4a3872d53181"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.16/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8e5645a3427324fe91fc071a5955f8f8bf979568a59de7ce20ec6e0020556751"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.16/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "65eb5c4c7b64d1ae2eb751b8351a567ffc30d8dd5ab7e9d316d9c6a09d20f64c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.16", shell_output("#{bin}/swapdex --version")
  end
end
