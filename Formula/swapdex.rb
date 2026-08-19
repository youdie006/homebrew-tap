class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.68.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.68.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "b8bb38bf62ef1cae99fa17948b71f18df7f8de29f40357784bc88707846c55ec"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.68.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "5cb12793bfdb6fcc7f3728cf5ab465ee6531273bfcd1518fe60df6ebfe86988e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.68.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2072dc1c7a244d502bf8491e7686e6697901910424b5cda3edce76930856ce9c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.68.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "def50db75af42ed573e515ad6bcfaefb8c210264badc562405742a531442463d"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.68.0", shell_output("#{bin}/swapdex --version")
  end
end
