class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.16.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.2/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "7586b0c0cf6b53b4879aaceb2e5889ac86479e9e465da45beb0b30141fd0ad34"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.2/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "24919947c688af5b8eed15771465609b14820c5ad6770e189cc58a2ed01b68b0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.2/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4199e497e86b0083d2bdcc536acc2187123fc993de36479857ecbfca6ca060b6"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.2/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7ac8072079800cdf63865c0814fa926dd52d856a3d93b9d4591dfebe34ba873f"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.16.2", shell_output("#{bin}/swapdex --version")
  end
end
