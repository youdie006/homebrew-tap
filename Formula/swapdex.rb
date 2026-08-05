class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.35.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a095db555546ce5e363f57ddd591f17b80d0dfa01450dacd9c3d512331521fbe"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "e8f27369c088f2bad555535f789b07ae1d6a6c714ada0ce64aaf99fa4f6e1c11"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "64caa9901899b32b37b6b4d8f4e0f9b33a8dbb09b2fc6f354530cfa67cdf7f6d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6612887e5a6b0c38de795d55164e06221f56e93460915d7b55cf5afa8b1a3c9a"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.35.1", shell_output("#{bin}/swapdex --version")
  end
end
