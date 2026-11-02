class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.34"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.34/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a0742c07eb80eda7b95f36d2e52bedbf6308876b7552b5d6666fbb0aab25612a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.34/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "8f2a3213b5888e135532ebbe216ac51c138deb065d6b9e4e1e326a5968ca3eb1"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.34/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d7467d6921cd3c748a8cf101a0c060b16bb02be90f2b9d70d61b5a3a1659bc92"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.34/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "418479fdb7a5f4252d7507142d8145bba0d6189b6df5d138dae61816ba399ebe"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.34", shell_output("#{bin}/swapdex --version")
  end
end
