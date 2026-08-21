class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.75.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "90bc34f5bf5259b755f757767167b066687a8a3742aad772efc5989f6bd81700"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "880d2bad13cb9d7dad4e195e01e8879c5ad774d35b9c62844d7ab4d69ee48e00"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0e8ea78209ec1a719447f4691d7c4bebee2e47f63823f6a2c2badb5af18231d4"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.75.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4a715a3b8409ce939b8f50ade931473b982e61b199344a3dd018e017a9dc23ec"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.75.0", shell_output("#{bin}/swapdex --version")
  end
end
