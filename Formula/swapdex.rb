class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.13"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.13/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "50c58559676c75c4c7fe89d0bd55f04c3b05aa0d073ea7ec3386ef6b036192b0"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.13/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "e6d04edea793617d0f0d12162e84ff89360a84ecbf1ac40a49fba6560ef34311"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.13/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "574e300eaad1ec6579a0a5ee93b36770a81164af5a761cd3223c8fa77cf10914"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.13/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b5fe4275d88c21ca624d669ef4c2d81e94dfa04081af8a59fff0ad1b6143e1f2"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.13", shell_output("#{bin}/swapdex --version")
  end
end
