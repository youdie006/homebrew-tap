class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.128.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.128.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "53b02b5b1588fb76af54752294efddb9215c87b333511a29b16f604b84896067"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.128.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "13736d66b4c7f407ffce253eacc40b305173ca8cd81e4b405cc19fb9d447a822"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.128.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "76c9eb8299b5bd0b67e1f136b691c95fce9aae95a07f0358f9d36b2fd7683a21"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.128.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "40ef988376d4bb9f377cc093d5156a38f1dcbb038e79d43dae73d792d18382a7"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.128.0", shell_output("#{bin}/swapdex --version")
  end
end
