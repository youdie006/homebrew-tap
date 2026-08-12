class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.57.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.57.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "6c9d6fd581dbbbf5110d288614aa1947736007a5d76848979107376c71dd911e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.57.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "c16d341afca7f1b5f393a554879ce367f6caf67c00483b6149d03e4ac7352531"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.57.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3e699f4f0833eab5e60ff3bfa36dd9f9c284dd7e589f3f14d41ea3f3e383c083"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.57.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "38de8d2a649d43bcfa152ee49f47cb942422687cf9b968eca38470cb8a2247e5"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.57.0", shell_output("#{bin}/swapdex --version")
  end
end
