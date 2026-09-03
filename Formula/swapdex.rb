class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.137.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.137.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "70bd682758fb65dc419076a0f5eea12adb0ac79d1abd26b8bcefe0dd900b834f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.137.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "62f01cc488b9af0b61d30dc6c0478ea7d5e75138a8cff8a3649d7502b23e18e2"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.137.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "de89fa43ca62853e7a903991f970bd0833bc811de11edd2fa2778be210d20e1c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.137.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c2bfb81ab5745ec71f2ef2830df3df3a4b2c75d01ecf07e54bee0239fa36ecab"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.137.0", shell_output("#{bin}/swapdex --version")
  end
end
