class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.65.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.2/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "05f06e86d73dd8d57df62ae41721f317d97ee23d59e6c4580271b85b8418a0a7"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.2/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "fe7caebb5193af5d8ebefc65bc7d5b27bd735cc839747745b71d7f9781cbc890"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.2/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2540988728724e9be62b658d64b53b89f639b574b75cc45f0147713499bf754d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.2/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ab7d4464a60a96e3d26ae6aad2820133c619f688c2d91133e4c2e6fff9ab940b"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.65.2", shell_output("#{bin}/swapdex --version")
  end
end
