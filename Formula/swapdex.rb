class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.101.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.101.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "b61de58e89b9b76ec3abda713545345a838ed4ccd244cb77c2f1cf80c85a9a72"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.101.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "d6d5df2a12402c41db9d9ec4458b9d41909b8046a38b0e7b81b2331681d8e3eb"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.101.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a0baf4093ec4b699eb39d14cc7cb43b0f9f7e864a5aa4bf9fe85331ed32ca397"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.101.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d6f5be4e0186ad8bfc68ca7d321638e879d39543aced0559ee3aaeca2e0903f1"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.101.0", shell_output("#{bin}/swapdex --version")
  end
end
