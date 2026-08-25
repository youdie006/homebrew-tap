class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.107.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.107.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "1789fd41e7b172da2b6cc001bd2312c930e3d6e043bca73c0444061efe7c5760"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.107.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "2c6bb9808983f20db1b58164d47bb2d860eb4dcafc2642d2059a8b4838770958"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.107.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5fa57ca6934994af4907eb5aa8f04a14b90651017b5e63acda34e9bc178eb5d2"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.107.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "253c0b337616e8ae86e301cff0cd220a400301a862de9939fbcd04f476d51a68"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.107.0", shell_output("#{bin}/swapdex --version")
  end
end
