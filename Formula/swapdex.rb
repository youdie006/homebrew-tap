class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.140.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.140.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "58f793a683018882290faf27313ca1ad2e42df459eb955696e24f7e530512877"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.140.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "d01a65daa52e464fd6e31c7126d6b14694145a8b8c1eb72b44f203eff61abe26"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.140.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6f37e393c3c9b68389f1367dfaced8a68c8c5f002fdeb7e507cf8e50d8b02f00"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.140.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7a5a32a64754e17321e0b26198f21c3dc1195c937244ed3a3aaf8e168e889373"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.140.0", shell_output("#{bin}/swapdex --version")
  end
end
