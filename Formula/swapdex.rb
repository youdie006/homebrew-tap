class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.25.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.25.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "c54d337680b8686fa30d1b26b5fc39e292df4db5cbe6c9888ebfd351e7b4898c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.25.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "b3f830fc9bda3b35accaae472756939b1fc39637232db45a61ea358c1af584c5"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.25.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4c274db50e4e39f7af5cdc754fd6b5e25519bd8c9869574e7f07a2ddfeb6152d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.25.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0d2f6dd312eff7263f061ea43f81c7a3ef6da13876fe88b76e32865b9b933b1c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.25.0", shell_output("#{bin}/swapdex --version")
  end
end
