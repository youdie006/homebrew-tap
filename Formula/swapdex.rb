class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.6"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.6/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "6b2759c08f7cbb40aec5086fef304429aec50ae04ab09c57274c60107afeabc3"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.6/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "a847cd15511501f90a2ed18307c94290e422f296aaf03c0287c16834e4c33537"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.6/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d9e67d77cece895c1a3a6a41fcd4e88cf362157ce02eb668a0652be1524ce8a5"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.6/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "74c655c806ad65e0f72eab2b17fa03ff273021bf08d901c09700a368e577e14c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.6", shell_output("#{bin}/swapdex --version")
  end
end
