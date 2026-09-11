class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.156.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.156.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "bcbbbe25328d364c2ae52a9bdf029e53e55e2d0f8696d20da30a5b356220660e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.156.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "4501c1ddd1aae224513f35e8d3f866a81480b16c03beb26233fee99da61b3882"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.156.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "497f79336dd796c9c15da9a8e3ddd1f1f0b7ad218df4f7c8b4e1b557028ecbf8"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.156.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cbe29fbe37ea566faf21fbb254d717eaaeea0190b3a4b4ff4ebe78785e5ed641"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.156.0", shell_output("#{bin}/swapdex --version")
  end
end
