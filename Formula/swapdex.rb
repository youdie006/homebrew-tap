class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.144.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.144.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "38879490e36c0513c604de1664a552be306b7d47700d980beba899e59ca20190"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.144.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "7fb8df17fdabd3248d198c0d033c27df9224b050b4678109263188d3437cb568"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.144.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a92b4649eac3cb9104b035c7a6ac50e86160213d20194fd27576713d32d27490"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.144.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "771f11ace52a97b385540300d5123c8ff91127019c600156e80af4c175505565"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.144.0", shell_output("#{bin}/swapdex --version")
  end
end
