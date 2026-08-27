class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.117.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.117.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "0296fda2ca5d0fa472277e1453a63ec5df5e87dec6af4ff5810cc9552405b512"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.117.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "9378ba79a20da0c49b4f4980a023920661512d35b2fa7a6a665f22fa312795a7"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.117.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c62dbea00d8c7c98d046a92b2006afbbf1f91b85364bc01acc1b8425e6bc3f8f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.117.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7111286193cfeb0fd5498ebfb29c635e1abd26ed101152761201e6b3b41eee03"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.117.0", shell_output("#{bin}/swapdex --version")
  end
end
