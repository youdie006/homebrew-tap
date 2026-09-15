class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.162.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.162.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "c0cf3747bfef6c4fa55463066163a5d008d4968cc9a653208cc3712818c7f294"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.162.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "5ffd64321c1f62bbe60173caf56d4636b64a984104df2a8805e8ef2d457c476c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.162.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f70b0b6469d61b6e435e6cfc479783ee074287f87c6e0759a447a0fdeb7d278a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.162.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "222dbedba1bec246dc99abcb495d4b496c1ffeb0bd645718315b179e66dec717"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.162.0", shell_output("#{bin}/swapdex --version")
  end
end
