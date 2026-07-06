class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.2.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.2.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "4772bce294716ee6a2fab3116a137758eab004f039a18fcf7adfa4040fe8fe8b"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.2.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "590f92fe94ebc64af2f049df8eee3823a61404fbefdfb113277942e4e0a39d9b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.2.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "44a98e4415ab166ed8c8b0381f83b7f264004aac339e5b4697fe232c1326fe54"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.2.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d920c475e40d0f0be615b0ad1a3f3b3759f55dc39c877e1e3de12804efa30d31"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.2.1", shell_output("#{bin}/swapdex --version")
  end
end
