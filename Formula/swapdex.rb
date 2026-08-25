class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.105.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.105.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "afab6d8d5f361f3e9078b7ffdba9a4a1675c7a4b488ebb5b4bfccc68306ddb96"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.105.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "577ea54af8ffdfc4c87c002fe7602f4fbb88cc96fe39331957732f8465962475"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.105.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e807384cef1805e036d84c463e99b194d9ace7eac4d197b7926b6c6758ff974c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.105.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "016147d103e4cc19d2e40e8232d2b1c1883af272e056c500fdfaab9b8b8a828c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.105.0", shell_output("#{bin}/swapdex --version")
  end
end
