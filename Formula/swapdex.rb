class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.49.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.49.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a4ab9d36eba485c1ff2f93842a99632d5610c7a45d74d4fb60d6b116014211bc"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.49.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "58c032fc9223762d570bb9b379bd68cc645bb120e477cbff513d056dff6665b3"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.49.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "74230cd775d90406d70d1745f9cee68a8a0365d8b6e9c4df63b3c11a413be0b5"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.49.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8b22dfc6debd7cd7c9796b2a8de999385b437bf28dc382d5ba7ad5ff0e79901b"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.49.0", shell_output("#{bin}/swapdex --version")
  end
end
