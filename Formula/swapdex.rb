class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.16.3"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.3/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "53c959f2ce7b8b761ed6d45ad6fda9d085772eb51c86f757bf6afc6f25786da0"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.3/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "15caf1d0f75d86d93a1f30e5e2f14a85420fe8298a09de386bf9726956451f62"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.3/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "175d2e59ef1bd034b77039b59d4b83c66f963139e6809656332185d9a6f2403c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.3/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "554bed5a0fd85efb347c7ecbee6888eeff8572d6c3eec575dd4fc64c41345f0c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.16.3", shell_output("#{bin}/swapdex --version")
  end
end
