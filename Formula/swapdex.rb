class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.121.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.121.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "17dd979207cae0b3de491223443a66dc428cf8fedceb5e5f2dc265f60f5198f6"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.121.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "52aaecb2da059e1133ad267034b403c8efa44039f6f1730c50bbf5a3ea9940de"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.121.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4ce8df3be2dc0d1377e9b0fc587d39e6f12321a49a05e22eef412aa8bf9ec87d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.121.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7ccb6560613431747f87d4a35eb46c54cdcef68cbfa609c13b8935008ca17f9e"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.121.0", shell_output("#{bin}/swapdex --version")
  end
end
