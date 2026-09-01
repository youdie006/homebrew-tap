class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.132.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.132.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "30601bc7dacb69c9e0424a176d03cd5bb5622e08e779a67cb616667d63f189a4"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.132.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "b5415150dd2be3db5e13a552700b172236e8cb379e2ddfdb4d850fb573ce467f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.132.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ac1b74363224ea0368d68a5430c96815d1d4abe80304bcf0c027d9aec16165b9"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.132.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "464e343e5bff43a211a6bcfdd46fdb581b0738ab8489ed2499c4894ba6a18ff3"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.132.0", shell_output("#{bin}/swapdex --version")
  end
end
