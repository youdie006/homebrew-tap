class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.165.9"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.9/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "bb68e8821e54c24b14e38f00c7f49ee11f324e19e0ce2e45ffbb821c2a834901"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.9/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "84bc5624d2b7e0bcdccc0b6317e0c394c255b279d91487a41de987b15d3dda8e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.9/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b8b66b18ef976c56809cf825bce9ac97ee4f2a5e34648703887a1286c6526422"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.9/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fc438b8bd70ef34ef9bdd4f08776ca5980bcb81f38d6a9079183e73705d5aa71"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.165.9", shell_output("#{bin}/swapdex --version")
  end
end
