class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.35.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.2/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "799e248ff982aad9d702393005089c40edfc59c42ec41e28711811dbbe8b4ea9"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.2/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "677e8ca634a53f4711226e19a516a2467f639e681f664ef961cb6960ae349aa0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.2/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a4d5f04d5f87a12e27661d59b7867e7364d2c4cae1bf86cdaca544f5805f2394"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.2/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bd07f9a242e77d7e32c2ad59cdd28a9f45804f8adb62e2d784c80034d5964319"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.35.2", shell_output("#{bin}/swapdex --version")
  end
end
