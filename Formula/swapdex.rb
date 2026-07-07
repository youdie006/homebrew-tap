class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.4.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.4.2/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "146578109e3e5ee615372d06328dc06d984ff2bbfeea60f9d039674ba7dae649"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.4.2/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "a7f442d5f63fe3022b1a6fbcb3c83aae2795bfc3e0899c9b2804fe2e946541f9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.4.2/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c4aacdb3594f9cd4b9db698ab07d5d1335a6f896455947cdd838aaab979632e5"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.4.2/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f938096a5bb5df5dc63909608ab17e6be563e6c6cf1f8563bd07a01db5135753"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.4.2", shell_output("#{bin}/swapdex --version")
  end
end
