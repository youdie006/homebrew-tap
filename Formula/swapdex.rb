class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.143.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.143.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "23f09f8eb60928c82b4f17727d9cafea5f20820fab8fefe39edc8ce342905388"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.143.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "938ec301bb2f485d0eb467e174e1553df69b00a04999383e9c20175e7b5af00a"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.143.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "eb75112eb3f415c80c7141f513976f67ae1e44004cd37ae6d72b0c39e0c2ef5e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.143.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "675963478e4479f041674ab4f1582be7558b17baf5ccac42d0ead4e718e8fa11"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.143.0", shell_output("#{bin}/swapdex --version")
  end
end
