class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.154.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.154.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "f6d12a1ee9a393edf883dae49ea61e7d0566cfc810ddc0b1018813d4b4ae1529"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.154.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "7bf9f5b8131b6b4edfd17e4216ac93020e2343ab9b156d669e6e64f0c931483c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.154.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c492c5b39bce490225d5be853c91e6a002f21b67636d216e856548df2adc5ab3"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.154.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "774ef852642b4c1b43c5f9e8b46542d78aa8528dc0ea073c06ed364d42505062"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.154.0", shell_output("#{bin}/swapdex --version")
  end
end
