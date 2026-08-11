class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.46.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.46.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "5eb30f3a0cbfea4d444837bea5a7411448d591578c37f8131b11b74d9609b2ea"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.46.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "2e45432d7294379b472d3fe956e7ce7aba8996a22e976e06b8e4b393334275cc"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.46.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4923b607ae0421b7698d663f6c4d9f7314d70c7ebc6bab6077666bb08b839d43"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.46.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d6fee35eeb0e42f2f6c23e09fbb0507b43864475dc4d8d91227bc3d93db6f68b"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.46.0", shell_output("#{bin}/swapdex --version")
  end
end
