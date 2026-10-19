class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.18"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.18/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "6dbff9539ff0f463ad8fd1d719f635847e9093ff0dd6d32a1d93f04dc91f1323"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.18/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "dce54f8456cc0a145f3f5413d8cf1cd00bc6fae583d91e9f280b4a99c305c693"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.18/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "62074c1eee64333183f60fe4d0f715a7b16b6d6c47341a2a8e54d72717157fa6"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.18/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1e42b157b7573a8b965c5cf156fdec0f2a971362b426917f3e100e24990d15cf"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.18", shell_output("#{bin}/swapdex --version")
  end
end
