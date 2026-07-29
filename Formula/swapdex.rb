class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.32.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.32.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "ce5aa4c0e8a20c18e72e4015a2a492a423812782a7b2cd1f50de242becbc90cd"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.32.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "ea0618086f07605b386a1fade83ec7f7d29cf53b479f57a92924074503291000"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.32.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0e9713332096dbd67a90044572bab956eb8cfdd6d19e811b0f1aa0e7e7fcae35"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.32.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6324b6447a458e3b9930ab6322ddd45907b0cccd30bcbed6f1a299ae6c7f2a06"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.32.0", shell_output("#{bin}/swapdex --version")
  end
end
