class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.41"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.41/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "65e50d20608c4f4a8f0ece043258c1dcba8b4098b9da05e745916d7061d6d603"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.41/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "8b66f7edf05f70d42f135184a8b1b48a14f21d07a94652b317d8bafca0bb6487"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.41/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ccfcd1b18d28eee2621783f874084f8cf401331496462601d7e70e67f2b710fb"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.41/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ca45b2932af2b22981f1dffa1c1022aa61bdf17c886538303ba63af8d85b7a03"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.41", shell_output("#{bin}/swapdex --version")
  end
end
