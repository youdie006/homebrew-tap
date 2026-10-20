class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.21"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.21/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "0b6be71889fca506d3c33392138fa66e716368c82e13e933486933d9017d9d83"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.21/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "6465fa94b4c50396836d25f5268b2c182db85589f5512e104ee1d42b353977cb"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.21/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9df9da2e0bfb4b255ebfe870c5cfc55042e1179bea9753e7f784843f5d8794dd"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.21/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "329a9a7fe0464023510de116acf48309ae7b731f26f25dd90bdef41f539dda37"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.21", shell_output("#{bin}/swapdex --version")
  end
end
