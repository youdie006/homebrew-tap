class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.19.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.19.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "8aa67123c97c8eb114d6105a729c3d90c5a7637a054fc9d71e327fe414e8638c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.19.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "d31eb39f23fc8591158e8843f6dd67cb13109df99d83675bfadc945d79e48d65"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.19.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "56f08bace36adf7cdb354072bda154379b7167ada749f0c890260e1a11593628"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.19.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0eb3eb69e194fa374ff959410b3546158270c7819d81d06e57492ae7e78bb095"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.19.0", shell_output("#{bin}/swapdex --version")
  end
end
