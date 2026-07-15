class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.27.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.27.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "891f53fb8685a14b81ae480ba79aead8b3ddda3cd64ca2bbfe7c710632116f16"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.27.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "f7afe138c66cd92af9d6c8297693a6b1bce9463c1663011ce7dfc0cd24269424"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.27.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f77c92f5de9608d04fd96f6f00cabfb4ef2c24b3c31c79ae43ecc235a96f26a1"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.27.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8d4d39a158ad39714d465094997eaa5d7911ef197775c52445d7a1ee4f59742c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.27.0", shell_output("#{bin}/swapdex --version")
  end
end
