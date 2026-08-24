class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.75.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "732da916127117137c47bae4e8527880b639818ab29d5d5fa6405b62d17dacee"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "1fce62ef59af470438608e2295ca5b9a3d4e320dfdd45ee289ec1e40bb3ff623"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ac051fce7e97aa7fa6c61c3a6f9a6dcf81b6f968f15343ff32a913b491aaebaa"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "056b76d842405d733bb064f6e923b33853ede7de94f4a1bf49e6f4dcbe9f8c88"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.75.0", shell_output("#{bin}/swapdex --version")
  end
end
