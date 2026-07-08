class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.18.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.18.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "3f2f2ac5f12885c2d7565698980e8ad6f80aa5ec26f62f54b40879389daee0a6"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.18.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "f002f861d517d1135218ea82b6122cad452b54dafe6a1f38ee71f0d69e4c5e10"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.18.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d9648a08f88b07647797223b1dd4c0c3daf136066bf3684cf473688de284819f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.18.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d37e16a23c709dd033dd955204585124fa2176313884ad3b550f87b50b524aad"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.18.1", shell_output("#{bin}/swapdex --version")
  end
end
