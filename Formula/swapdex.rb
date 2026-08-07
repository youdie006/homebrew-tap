class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.36.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.36.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "741f2c64b6e676b40e08a4cf31cb068bdfc79b3872b87f2d3375150b6b4c681f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.36.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "99dfb3af564dfb2abeb1f330c42139bc5e08625b1c6e86032310a11086ce510a"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.36.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "40ed575ada40e86114813cdfa18bf0539335fdfdc743b2e544d57586b820b8c6"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.36.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ae3c00fc5bd732c548b1471f6d126210ad691983e377b95101b5b542e7eb9285"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.36.1", shell_output("#{bin}/swapdex --version")
  end
end
