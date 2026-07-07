class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.10.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.10.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "e40c91b405ca4d3631f132b40572ecf922421b21fba28eff68abf0a0c1b1c273"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.10.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "3e789f8209ffea40849c86ebeeae231c9ee7150e551e7cb15f9a1986cbdc9522"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.10.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b437573a15081db45b6e6b183de6fd115e3d5efeee6910ea57f874e948ae0d47"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.10.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cc2b72513dfbf96c5a19b6252de799f28deb29707286251e0122766342214ca2"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.10.0", shell_output("#{bin}/swapdex --version")
  end
end
