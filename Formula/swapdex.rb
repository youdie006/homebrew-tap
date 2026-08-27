class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.123.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.123.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "fd4fc8528e5b31438e0742787141758cdbaf2bb918c836f478373cfbb1827bd0"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.123.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "f2f80a72e2612d09e7b9c26043d6204932e74fee21041afa47314d98edbd12b7"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.123.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fbbdab49956d7f0a5b579c48af3f27e545fc215d0263767eca197d5b8fae0c25"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.123.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "21824282df01d3834766ea96d3002b8f92915f6100931215d5e03b07969db8f8"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.123.0", shell_output("#{bin}/swapdex --version")
  end
end
