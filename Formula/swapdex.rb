class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.41.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.41.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "498bfa76b717bed83417c5c2688ecd3f252775b90eb76f51942d6e4e0ce5ad9b"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.41.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "3780d33f8f5823a3de03760e853367f64f01c5ddd3c8c832d0ae78a16bd6c170"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.41.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "775b32c3f7d72b5b99a7762aeaced0a84c775368c0644e79a31944725c8c25ef"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.41.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e82f636a8dac740aae07b4f63764208536d62d0226f8f1f85244f03b401f9f1b"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.41.0", shell_output("#{bin}/swapdex --version")
  end
end
