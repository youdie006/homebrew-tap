class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.34.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.34.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "c04243d1f25d5124022277cff9005111847869b0693628152367d77212e03108"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.34.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "d5f779c35d6bf9388aca4965e99a74afc4a698538e7825c62e27fd3cc369b288"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.34.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d31974dc47c5d0b8805318904fd5841b22200a7ec42944614ffc92735d587db4"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.34.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3bb283deddacc275c9acb1f3c9018b058cdb07683324f39c3b94d3bc356c8f95"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.34.0", shell_output("#{bin}/swapdex --version")
  end
end
