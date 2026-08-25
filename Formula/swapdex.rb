class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.108.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.108.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "165f59af0666e6575fcf6f18f53e85468bb745ea544c5e21ce00ba897971e933"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.108.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "945511d29b5cef99674f75a65e5ef2608d67d207471e1b94627918db376c57db"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.108.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "291ab1685a8da7775c66af8978c41e49e5b1a1c234084453f024931676009544"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.108.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5869f739926296fa12f90c9fed10fd79206562f70a5406f77f5781839b8ca3c4"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.108.0", shell_output("#{bin}/swapdex --version")
  end
end
