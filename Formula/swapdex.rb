class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.134.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.134.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "fe889e0b6af26222ea9a4166b440540a2c7e739b7b6e4c7f2891be283ce24f9f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.134.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "0d39c0d7d9ada2a8244bb6d5d71434e701cd991586a729a1afadb9ff1e9fe7a6"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.134.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "80b835f1891b2cfe8d89daa147f29d0f34257199c14330706604aaa7bfd336d9"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.134.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "399f3573ab37c787129f0180a4491aca08db207487cd1926a6428dae18508ce0"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.134.0", shell_output("#{bin}/swapdex --version")
  end
end
