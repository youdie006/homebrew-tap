class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.42.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.42.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "10853c77134468c411966cade8a9b04d372d6dc5d6391c58d300eb966bb2349a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.42.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "23c9bc9a4110d8042a4183df1198b76296c646b5ac5f2f6ce2ce736cd94c8f6b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.42.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b1fb7e2e280cd2e6dd1f465e41748b046903b8030873d6cb973b456d7c1ef10e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.42.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ce6beda7a9750f193bc68437f68141d46aee54ae8e571bc763ac5fd3b95e8211"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.42.0", shell_output("#{bin}/swapdex --version")
  end
end
