class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.141.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.141.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "f4bad21f6cc0a2a454f51f5847c1c5d9c30d9cd180ba322410c416adb62901f0"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.141.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "779f4af24007345564088573699702013f5aaf879c6f91b1faa7b97a13b3a1a6"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.141.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0131605ab73076263ffbbb09af2a22085a43685b808f7bbd12af913a82c6df16"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.141.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "16c143eea69290dfbcb643a620e616f34bf046162d31a5e4a2e0f0b9fbd9116d"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.141.0", shell_output("#{bin}/swapdex --version")
  end
end
