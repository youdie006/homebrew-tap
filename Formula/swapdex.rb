class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.150.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.150.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "d942f631d44ca740daebac8675a9189bd8d102e61764a203a401b8d61bd1fab4"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.150.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "ef396938f1de2078a3f3963f8b0462defa09527c9c6f0c18fd0797ea810868f9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.150.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "eaa3a26664117ad4c2be8058659bbaecd2b5ee984c1b93e769c20502bf2a2d9c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.150.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "acdf6e596036beadf240fe273344d47496be9d533bf6a4a7d7c3e77149334e53"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.150.0", shell_output("#{bin}/swapdex --version")
  end
end
