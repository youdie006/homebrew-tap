class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.66.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.66.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "ae10a41cdc960f754e3ccf153a138a7dddda40e4588fba8e8e190feb32181192"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.66.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "605ac33554cf9940e06500808c96ef28e45703035dfdfb9b578070aa33406a37"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.66.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7ae4e80c419e7065cf80ed4230c05156939015baed8231ddfbb31a2568d15097"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.66.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "473074145a8189823b1a4da42a1cb55520d8571b186b529690d07f8150ef5498"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.66.0", shell_output("#{bin}/swapdex --version")
  end
end
