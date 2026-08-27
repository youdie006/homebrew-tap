class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.116.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.116.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "f9a369efe6d386bd5d60770649d8ed3c9092fbd375bcc3650c59672f9a7cba2c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.116.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "5b0b7f6ce4483d1bae0c55cb93eb49adf5fa82e56c927ada675f283d55f6baef"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.116.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "093cf6746302246038182d35ac6fa100e508c2fc4fa0d7c18f4fdaca1ea92f36"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.116.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3ed5a2a183d46816416eb199f10977b6077c3bec2e1bd9c3ca784c87cb2eb23b"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.116.0", shell_output("#{bin}/swapdex --version")
  end
end
