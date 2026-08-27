class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.124.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.124.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a2e5bc24ec14b472bf8a12c7633581510a2f9a27e3d690181bd49bf86f677464"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.124.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "c97a83b636b53374c7bd9114860fee54dfba3d7b6ef0c09e3f2eae39a3468e0f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.124.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ec668fca3b6942ceddcf7d79cbc2b9e0f087b7a40e7d1254c7b3185467190a2f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.124.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "803ac836bcfba15ddfaaefaf9a4bc457c60a7ce2dc5fc2d241242d5113b07604"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.124.0", shell_output("#{bin}/swapdex --version")
  end
end
