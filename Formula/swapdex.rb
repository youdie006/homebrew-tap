class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.9"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.9/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "5446f78628b6755a6a664c88794ac871d28073d787336894b292f7b552bd687b"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.9/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "768ad682ad3942357c0aa46e2e7370354e74b478247628b76236334848d2d0cc"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.9/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "93424cdf04ee57df0d6193d849970abd7a1f786f476c410a7c5bd742da1043a9"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.9/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "83bd36db6ee0862961de473b030bbe2be47104e94277df8556436eaebca81921"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.9", shell_output("#{bin}/swapdex --version")
  end
end
