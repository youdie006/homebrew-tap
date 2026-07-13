class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.24.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "40341fea91690bd1ff6af1be9a55dae481b15ac170b317959cf2fb79595bd899"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "f8018738381afcd1fec29cd785f4b23f37cc804da6f002e5167239ccfe32dbf9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a4dc76063b015bd7004c8e63b176e18c7847aecc873affdd03d095cb7ec71bf2"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bd1a72912aff3990a573b9cab4c4f1473c512c58ca8be2c53696df60bbdc32a4"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.24.0", shell_output("#{bin}/swapdex --version")
  end
end
