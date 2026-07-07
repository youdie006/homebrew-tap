class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.12.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.12.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "51dc8dc968e098b38c87724f44ff8271ff18f91f22e14b7289a525ee9625049a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.12.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "0980a8d2057e5f1dcf1874f0cb9ee787e9f9af16f2f4c06d27586afbee6086b5"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.12.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2cd8ee0b6302136d25b66592d2871d6d3c95e6a3ca36b13db6ee58083d8d3149"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.12.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4d86dcecc748ddc1f4925a77e8d6552afbc72531a7df29fd1c0b7a67efafadc3"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.12.0", shell_output("#{bin}/swapdex --version")
  end
end
