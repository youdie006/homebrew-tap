class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.55.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.55.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "f1e957f1fcb46b2f35b7ed89f636d81e6600d23f77e2a188f196f0b5c0421387"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.55.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "c181b080b55af7f404bcbe9187867d17e07512703f77803295255dc0d7f3aa11"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.55.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b104f0d38a802a2c15ad5123b5300a7e4c00ca637779917af13bf7d48e1b2272"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.55.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ad598d95f2b33d78220dce2b8d1b04b80e8c35a15db6a427eca75d1d76f98305"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.55.0", shell_output("#{bin}/swapdex --version")
  end
end
