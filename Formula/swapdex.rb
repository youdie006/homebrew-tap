class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.17.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.17.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "337fd02d99219d69e10d3fc1f5a5399b860cb57dba2e30c07e4c75188a8692b2"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.17.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "15937a4ebd6e3abc930d79d42fa098797f6aa2eff432567a008aa3045edc26e9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.17.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a4292becf5d2e2b32266c53d0889d6c6b46e9433074604c946fb03bc13cc4719"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.17.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a8e4d736e7830e52d63cc89a2ba573138e91d427309658db345783d5f1f9fa27"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.17.1", shell_output("#{bin}/swapdex --version")
  end
end
