class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.70.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.70.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "20edc56b7def03f8702814025395695acadc1b6be02622a2b64b9d5f7b36dbbb"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.70.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "311b431f867a26c04358c5a410c4cfcbb6e7cbea4601b31f4e836a0f1e4c5c5f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.70.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6c3192b7b87a35f3878a8e7a5d98115fd99d7cf6512e2909700f0c233fabf3ef"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.70.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3525b93f26169ee2d7184a037836b7d4238b9d5769c3b484604af1f392bcb023"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.70.0", shell_output("#{bin}/swapdex --version")
  end
end
