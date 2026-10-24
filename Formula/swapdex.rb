class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.26"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.26/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "403306b808845fe8eb11f5dec96603a311e792f3d8fce59387081a29dc3c947a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.26/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "0d0a9f569b6174a8a6be29eca5b75022d0551fcca4dcda8fd502a83e0dbe0554"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.26/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9a91c024ef7bdcc638a36b75681ae1c242fe37e802fe8a223b9d10fdbf7eb250"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.26/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3f94662ba841750f968a705b3b1c8dbf092c53ddf82b1f76aaf951fed3a111ba"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.26", shell_output("#{bin}/swapdex --version")
  end
end
