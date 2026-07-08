class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.18.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.18.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "2751605d08aa64c0bad3bd3718300fee463f8404fa0b4ca8350dfb8448381b5f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.18.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "dd66f05f47595eedf5e2b8674a508a97dbd0d8b523a4764974b501062af615d8"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.18.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "16d05e4470bdad3f3098fb3e00f258624b2806bcc9f3df98860aa95b8a21b234"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.18.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "86674403d867a53a56fe831c6292cdb62dcac3179184c1fa947c6a9b3aaaf578"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.18.0", shell_output("#{bin}/swapdex --version")
  end
end
