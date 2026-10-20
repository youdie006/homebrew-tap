class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.22"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.22/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "68906634246fa23049240d4ef1da5c1b065184da4b10ea9c5f4fdcc6a66a2a73"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.22/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "3e643786c63cfba88201513298bba0c679b285358423ad4d4f8827fd5c029030"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.22/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "10730c5e3cc06f7db885448fa8e825b58ca1c6234fb81b2e971ad4735d704230"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.22/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9b67e1b656bd2c55fbd2dd94f9fa4e9895bb1125e3c68c0c02abda92c7285537"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.22", shell_output("#{bin}/swapdex --version")
  end
end
