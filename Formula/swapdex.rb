class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.135.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.135.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "7abd669882c7b96ca7b30b8f733ad5f6bd898e6583b56c32d6eccd7827094eab"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.135.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "ed143b9ed618b81c72f9cbc496a7dcba25afa47e4c346eaafe9a1843c8aeb6a4"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.135.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e976fb191fed7b8115f1bb575888685a2057f30919f63b1531aeedf81fecbe6c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.135.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e9b26518df43ed9d275cc51137306c518fb9f0f41c1123c8f4e8807459d47619"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.135.0", shell_output("#{bin}/swapdex --version")
  end
end
