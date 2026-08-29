class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.126.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.126.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "f68e52f13f201b40248be332fdd4f3249765fa09f67294c6fb42232331542127"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.126.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "51ac0d3d12e5915000560f6215a0e97538743fbcb196c5a3dc62769d6c5e508f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.126.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b0ccfde021ce1d71e80b5aa0d7b6029175045b2215c26236ec4d780f666c305c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.126.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c6192b52ce784bdc5a5070945b98a0e2c6ebf876139e9799b07486892cfdb849"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.126.0", shell_output("#{bin}/swapdex --version")
  end
end
