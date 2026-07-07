class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.8.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.8.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "22f8330f1298dbb8896adf392a7ebf57aab06ee4c08922eef248c32f0424520f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.8.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "f1e0b5cb0b881eca98f9f2fd994afaa5ad807ad43734d0e94aa59792721e79d3"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.8.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f1469c3c51f6b752bc9970398c6fe94d8d08758ccb95c9c5d7caf359ce882132"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.8.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "38935ccdb6e6dd4443a65929884d4fd8fe7d3be54d1862c81d2855438559ff05"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.8.0", shell_output("#{bin}/swapdex --version")
  end
end
