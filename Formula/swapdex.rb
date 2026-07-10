class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.23.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.23.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "627445e2056c70afdafe5497f4dc4372a2e437b5fa76254dc3066acb28b1fa57"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.23.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "a4ebe196c89f34e316d8c8431fe63d5bd2c5999280d6840ae1082a45d96b48bb"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.23.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6783d3f7ffd57cd5a87009402fe4eed29436c7a2c163c17ee33e89215ca17258"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.23.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d71f120cba424a4bedbb6de3b95918af3ae73664555d32f634c65654e7415932"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.23.0", shell_output("#{bin}/swapdex --version")
  end
end
