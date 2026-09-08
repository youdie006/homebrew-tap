class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.153.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.153.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "0cdc2fbd0f3be1b5cc7ec476865584870a34a46d19bb2bf8b04ef5c9481863d3"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.153.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "a546955830551ccfbb4f3234c33bf6d7578b3121ea362c17f5f33999b74131fc"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.153.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7225af50de753311f113b82ae37dbf72ba514dd20e545d9a4ba2da05fb94e352"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.153.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "20e6a12610a9c70c3f8d703306f9737bd60038133a5e1bc1e3ad7031f4bae24f"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.153.0", shell_output("#{bin}/swapdex --version")
  end
end
