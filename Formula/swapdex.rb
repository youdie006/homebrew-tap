class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.104.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.104.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "9702e2d34a4f1ecb12631e7e4e49378ca0ee2089b1a552c7d683d04696a86a5f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.104.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "3e8579c276255cd3d353be0a9f1175b786c3e6c523a6960142e320c790f934e4"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.104.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f990f92b5bc05141650a4bfdaccc3e78c0f59529fa90de4cfb3cf5257d0a150e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.104.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d9a295496baf60af05f07d53e4586afb03f5fd67ea9fd4815f46905f22d185a9"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.104.0", shell_output("#{bin}/swapdex --version")
  end
end
