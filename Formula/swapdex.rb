class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.165.5"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.5/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "3bbbba03af36b40a04db0b80222c9091724c4cc58ecaeaeadb113f03ff09c6b9"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.5/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "dabf64dfdc8162ed9ad1ca00b38333527486438da2b565d0b0c515441cd3fb29"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.5/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "53b55635e059f7b0faf45820f887b9b31dd54ff47c9e6643f65a4e7e5af22fa7"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.5/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "926eb84486689ad29e470d7c939240993b345ff001872bc0d7ab5da4e9af6124"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.165.5", shell_output("#{bin}/swapdex --version")
  end
end
