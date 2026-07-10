class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.21.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.21.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "08955f5fc5b57f2cbf09db1a5085aa31c88337259e63997b2ec3caf1b36ddceb"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.21.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "36d36c7dc0b33a8d84632c484892e0dee978f34a3bea4733efd2895576d69fa0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.21.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f210d9ba387cf9a39dc4aeff2585f092ba76596262306731d5297e7da4a5d72d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.21.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d495c2bf8a10f6c74b9e27856464cb5b3e2aba0bb7f1be4b5e12147aeddc7a88"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.21.0", shell_output("#{bin}/swapdex --version")
  end
end
