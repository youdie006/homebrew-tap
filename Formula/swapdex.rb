class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.10"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.10/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "33c84240c167316a18c5973fb654175c703a4732bba1db41c2d7138b427d45b5"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.10/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "9979ba69ae2b5d66d662b1d87f900aa2c17dbc65bd2f94d3082820db400fbda0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.10/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d8135a1d5b0d5fe17a88969a1c076a03e02563cd4ee98e424f64ff7096756f39"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.10/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "79ec7e28b1fe160720031876d8927508e2a0001cb6c81ebc2bd33acb79943aaa"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.10", shell_output("#{bin}/swapdex --version")
  end
end
