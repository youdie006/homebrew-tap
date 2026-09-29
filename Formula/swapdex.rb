class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.5"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.5/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "ae4958b89b8807343b881c67cd52819fdc2abc76760db2fff43fff223f439111"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.5/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "52baa3f1486b1a4491c6ff17425367884f721a341bccd9cff2cee23817b25a1e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.5/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b9146e6f1c47b271ac8a72dee2285b53787679dab2d10522e2025dfbd8ac37ec"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.5/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "89e17eb5cc4cd2d054d7df2220e3192da69c6fee753b9e32ad9cc296fb9e6c2f"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.5", shell_output("#{bin}/swapdex --version")
  end
end
