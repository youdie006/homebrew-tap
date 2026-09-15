class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.165.3"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.3/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "5cd9cd0bd75b087a0db098e9d3f65c64e89489001099f9a43bfa20a7b8a6b6c3"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.3/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "377c5a9856ad9d02f72282c38039e1d83b2804f74cccad319889856d00e560b9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.3/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ca979f3061cb68f6ee52ba3d670af0840717ead13e3809a030af78c13bc83657"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.3/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c58ed0d2af53da4226e38ad3fde8f1790ebb8361adaed7b0e5f106416072533f"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.165.3", shell_output("#{bin}/swapdex --version")
  end
end
