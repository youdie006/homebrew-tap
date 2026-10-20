class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.20"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.20/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "752aff87e71e1f4de95a8bd02d300be6e7b76453ed2640affd0026b928c7ecd1"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.20/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "8b8b1ea0e2133898bff300df000aaac74674374bc794b23f38b7e5ff61bc5e38"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.20/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "79b934418511d4172dde3af8a8d27800fc9dfebbb42392bc651402ed41437462"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.20/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8a57fab965b0d87027d7b11554f7158119cf57926a45e6ee06b6440438ff02d3"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.20", shell_output("#{bin}/swapdex --version")
  end
end
