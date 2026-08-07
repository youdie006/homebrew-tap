class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.35.7"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.7/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "947709ffeb353f0c81f007f4b3a8a50f3df30369586ca0879ad7e08029f9ad5b"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.7/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "6230f385977cee3be43ecb500870ac98d7ebe3d1466209e3ddeada26c2407a01"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.7/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6c5207ae576e950d033fafc381da41faf55461e9410c2510b9c1ba4707819128"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.7/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "feee446c8594fa960f641d6af2777f520b19378463a16620f18d0ec51c5ddda7"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.35.7", shell_output("#{bin}/swapdex --version")
  end
end
