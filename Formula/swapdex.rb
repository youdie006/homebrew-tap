class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.106.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.106.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "6259bd58a52ffa11205922b20043332e1c33a1171ac86a1313f96707ca9e5384"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.106.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "bab01b46c6013f36dd2f29620bf467a4cf5c367efe387f82b2b40478ff689bfc"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.106.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e76db4f948841cadaf0c4c34ac7762a8f6453e15c544e0f8e03327e13d7a8619"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.106.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "439f7811ca342a3ee6d33200c8f2dd6448ec0fbfec0e8e786290c3ab7ab2d71a"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.106.0", shell_output("#{bin}/swapdex --version")
  end
end
