class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.3.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.3.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "85ac37fa05c7a002f8a24857324036b8bd6bf2412dc70b6954c392bdcdcc3cdf"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.3.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "ac2b698cf87db3138c25bf15cb612961558cf74e9b4690266afd3ee5908390d2"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.3.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "15b1190fcc8aea97294d26356bd8c43b5ac24216fd7375bee1adddec23a80f11"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.3.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0de17b256e5b9f0883aef27065c01d46c9ef17b695e53f8ee7fbacb077b15eaa"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.3.0", shell_output("#{bin}/swapdex --version")
  end
end
