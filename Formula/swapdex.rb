class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.24"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.24/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "606d400deead19c77b9a9c2dee880faec1afbd29685d57b51576aa2cf69db990"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.24/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "d4d935331691c8d767176470ef655b6b1e89acece0a2af198d4207cc42065a79"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.24/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5ad624c556807ed652f5bd424c89197e0db3ca4ee06c4f4a7cde57a00c5046ad"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.24/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6363b18050b26b9b94b4d81fb99890e3b69e96841adcb5206883bccce14b9ee1"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.24", shell_output("#{bin}/swapdex --version")
  end
end
