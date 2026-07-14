class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.24.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.2/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "6e1d8ff3479a41e5260b6bf4a6a8066ca6ca50de7accf750018e35033a497e64"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.2/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "982b0ea13f20f7504f3a890080b227889a8a1ba106f7add6b890459b30c60c7c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.2/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "18b49cc385c3f2ede9840df10dfd82ae77ae903ddffa326f563e9ffb88fa71e2"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.2/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ba0b4f23cc2baded0431abdf8c8cfb8773403ed2097f197714a39b54dfb7a108"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.24.2", shell_output("#{bin}/swapdex --version")
  end
end
