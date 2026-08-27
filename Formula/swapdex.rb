class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.115.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.115.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "eb27099a8814e6f6d10f9763e547b5591195584506188a58ba1406c43ad4e611"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.115.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "3ff2d56ae38c31587f8df2f5a05b41834bbe12c4771874739cf1e807b9183f61"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.115.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "88a52bd0844c37a4324a26b313051f91a5576e7aa8a7f99f6d34ec931fb607d1"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.115.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "41a6b0fa793c1af1bcd472915da7249c7c0ff07efa65769972d27bc193da0d86"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.115.0", shell_output("#{bin}/swapdex --version")
  end
end
