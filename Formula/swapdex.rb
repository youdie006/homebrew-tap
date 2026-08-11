class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.47.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.47.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "103dee5dd7a80b5293d37dcfb293dece159476ef923c350a1154d56003af8e0a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.47.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "8d1732b8badafbd4a36b6e5ea8451ddb87c0586bd5fb10def8081b12f81306ab"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.47.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5e48571b10fc492b2018cbe521cf24038896d4782a27680dc6e696e0faef372e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.47.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0d421fb8e39740f4b024c4a35f57fbfd3cdba3600fd895f84a239a115588e2c2"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.47.0", shell_output("#{bin}/swapdex --version")
  end
end
