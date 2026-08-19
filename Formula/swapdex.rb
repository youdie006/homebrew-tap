class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.69.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.69.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "d4d19607b7ac338dcc1969f6f723f43dd1cd07e7a03b5bb3481fedbf6ba8d43a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.69.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "a07ffe4342e4bb4c47a3d8a38625cf83db72dcd84931667635373c116304bd8e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.69.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0e8c6273e78af3cdd088d2c10419b76695b330f3116823114776f992306c3959"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.69.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "74e8eba341732e937789a0bd34f1ba2c6ee997c251efa246b8672c80924c926f"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.69.0", shell_output("#{bin}/swapdex --version")
  end
end
