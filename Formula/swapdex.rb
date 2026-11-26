class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.43"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.43/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "335e1ab011ecd372c6dbb1c3555ac4c0d45c1f6412d81f3c7a46c6677ed64336"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.43/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "2336a7a482c05138d39d6289505f9ca695da6c5dc22578e7f852b020c1085163"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.43/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "16a9cfd4d50d80c5e98796f7d72e1c202c846ad754af7ef7f9e8ab6f930c1a2a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.43/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2d16f326ede8ebeeb240eccc73c9b569bdf62e59142526e7828b27bd94ae73aa"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.43", shell_output("#{bin}/swapdex --version")
  end
end
