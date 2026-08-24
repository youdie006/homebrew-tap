class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.75.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a925a6e9bd889dd64c78667510bdec63becf1b911bbc6f286e16571372b9ce74"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "00b45761f5a1106a086e4bf1070bb8d24d62d3ca002290ed7c27b7a073300abc"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "48fc27e9572d4d34287009f90b2db3b9838ae0a906b2709ffd061ad5fedc27cd"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1eeef2917a27906adfd255c7d0cedf129d3f86ee4fa69f7e5eec5baf827d651e"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.75.0", shell_output("#{bin}/swapdex --version")
  end
end
