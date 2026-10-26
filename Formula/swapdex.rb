class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.28"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.28/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "32699b12a7034a960453d0487bb685a1ce750d33fc554273831a5ffd4cbfd5d7"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.28/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "070991dcce8bf8255caa929ddd8aeeb5b0dd7adce9e7bee317b8f5e70971aa9f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.28/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3e2b730b8b349c2af7091f7416fdf1beeb910ef9ee3bd466dd0c4cdc5250e3cf"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.28/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8eb639b2a54aed74802b582226f5892f490a9494d2d687836313e744bb192b92"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.28", shell_output("#{bin}/swapdex --version")
  end
end
