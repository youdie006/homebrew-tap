class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.148.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.148.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "09f70bd284c8d2eed91f1d5674275810ea32b1d8f10815d99e7ffbae490c2d16"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.148.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "6c2bf6ca898f7ed36562237f5a03c63c5f715675ffea2f4324dc04cedc649318"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.148.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "951b9157237623a70008df4f1cdcebc3395c38bd309a70800c7b533be5d714a5"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.148.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3aa0d10c83c6899e7dd82b49e762cf23b22baf39233fc514960d22ff5b536b8f"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.148.0", shell_output("#{bin}/swapdex --version")
  end
end
