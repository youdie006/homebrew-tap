class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.58.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.58.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "495bfce7590371d4c9f04ab301e98bcc75dea76c5025a464cfddcef988b4a150"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.58.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "5253b480a1d7aaa4aee9a085a000b51865ded70938ef7606b158b007b8627d52"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.58.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a80ffe419adb7862e25064ecea35bed6a5891e384e21cc08180043b2521c8bbc"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.58.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "623621c511fbead59500b8de1581465e9e81465c22e61ae11fc04157ce687318"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.58.0", shell_output("#{bin}/swapdex --version")
  end
end
