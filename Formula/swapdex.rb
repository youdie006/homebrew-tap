class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.65.4"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.4/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "69dcbdabd742f0e1807a9b977f4175fc28fb91d4f9ed78dc45a3319495f70ec6"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.4/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "b5c47946b4e3bbd94d427c28056741073fb11033135bee3ecf7975459a5a0cff"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.4/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ef93faea9aeeebb8dfb910ad3028c276d41791dc544db577ff72bb8ba7dbdf53"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.4/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0baab891d64c9a5bd4c435c552cb7ad391a1ba3f1ddd31b3138a14fc4250c6c9"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.65.4", shell_output("#{bin}/swapdex --version")
  end
end
